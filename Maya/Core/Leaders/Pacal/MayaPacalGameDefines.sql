--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Types
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Types	
	(Type,				Kind)
VALUES	('LEADER_RELIC_ENIG_PAKAL',	'KIND_LEADER');	
--------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leaders	
	(LeaderType,			Name,					InheritFrom,		SceneLayers)
VALUES ('LEADER_RELIC_ENIG_PAKAL',	'LOC_LEADER_RELIC_ENIG_PAKAL_NAME',	'LEADER_DEFAULT',	4);
--------------------------------------------------------------------------------------------------------------------------
-- LeaderQuotes
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO LeaderQuotes	
	(LeaderType,			Quote)
VALUES	('LEADER_RELIC_ENIG_PAKAL',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RELIC_ENIG_PAKAL_QUOTE');
--------------------------------------------------------------------------------------------------------------------------
-- HistoricalAgendas
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO HistoricalAgendas	
	(LeaderType,			AgendaType)
VALUES	('LEADER_RELIC_ENIG_PAKAL',	'AGENDA_RELIC_ENIG_SUN_SHIELD');
--------------------------------------------------------------------------------------------------------------------------
-- LeaderTraits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO LeaderTraits	
	(LeaderType,			TraitType)
VALUES	('LEADER_RELIC_ENIG_PAKAL',	'TRAIT_LEADER_RELIC_ENIG_WHITE_SKIN');
--------------------------------------------------------------------------------------------------------------------------
-- FavoredReligions
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO FavoredReligions	
	(LeaderType,			ReligionType)
SELECT	'LEADER_RELIC_ENIG_PAKAL',	ReligionType
FROM Religions WHERE ReligionType = 'RELIGION_CATHOLICISM';	

UPDATE FavoredReligions
SET ReligionType = 'RELIGION_TZOLKIN'
WHERE LeaderType = 'LEADER_RELIC_ENIG_PAKAL' 
AND EXISTS (SELECT ReligionType FROM Religions WHERE ReligionType = 'RELIGION_TZOLKIN');

CREATE TRIGGER RELIC_ENIG_Maya_Pakal_FavoredReligions 
AFTER INSERT ON Religions WHEN 'RELIGION_TZOLKIN' = NEW.ReligionType
BEGIN 
INSERT OR REPLACE INTO FavoredReligions 
	(LeaderType, 		 	ReligionType) 
VALUES 	('LEADER_RELIC_ENIG_PAKAL',	'RELIGION_TZOLKIN'); 
END;
--==========================================================================================================================
-- LEADERS: AI
--==========================================================================================================================
-- AiListTypes
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO AiListTypes	
	(ListType)
VALUES	('RELIC_ENIG_Pakal_Civics'),
	('RELIC_ENIG_Pakal_Districts'),
	('RELIC_ENIG_Pakal_Techs'),
	('RELIC_ENIG_Pakal_Units');
--------------------------------------------------------------------------------------------------------------------------
-- AiLists
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO AiLists	
	(ListType,						LeaderType,			System)
VALUES	('RELIC_ENIG_Pakal_Civics',				'TRAIT_LEADER_WHITE_SKIN',	'Civics'),
	('RELIC_ENIG_Pakal_Districts',				'TRAIT_LEADER_WHITE_SKIN',	'Districts'),
	('RELIC_ENIG_Pakal_Techs',				'TRAIT_LEADER_WHITE_SKIN',	'Technologies'),
	('RELIC_ENIG_Pakal_Techs',				'TRAIT_LEADER_WHITE_SKIN',	'Technologies'),
	('RELIC_ENIG_Pakal_Units',				'TRAIT_LEADER_WHITE_SKIN',	'Units');
--------------------------------------------------------------------------------------------------------------------------		
-- AiFavoredItems
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO AiFavoredItems	
	(ListType,					Favored,			Value,					Item)
VALUES	('RELIC_ENIG_Pakal_Civics',			1,				0,					'CIVIC_MILITARY_TRAINING'), 
	('RELIC_ENIG_Pakal_Districts',			1,				1,					'DISTRICT_RELIC_ENIG_CARACOL'), 
	('RELIC_ENIG_Pakal_Techs',			1,				0,					'TECH_WRITING'), 
	('RELIC_ENIG_Pakal_Techs',			1,				0,					'TECH_ASTROLOGY'), 
	('RELIC_ENIG_Pakal_Units',			1,				0,					'UNIT_RELIC_ENIG_MACUAHUITL'), 
	('RELIC_ENIG_Pakal_Units',			1,				0,					'UNIT_ARCHER');
--==========================================================================================================================
-- LEADERS: AGENDAS
--==========================================================================================================================
-- Types
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Types	
	(Type,									Kind)
VALUES	('TRAIT_AGENDA_RELIC_ENIG_SUN_SHIELD',					'KIND_TRAIT');			
----------------------------------------------------------------------------------------------------------------------------			
-- Agendas			
----------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Agendas				
	(AgendaType,									Name,							Description)
VALUES	('AGENDA_RELIC_ENIG_SUN_SHIELD',						'LOC_AGENDA_RELIC_ENIG_SUN_SHIELD_NAME',		'LOC_AGENDA_RELIC_ENIG_SUN_SHIELD_DESCRIPTION');	
----------------------------------------------------------------------------------------------------------------------------			
-- Traits			
----------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Traits				
	(TraitType,								Name,									Description)
VALUES	('TRAIT_AGENDA_RELIC_ENIG_SUN_SHIELD',					'LOC_PLACEHOLDER',							'LOC_PLACEHOLDER');	
----------------------------------------------------------------------------------------------------------------------------			
-- AgendaTraits			
----------------------------------------------------------------------------------------------------------------------------				
INSERT INTO AgendaTraits				
	(AgendaType,									TraitType)
VALUES	('AGENDA_RELIC_ENIG_SUN_SHIELD',						'TRAIT_AGENDA_RELIC_ENIG_SUN_SHIELD');		
----------------------------------------------------------------------------------------------------------------------------				
-- TraitModifiers						
----------------------------------------------------------------------------------------------------------------------------				
INSERT INTO TraitModifiers							
	(TraitType,								ModifierId)
VALUES	('TRAIT_AGENDA_RELIC_ENIG_SUN_SHIELD',					'RELIC_ENIG_SUN_SHIELD_WONDER_WHORE'),
	('TRAIT_AGENDA_RELIC_ENIG_SUN_SHIELD',					'RELIC_ENIG_SUN_SHIELD_MILITARY_THREAT'),
	('TRAIT_AGENDA_RELIC_ENIG_SUN_SHIELD',					'RELIC_ENIG_SUN_SHIELD_SCIENCE_LEADER');	
--------------------------------------------------------------------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers	
	(ModifierId,								ModifierType,						SubjectRequirementSetId)
VALUES	('RELIC_ENIG_SUN_SHIELD_WONDER_WHORE',					'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'PLAYER_LEADS_WONDERS'),
	('RELIC_ENIG_SUN_SHIELD_MILITARY_THREAT',				'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'PLAYER_HAS_HIGH_STANDING_ARMY'),
	('RELIC_ENIG_SUN_SHIELD_SCIENCE_LEADER',				'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'PLAYER_HAS_HIGH_SCIENCE');


--------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments
	(ModifierId,								Name,									Value,											Type)
VALUES	('RELIC_ENIG_SUN_SHIELD_WONDER_WHORE',					'InitialValue',								7,											'ARGTYPE_IDENTITY'),
	('RELIC_ENIG_SUN_SHIELD_WONDER_WHORE',					'StatementKey',								'LOC_DIPLO_KUDO_LEADER_RELIC_ENIG_SUN_SHIELD_REASON_WONDER_WHORE',			'ARGTYPE_IDENTITY'),
	('RELIC_ENIG_SUN_SHIELD_WONDER_WHORE',					'SimpleModifierDescription',						'LOC_DIPLO_MODIFIER_AGENDA_RELIC_ENIG_SUN_SHIELD_WONDER_WHORE',				'ARGTYPE_IDENTITY'),
	('RELIC_ENIG_SUN_SHIELD_MILITARY_THREAT',				'InitialValue',								-9,											'ARGTYPE_IDENTITY'),
	('RELIC_ENIG_SUN_SHIELD_MILITARY_THREAT',				'StatementKey',								'LOC_DIPLO_WARNING_LEADER_RELIC_ENIG_SUN_SHIELD_REASON_HIGH_MILITARY',			'ARGTYPE_IDENTITY'),
	('RELIC_ENIG_SUN_SHIELD_MILITARY_THREAT',				'SimpleModifierDescription',						'LOC_DIPLO_MODIFIER_AGENDA_RELIC_ENIG_SUN_SHIELD_HIGH_MILITARY',			'ARGTYPE_IDENTITY'),
	('RELIC_ENIG_SUN_SHIELD_SCIENCE_LEADER',				'InitialValue',								15,											'ARGTYPE_IDENTITY'),
	('RELIC_ENIG_SUN_SHIELD_SCIENCE_LEADER',				'StatementKey',								'LOC_DIPLO_KUDO_LEADER_RELIC_ENIG_SUN_SHIELD_REASON_SCIENCE_LEADER',			'ARGTYPE_IDENTITY'),
	('RELIC_ENIG_SUN_SHIELD_SCIENCE_LEADER',				'SimpleModifierDescription',						'LOC_DIPLO_MODIFIER_AGENDA_RELIC_ENIG_SUN_SHIELD_SCIENCE_LEADER',			'ARGTYPE_IDENTITY');			

--==========================================================================================================================
-- LEADERS: LOADING INFO
--==========================================================================================================================
-- LoadingInfo
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO LoadingInfo	
	(LeaderType,			BackgroundImage, 		ForegroundImage,			PlayDawnOfManAudio)
VALUES	('LEADER_RELIC_ENIG_PAKAL',	'LEADER_MONTEZUMA_BACKGROUND',	'LEADER_RELIC_ENIG_PAKAL_NEUTRAL',	0);	
--==========================================================================================================================
-- LEADERS: TRAITS
--==========================================================================================================================
-- Types
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Types	
	(Type,									Kind)
VALUES	('TRAIT_LEADER_RELIC_ENIG_WHITE_SKIN',					'KIND_TRAIT');	
--------------------------------------------------------------------------------------------------------------------------			
-- Traits			
--------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Traits				
	(TraitType,								Name,									Description)
VALUES	('TRAIT_LEADER_RELIC_ENIG_WHITE_SKIN',					'LOC_TRAIT_LEADER_RELIC_ENIG_WHITE_SKIN_NAME',				'LOC_TRAIT_LEADER_RELIC_ENIG_WHITE_SKIN_DESCRIPTION');	
--------------------------------------------------------------------------------------------------------------------------		
-- TraitModifiers		
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO TraitModifiers			
	(TraitType,								ModifierId)
VALUES	('TRAIT_LEADER_RELIC_ENIG_WHITE_SKIN',					'RELIC_ENIG_WHITE_SKIN_WONDER_HOLY'),
	('TRAIT_LEADER_RELIC_ENIG_WHITE_SKIN',					'RELIC_ENIG_WHITE_SKIN_WONDER_SCIENCE'),
	('TRAIT_LEADER_RELIC_ENIG_WHITE_SKIN',					'RELIC_ENIG_WHITE_SKIN_WONDER_GROWTH');
--------------------------------------------------------------------------------------------------------------------------
--Dynamic Modifiers
--------------------------------------------------------------------------------------------------------------------------'
INSERT INTO DynamicModifiers
	(ModifierType, CollectionType, EffectType)
VALUES
	('MODTYPE_RELIC_ENIG_ADJUST_CITY_GROWTH', 'COLLECTION_PLAYER_CITIES', 'EFFECT_ADJUST_CITY_GROWTH');
INSERT INTO Types
	(Type, Kind)
VALUES
	('MODTYPE_RELIC_ENIG_ADJUST_CITY_GROWTH', 'KIND_MODIFIER');
--------------------------------------------------------------------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers					
	(ModifierId,					ModifierType,							Permanent,			SubjectRequirementSetId)
VALUES	('RELIC_ENIG_WHITE_SKIN_WONDER_HOLY',		'MODIFIER_PLAYER_CITIES_ADJUST_WONDER_PRODUCTION',		1,				'RELIC_ENIG_WHITE_SKIN_WONDER_HOLY_REQ_SET'),
	('RELIC_ENIG_WHITE_SKIN_WONDER_SCIENCE',	'MODIFIER_PLAYER_CITIES_ADJUST_WONDER_PRODUCTION',		1,				'RELIC_ENIG_WHITE_SKIN_WONDER_SCIENCE_REQ_SET'),
	('RELIC_ENIG_WHITE_SKIN_WONDER_GROWTH',		'MODTYPE_RELIC_ENIG_ADJUST_CITY_GROWTH',			1,				'CITY_HAS_WONDER_REQUIREMENTS');
	

--------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,											Name,									Value)
VALUES	('RELIC_ENIG_WHITE_SKIN_WONDER_HOLY',					'Amount',								10),
		('RELIC_ENIG_WHITE_SKIN_WONDER_SCIENCE',				'Amount',								10),
		('RELIC_ENIG_WHITE_SKIN_WONDER_GROWTH',					'Amount',								20);------------
-- Requirements
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Requirements 			
	(RequirementId,							RequirementType)
VALUES	('RELIC_ENIG_WHITE_SKIN_WONDER_HOLY_REQ',			'REQUIREMENT_CITY_HAS_DISTRICT'),
	('RELIC_ENIG_WHITE_SKIN_WONDER_SCIENCE_REQ',			'REQUIREMENT_CITY_HAS_DISTRICT');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementArguments
	(RequirementId,							Name,										Value)
VALUES	('RELIC_ENIG_WHITE_SKIN_WONDER_HOLY_REQ',			'DistrictType',									'DISTRICT_HOLY_SITE'),
	('RELIC_ENIG_WHITE_SKIN_WONDER_SCIENCE_REQ',			'DistrictType',									'DISTRICT_RELIC_ENIG_CARACOL');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementSets
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSets
	(RequirementSetId,					RequirementSetType)
VALUES	('RELIC_ENIG_WHITE_SKIN_WONDER_HOLY_REQ_SET',		'REQUIREMENTSET_TEST_ALL'),
	('RELIC_ENIG_WHITE_SKIN_WONDER_SCIENCE_REQ_SET',	'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
	(RequirementSetId,					RequirementId)
VALUES	('RELIC_ENIG_WHITE_SKIN_WONDER_HOLY_REQ_SET',		'RELIC_ENIG_WHITE_SKIN_WONDER_HOLY_REQ'),
	('RELIC_ENIG_WHITE_SKIN_WONDER_SCIENCE_REQ_SET',	'RELIC_ENIG_WHITE_SKIN_WONDER_SCIENCE_REQ');
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- CivilizationLeaders
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO CivilizationLeaders	
	(CivilizationType,			LeaderType,			CapitalName)
VALUES	('CIVILIZATION_RELIC_ENIG_MAYA',	'LEADER_RELIC_ENIG_PAKAL',	'LOC_CITY_NAME_MAYA_PALENQUE');
--==========================================================================================================================
--==========================================================================================================================
