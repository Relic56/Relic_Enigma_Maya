--==========================================================================================================================
-- CONFIG DATA
--==========================================================================================================================
-- Players
-------------------------------------	
INSERT INTO Players	
	(CivilizationType,				Portrait,					PortraitBackground,		LeaderType,			LeaderName,				LeaderIcon,				LeaderAbilityName,				LeaderAbilityDescription,				LeaderAbilityIcon,			CivilizationName,				CivilizationIcon,			CivilizationAbilityName,					 CivilizationAbilityDescription,					CivilizationAbilityIcon)
VALUES	('CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_YAXCHIN_NEUTRAL.dds',	'LEADER_SALADIN_BACKGROUND',	'LEADER_RELIC_ENIG_YAXCHIN',	'LOC_LEADER_RELIC_ENIG_YAXCHIN_NAME',	'ICON_LEADER_RELIC_ENIG_YAXCHIN',	'LOC_TRAIT_LEADER_RELIC_ENIG_DARK_SKY_NAME',	'LOC_TRAIT_LEADER_RELIC_ENIG_DARK_SKY_DESCRIPTION',	'ICON_LEADER_RELIC_ENIG_YAXCHIN',	'LOC_CIVILIZATION_RELIC_ENIG_MAYA_NAME',	'ICON_CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS_NAME',	 'LOC_TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS_DESCRIPTION',	'ICON_CIVILIZATION_RELIC_ENIG_YAXCHIN');		
-------------------------------------
-- PlayerItems
-------------------------------------	
INSERT INTO PlayerItems	
	(CivilizationType,				LeaderType,				Type,					Icon,						Name,							Description,						SortIndex)
VALUES	('CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_YAXCHIN',		'DISTRICT_RELIC_ENIG_CARACOL',		'ICON_DISTRICT_RELIC_ENIG_CARACOL',		'LOC_DISTRICT_RELIC_ENIG_CARACOL_NAME',  		'LOC_DISTRICT_RELIC_ENIG_CARACOL_DESCRIPTION', 		20),
	('CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_YAXCHIN',		'UNIT_RELIC_ENIG_MACUAHUITL',		'ICON_UNIT_RELIC_ENIG_MACUAHUITL',		'LOC_UNIT_RELIC_ENIG_MACUAHUITL_NAME',			'LOC_UNIT_RELIC_ENIG_MACUAHUITL_DESCRIPTION',		30),
	('CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_YAXCHIN',		'PROJECT_RELIC_ENIG_VENUS',		'ICON_PROJECT_RELIC_ENIG_VENUS',		'LOC_PROJECT_RELIC_ENIG_VENUS_NAME',			'LOC_PROJECT_RELIC_ENIG_VENUS_DESCRIPTION',		30);

-------------------------------------
-- MapSupportedValues
-------------------------------------	
--INSERT INTO MapSupportedValues	
--		(Value,						Domain, Map)
--SELECT	'LEADER_RELIC_ENIG_YAXCHIN',		Domain, Map
--FROM MapSupportedValues WHERE Value= 'LEADER_TRAJAN';
--==========================================================================================================================
--==========================================================================================================================
