--==========================================================================================================================
-- CONFIG DATA
--==========================================================================================================================
-- Players
-------------------------------------	
INSERT INTO Players	
		(CivilizationType,						Portrait,								PortraitBackground,				LeaderType,					LeaderName,							LeaderIcon,						LeaderAbilityName,								LeaderAbilityDescription,								LeaderAbilityIcon,				CivilizationName,							CivilizationIcon,						CivilizationAbilityName,				 					CivilizationAbilityDescription,											CivilizationAbilityIcon)
VALUES	('CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_PAKAL_NEUTRAL.dds',	'LEADER_SALADIN_BACKGROUND',	'LEADER_RELIC_ENIG_PAKAL',	'LOC_LEADER_RELIC_ENIG_PAKAL_NAME',	'ICON_LEADER_RELIC_ENIG_PAKAL',	'LOC_TRAIT_LEADER_RELIC_ENIG_WHITE_SKIN_NAME',	'LOC_TRAIT_LEADER_RELIC_ENIG_WHITE_SKIN_DESCRIPTION',	'ICON_LEADER_RELIC_ENIG_PAKAL',	'LOC_CIVILIZATION_RELIC_ENIG_MAYA_NAME',	'ICON_CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS_NAME',	'LOC_TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS_DESCRIPTION',		'ICON_CIVILIZATION_RELIC_ENIG_PAKAL');
-------------------------------------
-- PlayerItems
-------------------------------------	
INSERT INTO PlayerItems	
	(CivilizationType,				LeaderType,				Type,					Icon,						Name,							Description,						SortIndex)
VALUES	('CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_PAKAL',		'DISTRICT_RELIC_ENIG_CARACOL',		'ICON_DISTRICT_RELIC_ENIG_CARACOL',		'LOC_DISTRICT_RELIC_ENIG_CARACOL_NAME',  		'LOC_DISTRICT_RELIC_ENIG_CARACOL_DESCRIPTION', 		20),
	('CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_PAKAL',		'UNIT_RELIC_ENIG_MACUAHUITL',		'ICON_UNIT_RELIC_ENIG_MACUAHUITL',		'LOC_UNIT_RELIC_ENIG_MACUAHUITL_NAME',			'LOC_UNIT_RELIC_ENIG_MACUAHUITL_DESCRIPTION',		30);

--==========================================================================================================================
-- RISE AND FALL UPDATE
--==========================================================================================================================
-- Players
-------------------------------------	
INSERT INTO Players	
		(Domain, CivilizationType,						Portrait,								PortraitBackground,				LeaderType,					LeaderName,							LeaderIcon,						LeaderAbilityName,								LeaderAbilityDescription,								LeaderAbilityIcon,				CivilizationName,							CivilizationIcon,						CivilizationAbilityName,				 					CivilizationAbilityDescription,											CivilizationAbilityIcon)
VALUES	('Players:Expansion1_Players', 'CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_PAKAL_NEUTRAL.dds',	'LEADER_SALADIN_BACKGROUND',	'LEADER_RELIC_ENIG_PAKAL',	'LOC_LEADER_RELIC_ENIG_PAKAL_NAME',	'ICON_LEADER_RELIC_ENIG_PAKAL',	'LOC_TRAIT_LEADER_RELIC_ENIG_WHITE_SKIN_NAME',	'LOC_TRAIT_LEADER_RELIC_ENIG_WHITE_SKIN_DESCRIPTION',	'ICON_LEADER_RELIC_ENIG_PAKAL',	'LOC_CIVILIZATION_RELIC_ENIG_MAYA_NAME',	'ICON_CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS_NAME',	'LOC_TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS_DESCRIPTION',		'ICON_CIVILIZATION_RELIC_ENIG_PAKAL');
-------------------------------------
-- PlayerItems
-------------------------------------	
INSERT INTO PlayerItems	
	(Domain, CivilizationType,				LeaderType,				Type,					Icon,						Name,							Description,						SortIndex)
VALUES	('Players:Expansion1_Players', 'CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_PAKAL',		'DISTRICT_RELIC_ENIG_CARACOL',		'ICON_DISTRICT_RELIC_ENIG_CARACOL',		'LOC_DISTRICT_RELIC_ENIG_CARACOL_NAME',  		'LOC_DISTRICT_RELIC_ENIG_CARACOL_DESCRIPTION', 		20),
	('Players:Expansion1_Players', 'CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_PAKAL',		'UNIT_RELIC_ENIG_MACUAHUITL',		'ICON_UNIT_RELIC_ENIG_MACUAHUITL',		'LOC_UNIT_RELIC_ENIG_MACUAHUITL_NAME',			'LOC_UNIT_RELIC_ENIG_MACUAHUITL_DESCRIPTION',		30);
