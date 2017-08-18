--Utility

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
local sTraitCalenderRounds = "TRAIT_CIVILIZATION_REL_ENIG_MAYA_CALENDER_ROUNDS"
local sTraitGreatPaw = "TRAIT_LEADER_REL_ENIG_GREAT_PAW"

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
Events.TechBoostTriggered(RelicGSPOnNewEraOrEureka)
-----------------------------------------------------------------------------------------------
--Great Paw
-----------------------------------------------------------------------------------------------
