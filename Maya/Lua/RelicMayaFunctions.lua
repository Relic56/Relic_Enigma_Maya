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
local sTraitCalenderRounds = "TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS"
local sTraitGreatPaw = "TRAIT_LEADER_RELIC_ENIG_DARK_SKY"

--Eureka on project completion
local iProjectVenusObservationsID = GameInfo.Projects["PROJECT_RELIC_ENIG_VENUS"].Index
function RelicMayaEurekaOnProjectCompletion(playerID, cityID, orderType, itemType)
	pPlayer = Players[playerID] --get player pointer
	print("Production Completed!")
	--don't need to check if it has a certain trait because no one else is getting access to the venus observations
	local city = pPlayer:GetCities():FindID(cityID)
	print(city)
	if (not city) then --no idea how this would happen but Firaxis
		return
	end
	print(orderType)
	if orderType ~= 3 then --if not project
		return
	end
	print(GameInfo.Projects[itemType].Index)
	if GameInfo.Projects[itemType].Index ~= iProjectVenusObservationsID then --was it actually Venus Observations?
		return
	end
	print("Granting boost")
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
	print("player era changed or eureka")
	print(playerID)
	local pPlayer = Players[playerID]
	local pPlayerConfig = PlayerConfigurations[playerID]
	local pCivilizationType = pPlayerConfig:GetCivilizationTypeName()
	if (not HasCivilizationTrait(pCivilizationType, sTraitCalenderRounds)) then
		print("not maya")
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
	local pPlayer = Players[iVictoriousPlayer]
	local pPlayerConfig = PlayerConfigurations[iVictoriousPlayer]
	local sLeaderType = pPlayerConfig:GetLeaderTypeName()
	if (not HasLeaderTrait(sLeaderType, sTraitGreatPaw)) then
		return
	end
	tWonders = DB.Query("SELECT BuildingType FROM Buildings WHERE IsWonder IS 1")
	tProjects = DB.Query("SELECT ProjectType FROM Projects")
	pCapital = pPlayer:GetCities():GetCapitalCity()
	sCurrentProduction = pCapital:GetBuildQueue():CurrentlyBuilding()

	if has_value(tWonders, sCurrentProduction) or has_value(tProjects, sCurrentProduction) then
		--do nothing
	else
		pCapital:GetBuildQueue():FinishProgress()
		print("completing production!")
	end
end
GameEvents.CityConquered.Add(RelicCityCaptureBoostProduction)

local tCSs = {}
for row in GameInfo.C15_REL_CityStateGPLinkage() do
    local tQuery = DB.Query("SELECT Type FROM TypeProperties WHERE Value = '" .. row.Value .. "'")
    for k, v in pairs(tQuery) do
		if (not tCSs[v.Type]) then
			tCSs[v.Type] = {GameInfo.GreatPersonClasses[row.GreatPersonClassType].Index}
		else
			table.insert(tCSs[v.Type],GameInfo.GreatPersonClasses[row.GreatPersonClassType].Index)
		end
    end
end
print("loop")
for k, v in pairs(tCSs) do
	print(k)
	print(v)
	--for k1, v1, in ipairs(v) do
	--	print(k1)
	--	print(v1)
	--end
end

local iPoints = 100 -- Make this scale off something you twat

function C15_Relic_OnMayaCapture(iVictoriousPlayer, iDefeatedPlayer, iNewCityID, iCityPlotX, iCityPlotY)
    local pPlayer = Players[iVictoriousPlayer]
    local pPlayerConfig = PlayerConfigurations[iVictoriousPlayer]
    local sLeaderType = pPlayerConfig:GetLeaderTypeName()
    if HasLeaderTrait(sLeaderType, sTraitGreatPaw) then
		print("I'm going in")
        local pPlayerCities = pPlayer:GetCities()
        local pCity = pPlayerCities:FindID(iNewCityID)
        local pOldPlayer = Players[iDefeatedPlayer]
		print(pOldPlayer)
        local pOldPlayerConfig = PlayerConfigurations[iDefeatedPlayer]
        local iOldPlayerCivName = pOldPlayerConfig:GetCivilizationTypeName()
		print(iOldPlayerCivName)
		print(tCSs[iOldPlayerCivName])
        if tCSs[iOldPlayerCivName] then
		print("Yay!")
			for k,iGPClass in ipairs(tCSs[iOldPlayerCivName]) do 
				print(iGPClass)
				local pPlayerGPP = pPlayer:GetGreatPeoplePoints()
				iPoints = pPlayerGPP:CalculatePointsPerTurn(iGPClass) * 5
				if iPoints == 0 then iPoints = 5 end
				pPlayerGPP:ChangePointsTotal(iGPClass, iPoints)
				-- Do some text or something
			end
        end
    end
end

GameEvents.CityConquered.Add(C15_Relic_OnMayaCapture)

function Relic_Maya_New_Turn(playerID)
	print("new turn and stuff")
	local pPlayer = Players[playerID]
	local pPlayerConfig = PlayerConfigurations[playerID]
	local sLeaderType = pPlayerConfig:GetLeaderTypeName()
	if HasLeaderTrait(sLeaderType, sTraitGreatPaw) then
		print("mayan turn")
		local pPlayerCities = pPlayer:GetCities()
		for k, v in pPlayerCities:Members() do
			local pOriginalOwner = Players[v:GetOriginalOwner()]
			local pOriginalOwnerConfig = PlayerConfigurations[v:GetOriginalOwner()]
			local iOriginalPlayerCivName = pOriginalOwnerConfig:GetCivilizationTypeName()
			print(iOriginalPlayerCivName)
			if tCSs[iOriginalPlayerCivName] then
				for k,	iGPClass in ipairs(tCSs[iOriginalPlayerCivName]) do
					local pPlayerGPP = pPlayer:GetGreatPeoplePoints()
					print("Granting points of type " .. iGPClass)
					iPoints = 5
					pPlayerGPP:ChangePointsTotal(iGPClass, iPoints)
				end
			end
		end
	end
end
Events.PlayerTurnActivated.Add(Relic_Maya_New_Turn)