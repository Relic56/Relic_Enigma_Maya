--Utility
print("lua loaded")
--HasCivilizationTrait
function HasCivilizationTrait(civilizationType, traitType)
	for row in GameInfo.CivilizationTraits() do
		if (row.CivilizationType == civilizationType and row.TraitType == traitType) then return true end
	end
	return false
end

--HasLeaderTrait
function HasLeaderTrait(leaderType, traitType)
	for row in GameInfo.LeaderTraits() do
		if (row.LeaderType == leaderType and row.TraitType == traitType) then return true end
	end
	return false
end
--RNG
function GetRandom(iLower, iUpper, sReason)
    return Game.GetRandNum((iUpper + 1) - iLower, sReason) + iLower
end
--Stuff for tech boosts
local tTechs = {}
local tBigTechQuery = DB.Query("SELECT TechnologyType, EraType FROM Technologies WHERE TechnologyType IN (SELECT TechnologyType FROM Boosts)")
for k, v in ipairs(tBigTechQuery) do
    local iEra = GameInfo.Eras[v.EraType].Index
    if not tTechs[iEra] then
        tTechs[iEra] = {}
    end
    table.insert(tTechs[iEra], GameInfo.Technologies[v.TechnologyType].Index)
end
--Credit to Chrisy - code taken from Ashurbanipal
function SCC_Ash_EurekaHunting(pPlayerTechs, iEra)
    if not tTechs[iEra] then print("Eras gone too far") return nil end
    local iRandom = GetRandom(1, #tTechs[iEra], "Eureka")
    local tTried = {}
    for k, v in ipairs(tTechs[iEra]) do
        tTried[k] = true
    end
    local tTried2 = {}
    for k, v in ipairs(tTried) do
        table.insert(tTried2, k)
    end
    local bFound = false
    while bFound == false and #tTried2 > 0 do
        local iTech = tTechs[iEra][iRandom]
        if not pPlayerTechs:HasTech(iTech) and not pPlayerTechs:HasBoostBeenTriggered(iTech) then
            bFound = true
        else
            tTried[iRandom] = false
            tTried2 = {}
            for k, v in ipairs(tTried) do
                if v then
                    table.insert(tTried2, k)
                end
            end
            if #tTried2 == 0 then break end
            repeat
                iRandom = GetRandom(1, #tTechs[iEra])
            until tTried[iRandom]
        end
    end
    if bFound then
        return tTechs[iEra][iRandom]
    else
        return SCC_Ash_EurekaHunting(pPlayerTechs, iEra + 1)
    end
end
--Some variables to define
local sTraitCalenderRounds = "TRAIT_CIVILIZATION_RELIC_ENIG_MAYA_CALENDER_ROUNDS"
local sTraitGreatPaw = "TRAIT_LEADER_RELIC_ENIG_GREAT_PAW"

--Eureka on project completion
local iDistrictCaracolID = GameInfo.Districts["DISTRICT_RELIC_ENIG_CARACOL"]
local iProjectVenusObservationsID = GameInfo.Projects["PROJECT_RELIC_ENIG_VENUS_OBSERVATIONS"]
function RelicMayaEurekaOnProjectCompletion(playerID, cityID, orderType, itemType)
	pPlayer = Players[playerID] --get player pointer
	--don't need to check if it has a certain trait because no one else is getting access to the venus observations
	local city = player:GetCities():FindID(cityID)
	if (not city) then --no idea how this would happen but Firaxis
		return
	end
	if orderType ~= 3 then --if not project
		return
	end
	if GameInfo.Projects[itemType].Index ~= iProjectVenusObservationsID then --was it actually Venus Observations?
		return
	end
	iTechBoost = SCC_Ash_EurekaHunting(pPlayer:GetTechs(),pPlayer:GetEra())
	if iTechBoost ~= nil then
		pPlayer:GetTechs():TriggerBoost(iTechBoost, 1);
	end
end
Events.CityProductionCompleted.Add(RelicMayaEurekaOnProjectCompletion)

-----------------------------------------------------------------------------------------------
--Calender Rounds
-----------------------------------------------------------------------------------------------
function RelicGSPOnNewEraOrEureka(playerID)
	local pPlayer = Players[playerID]
	local pPlayerConfig = PlayerConfigurations[playerID]
	local pCivilizationType = pPlayerConfig:GetCivilizationTypeName()
	if (not HasCivilizationTrait(pCivilizationType, sTraitCalenderRounds)) then
		return 
	end
	iGSP = math.ceil(pPlayer:GetTechs():GetScienceYield()/5)
	print("granted gsp")
	pPlayer:GetGreatPeoplePoints():ChangePointsTotal(GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_SCIENTIST"].Index,iGSP)
end
Events.PlayerEraChanged.Add(RelicGSPOnNewEraOrEureka)
Events.TechBoostTriggered.Add(RelicGSPOnNewEraOrEureka)
-----------------------------------------------------------------------------------------------
--Great Paw
-----------------------------------------------------------------------------------------------
--Utility bcuz am lazy ty stackoverflow
local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

function RelicCityCaptureBoostProduction(iVictoriousPlayer)
	local pPlayer = Players[playerID]
	local pPlayerConfig = PlayerConfigurations[playerID]
	local sLeaderType = pPlayerConfig:GetLeaderTypeName()
	if (not HasLeaderTrait(sLeaderType, sTraitGreatPaw)) then
		return
	end
	tWonders = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict IS NULL")
	tProjects = DB.Query("SELECT ProjectType FROM Projects")
	for key, pCity in pPlayer:GetCities() do
		sCurrentProduction = pCity:CurrentlyBuilding()
		if has_value(tWonders, sCurrentProduction) or has_value(tProjects, sCurrentProduction) then
			--do nothing
		else
			pCity:GetBuildQueue():FinishProgress()
		end
	end
end
GameEvents.CityConquered.Add(RelicCityCaptureBoostProduction)

local tCSs = {}
for row in GameInfo.C15_REL_CityStateGPLinkage() do
    local tQuery = DB.Query("SELECT Type FROM TypeProperties WHERE Value = '" .. row.CSType .. "'")
    for k, v in pairs(tQuery) do
		if (not tCSs[GameInfo.Civilizations[v.Type].Index]) then
			tCSs[GameInfo.Civilizations[v.Type].Index] = {GameInfo.GreatPersonClasses[row.GreatPersonClassType].Index}
		else
			table.insert(GameInfo.Civilizations[v.Type].Index,GameInfo.GreatPersonClasses[row.GreatPersonClassType].Index)
		end
    end
end

local iPoints = 100 -- Make this scale off something you twat

function C15_OnMayaCapture(iVictoriousPlayer, iDefeatedPlayer, iNewCityID, iCityPlotX, iCityPlotY)
    local pPlayer = Players[iVictoriousPlayer]
    local pPlayerConfig = PlayerConfigurations[iVictoriousPlayer]
    local sLeaderType = pPlayerConfig:GetLeaderTypeName()
    if HasLeaderTrait(sLeaderType, sTraitGreatPaw) then
        local pPlayerCities = pPlayer:GetCities()
        local pCity = pPlayerCities:FindID(iNewCityID)
        local pOldPlayer = Players[iDefeatedPlayer]
        local pOldPlayerConfig = PlayerConfigurations[iDefeatedPlayer]
        local iOldPlayerCivType = pOldPlayerConfig:GetCivilizationTypeID()
        if tCSs[iOldPlayerCivType] then
			for iGPClass in tCSs[iOldPlayerCivType] do 
				local pPlayerGPP = pPlayer:GetGreatPeoplePoints()
				iPoints = pPlayerGPP:CalculatePointsPerTurn(iGPClass) * 5
				if iPoints == 0 then iPoints = 5 end
				pPlayerGPP:ChangePointsTotal(iGPClass, iPoints)
				-- Do some text or something
			end
        end
    end
end

GameEvents.CityConquered.Add(C15_OnMayaCapture)

function Relic_Maya_New_Turn(playerID)
	local pPlayer = Players[playerID]
	local pPlayerConfig = PlayerConfigurations[playerID]
	local sLeaderType = pPlayerConfig:GetLeaderTypeName()
	if HasLeaderTrait(sLeaderType, sTraitGreatPaw) then
		local pPlayerCities = pPlayer:GetCities()
		for k, v in pPlayerCities do
			local pOriginalOwner = Players[v:GetOriginalOwner()]
			local pOriginalOwnerConfig = PlayerConfigurations[v:GetOriginalOwner()]
			local iOriginalPlayerCivType = pOriginalOwnerConfig:GetCivilizationTypeID()
			if tCSs[iOriginalPlayerCivType] then
				for iGPClass in tCSs[iOriginalPlayerCivType] do
					local pPlayerGPP = pPlayer:GetGreatPeoplePoints()
					iPoints = 5
					pPlayerGPP:ChangePountsTotal(iGPClass, iPoints)
				end
			end
		end
	end
end
Events.PlayerTurnActivated.Add(Relic_Maya_New_Turn)