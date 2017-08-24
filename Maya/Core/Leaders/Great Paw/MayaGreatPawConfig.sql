--==========================================================================================================================
-- CONFIG DATA
--==========================================================================================================================
-- Players
-------------------------------------	
INSERT INTO Players	
		(CivilizationType,				Portrait,								PortraitBackground,			LeaderType,					LeaderName,							LeaderIcon,						LeaderAbilityName,								LeaderAbilityDescription,								LeaderAbilityIcon,				CivilizationName,					CivilizationIcon,				CivilizationAbilityName,				 CivilizationAbilityDescription,					CivilizationAbilityIcon)
SELECT	'CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_YAXCHIN_NEUTRAL.dds',	'LEADER_SALADIN_BACKGROUND',	'LEADER_RELIC_ENIG_YAXCHIN',	'LOC_LEADER_RELIC_ENIG_YAXCHIN_NAME',	'ICON_LEADER_RELIC_ENIG_YAXCHIN',	'LOC_TRAIT_LEADER_RELIC_ENIG_WHITE_SKIN_NAME',	'LOC_TRAIT_LEADER_RELIC_ENIG_DARK_SKY_DESCRIPTION',	'ICON_LEADER_RELIC_ENIG_YAXCHIN',	'LOC_CIVILIZATION_RELIC_ENIG_MAYA_NAME',	'ICON_CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS_NAME',	 'LOC_TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS_DESCRIPTION',		'ICON_CIVILIZATION_RELIC_ENIG_PAKAL'
WHERE EXISTS (SELECT * FROM RELIC_ENIG_GlobalUserSettings WHERE Type = 'RELIC_ENIG_MAYA_YAXCHIN' AND Value = 1);		
-------------------------------------
-- PlayerItems
-------------------------------------	
INSERT INTO PlayerItems	
		(CivilizationType,				LeaderType,						Type,					Icon,						Name,								Description,							SortIndex)
SELECT	'CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_PAKAL',		'DISTRICT_RELIC_ENIG_CARACOL',		'ICON_DISTRICT_RELIC_ENIG_CARACOL',		'LOC_DISTRICT_RELIC_ENIG_CARACOL_NAME',  		'LOC_DISTRICT_RELIC_ENIG_CARACOL_DESCRIPTION', 		20
WHERE EXISTS (SELECT * FROM RELIC_ENIG_GlobalUserSettings WHERE Type = 'RELIC_ENIG_MAYA_YAXCHIN' AND Value = 1);		

INSERT INTO PlayerItems	
		(CivilizationType,				LeaderType,						Type,					Icon,						Name,								Description,							SortIndex)
SELECT	'CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_PAKAL',		'UNIT_RELIC_ENIG_MACUAHUITL',		'ICON_UNIT_RELIC_ENIG_MACUAHUITL',		'LOC_UNIT_RELIC_ENIG_MACUAHUITL_NAME',			'LOC_UNIT_RELIC_ENIG_MACUAHUITL_DESCRIPTION',		30
WHERE EXISTS (SELECT * FROM RELIC_ENIG_GlobalUserSettings WHERE Type = 'RELIC_ENIG_MAYA_PAKAL' AND Value = 1);	

INSERT INTO PlayerItems	
		(CivilizationType,				LeaderType,					Type,						Icon,							Name,									Description,									SortIndex)
SELECT	'CIVILIZATION_RELIC_ENIG_MAYA',		'LEADER_RELIC_ENIG_YAXCHIN',	'PROJECT_RELIC_ENIG_VENUS',	'ICON_PROJECT_RELIC_ENIG_VENUS',	'LOC_PROJECT_RELIC_ENIG_VENUS_NAME',		'LOC_PROJECT_RELIC_ENIG_VENUS_DESCRIPTION',		30
WHERE EXISTS (SELECT * FROM RELIC_ENIG_GlobalUserSettings WHERE Type = 'RELIC_ENIG_MAYA_YAXCHIN' AND Value = 1);	
-------------------------------------
-- MapSupportedValues
-------------------------------------	
--INSERT INTO MapSupportedValues	
--		(Value,						Domain, Map)
--SELECT	'LEADER_RELIC_ENIG_YAXCHIN',		Domain, Map
--FROM MapSupportedValues WHERE Value= 'LEADER_TRAJAN';
--==========================================================================================================================
--==========================================================================================================================