--==========================================================================================================================
-- GATHERING STORM UPDATE
--==========================================================================================================================
-- Players
-------------------------------------	
INSERT INTO Players	
		(Domain, CivilizationType,						Portrait,								PortraitBackground,				LeaderType,					LeaderName,							LeaderIcon,						LeaderAbilityName,								LeaderAbilityDescription,								LeaderAbilityIcon,				CivilizationName,							CivilizationIcon,						CivilizationAbilityName,				 					CivilizationAbilityDescription,											CivilizationAbilityIcon)
VALUES	('Players:Expansion2_Players', 'CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_PAKAL_NEUTRAL.dds',	'LEADER_SALADIN_BACKGROUND',	'LEADER_RELIC_ENIG_PAKAL',	'LOC_LEADER_RELIC_ENIG_PAKAL_NAME',	'ICON_LEADER_RELIC_ENIG_PAKAL',	'LOC_TRAIT_LEADER_RELIC_ENIG_WHITE_SKIN_NAME',	'LOC_TRAIT_LEADER_RELIC_ENIG_WHITE_SKIN_DESCRIPTION',	'ICON_LEADER_RELIC_ENIG_PAKAL',	'LOC_CIVILIZATION_RELIC_ENIG_MAYA_NAME',	'ICON_CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS_NAME',	'LOC_TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS_DESCRIPTION',		'ICON_CIVILIZATION_RELIC_ENIG_PAKAL');
-------------------------------------
-- PlayerItems
-------------------------------------	
INSERT INTO PlayerItems	
	(Domain, CivilizationType,				LeaderType,				Type,					Icon,						Name,							Description,						SortIndex)
VALUES	('Players:Expansion1_Players', 'CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_PAKAL',		'DISTRICT_RELIC_ENIG_CARACOL',		'ICON_DISTRICT_RELIC_ENIG_CARACOL',		'LOC_DISTRICT_RELIC_ENIG_CARACOL_NAME',  		'LOC_DISTRICT_RELIC_ENIG_CARACOL_DESCRIPTION', 		20),
	('Players:Expansion2_Players', 'CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_PAKAL',		'UNIT_RELIC_ENIG_MACUAHUITL',		'ICON_UNIT_RELIC_ENIG_MACUAHUITL',		'LOC_UNIT_RELIC_ENIG_MACUAHUITL_NAME',			'LOC_UNIT_RELIC_ENIG_MACUAHUITL_DESCRIPTION',		30);

--I stole Suk's code as is tradition. Thank you Sukritact for being a magnificent baller.
/* INTO Players
		(CivilizationType,		Portrait,		PortraitBackground,		LeaderType,		LeaderName,		LeaderIcon,		LeaderAbilityName,		LeaderAbilityDescription,	LeaderAbilityIcon,		CivilizationName,	CivilizationIcon,	CivilizationAbilityName,		CivilizationAbilityDescription,		CivilizationAbilityIcon,	Domain)
SELECT	 p.CivilizationType,	p.Portrait,		p.PortraitBackground,	p.LeaderType,	p.LeaderName,	p.LeaderIcon,	p.LeaderAbilityName,	p.LeaderAbilityDescription, p.LeaderAbilityIcon,	p.CivilizationName, p.CIvilizationIcon, p.CivilizationAbilityName,	p.CivilizationAbilityDescription,	p.CivilizationAbilityIcon,	RulesetDomainOverrides.Domain
FROM Players as p, RulesetDomainOverrides
WHERE Players.CivilizationType = 'CIVILIZATION_ RELIC_ENIG_MAYA' AND Players.LeaderType = 'LEADER_RELIC_ENIG_PAKAL' AND Players.Domain = 'Players:StandardPlayers'
AND RulesetDomainOverrides.ParameterId = 'PlayerLeader' AND RulesetDomainOverrides.Ruleset IN (SELECT RuleSetType FROM RuleSets WHERE IsScenario = 0);
--Also Suk
INSERT INTO PlayerItems
		(CivilizationType, LeaderType,		Type,	Icon,	Name,	Description,	SortIndex,		Domain)
SELECT	p.CivilizationType, p.LeaderType,	p.Type, p.Icon, p.Name, p.Description,	p.SortIndex,	RulesetDomainOverrides.Domain
FROM PlayerItems as p, RulesetDomainOverrides WHERE
	PlayerItems.CivilizationType = 'CIVILIZATION_RELIC_ENIG_MAYA' AND PlayerItems.LeaderType = 'LEADER_RELIC_ENIG_PAKAL' AND PlayerItems.Domain = 'Players:StandardPlayers'
	AND RulesetDomainOverrides.ParameterId = 'PlayerLeader' AND RulesetDomainOverrides.Ruleset IN (SELECT RuleSetType FROM RuleSets WHERE IsScenario = 0);*/

