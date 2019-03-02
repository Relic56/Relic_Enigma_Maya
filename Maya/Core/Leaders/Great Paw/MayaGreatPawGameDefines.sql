--UA Stuff for the lua code
CREATE TABLE C15_REL_CityStateGPLinkage
(Value TEXT, GreatPersonClassType TEXT DEFAULT 'GREATPERSONCLASS_GENERAL');--,
--PRIMARY KEY (Value, GreatPersonClassType),
--FOREIGN KEY (Value) REFERENCES TypeProperties  (Value) ,
--FOREIGN KEY (GreatPersonClassType) REFERENCES GreatPersonClasses (GreatPersonClassType));

INSERT INTO C15_REL_CityStateGPLinkage
(Value, 			GreatPersonClassType)
VALUES	('CULTURAL',		'GREAT_PERSON_CLASS_ARTIST'),
('CULTURAL',		'GREAT_PERSON_CLASS_WRITER'),
('CULTURAL',		'GREAT_PERSON_CLASS_MUSICIAN'),
('MILITARISTIC',	'GREAT_PERSON_CLASS_GENERAL'),
('MILITARISTIC',	'GREAT_PERSON_CLASS_ADMIRAL'),
('INDUSTRIAL',		'GREAT_PERSON_CLASS_ENGINEER'),
('TRADE',			'GREAT_PERSON_CLASS_MERCHANT'),
('RELIGIOUS',		'GREAT_PERSON_CLASS_PROPHET'),
('SCIENTIFIC',		'GREAT_PERSON_CLASS_SCIENTIST');


--Actual Defines

--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Types
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Types
(Type,						Kind)
VALUES	('LEADER_RELIC_ENIG_YAXCHIN',	'KIND_LEADER');
--------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leaders
(LeaderType,				Name,								InheritFrom,		SceneLayers)
VALUES ('LEADER_RELIC_ENIG_YAXCHIN',	'LOC_LEADER_RELIC_ENIG_YAXCHIN_NAME',	'LEADER_DEFAULT',	4);
--------------------------------------------------------------------------------------------------------------------------
-- LeaderQuotes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO LeaderQuotes
(LeaderType,				Quote)
VALUES ('LEADER_RELIC_ENIG_YAXCHIN',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RELIC_ENIG_YAXCHIN_QUOTE');
--------------------------------------------------------------------------------------------------------------------------
-- HistoricalAgendas
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO HistoricalAgendas
(LeaderType,				AgendaType)
VALUES	('LEADER_RELIC_ENIG_YAXCHIN',	'AGENDA_RELIC_ENIG_AJAW_TIKAL');
--------------------------------------------------------------------------------------------------------------------------
-- LeaderTraits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO LeaderTraits
(LeaderType,				TraitType)
VALUES ('LEADER_RELIC_ENIG_YAXCHIN',	'TRAIT_LEADER_RELIC_ENIG_DARK_SKY');
--------------------------------------------------------------------------------------------------------------------------
-- FavoredReligions
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO FavoredReligions
(LeaderType,				ReligionType)
SELECT	'LEADER_RELIC_ENIG_YAXCHIN',	ReligionType
FROM Religions WHERE ReligionType = 'RELIGION_CATHOLICISM';

UPDATE FavoredReligions
SET ReligionType = 'RELIGION_TZOLKIN'
WHERE LeaderType = 'LEADER_RELIC_ENIG_YAXCHIN'
AND EXISTS (SELECT ReligionType FROM Religions WHERE ReligionType = 'RELIGION_TZOLKIN');

CREATE TRIGGER RELIC_ENIG_Maya_Yaxchin_FavoredReligions
AFTER INSERT ON Religions WHEN 'RELIGION_TZOLKIN' = NEW.ReligionType
BEGIN
INSERT OR REPLACE INTO FavoredReligions
(LeaderType, 		 		ReligionType)
VALUES 	('LEADER_RELIC_ENIG_YAXCHIN',	'RELIGION_TZOLKIN');
END;
--==========================================================================================================================
-- LEADERS: AI
--==========================================================================================================================
-- AiListTypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO AiListTypes
(ListType)
VALUES	('RELIC_ENIG_Yaxchin_Civics'),
('RELIC_ENIG_Yaxchin_Districts'),
('RELIC_ENIG_Yaxchin_Techs'),
('RELIC_ENIG_Yaxchin_Units');
--------------------------------------------------------------------------------------------------------------------------
-- AiLists
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO AiLists
(ListType,							LeaderType,							System)
VALUES	('RELIC_ENIG_Yaxchin_Civics',				'TRAIT_LEADER_DARK_SKY',	'Civics'),
('RELIC_ENIG_Yaxchin_Districts',			'TRAIT_LEADER_DARK_SKY',	'Districts'),
('RELIC_ENIG_Yaxchin_Techs',				'TRAIT_LEADER_DARK_SKY',	'Technologies'),
('RELIC_ENIG_Yaxchin_Techs',				'TRAIT_LEADER_DARK_SKY',	'Technologies'),
('RELIC_ENIG_Yaxchin_Units',				'TRAIT_LEADER_DARK_SKY',	'Units');
--------------------------------------------------------------------------------------------------------------------------
-- AiFavoredItems
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO AiFavoredItems
(ListType,							Favored,		Value,				Item)
VALUES	('RELIC_ENIG_Yaxchin_Civics',				1,				0,					'CIVIC_MILITARY_TRAINING'),
('RELIC_ENIG_Yaxchin_Districts',			1,				1,					'DISTRICT_RELIC_ENIG_CARACOL'),
('RELIC_ENIG_Yaxchin_Techs',				1,				0,					'TECH_WRITING'),
('RELIC_ENIG_Yaxchin_Techs',				1,				0,					'TECH_ASTROLOGY'),
('RELIC_ENIG_Yaxchin_Units',				1,				0,					'UNIT_RELIC_ENIG_MACUAHUITL'),
('RELIC_ENIG_Yaxchin_Units',				1,				0,					'UNIT_ARCHER');
--==========================================================================================================================
-- LEADERS: AGENDAS
--==========================================================================================================================
-- Types
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Types
(Type,												Kind)
VALUES	('TRAIT_AGENDA_RELIC_ENIG_AJAW_TIKAL',					'KIND_TRAIT');
----------------------------------------------------------------------------------------------------------------------------
-- Agendas
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Agendas
(AgendaType,										Name,										Description)
VALUES	('AGENDA_RELIC_ENIG_AJAW_TIKAL',						'LOC_AGENDA_RELIC_ENIG_AJAW_TIKAL_NAME',		'LOC_AGENDA_RELIC_ENIG_AJAW_TIKAL_DESCRIPTION');
----------------------------------------------------------------------------------------------------------------------------
-- Traits
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Traits
(TraitType,											Name,										Description)
VALUES	('TRAIT_AGENDA_RELIC_ENIG_AJAW_TIKAL',					'LOC_PLACEHOLDER',							'LOC_PLACEHOLDER');
----------------------------------------------------------------------------------------------------------------------------
-- AgendaTraits
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO AgendaTraits
(AgendaType,										TraitType)
VALUES	('AGENDA_RELIC_ENIG_AJAW_TIKAL',						'TRAIT_AGENDA_RELIC_ENIG_AJAW_TIKAL');
--------------------------------------------------------------------------------------------------------------------------
-- ExclusiveAgendas
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ExclusiveAgendas
(AgendaOne,											AgendaTwo)
VALUES	('AGENDA_RELIC_ENIG_AJAW_TIKAL',						'AGENDA_DARWINIST');
----------------------------------------------------------------------------------------------------------------------------
-- TraitModifiers
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO TraitModifiers
(TraitType,											ModifierId)
VALUES	('TRAIT_AGENDA_RELIC_ENIG_AJAW_TIKAL',					'RELIC_ENIG_AJAW_TIKAL_WONDER_WHORE'),
('TRAIT_AGENDA_RELIC_ENIG_AJAW_TIKAL',					'RELIC_ENIG_AJAW_TIKAL_MILITARY_THREAT'),
('TRAIT_AGENDA_RELIC_ENIG_AJAW_TIKAL',					'RELIC_ENIG_AJAW_TIKAL_PRODUCTION_LEADER');
--------------------------------------------------------------------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers
(ModifierId,										ModifierType,										SubjectRequirementSetId)
VALUES	('RELIC_ENIG_AJAW_TIKAL_WONDER_WHORE',				'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'PLAYER_LEADS_WONDERS'),
('RELIC_ENIG_AJAW_TIKAL_MILITARY_THREAT',				'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'PLAYER_HAS_HIGH_STANDING_ARMY'),
('RELIC_ENIG_AJAW_TIKAL_PRODUCTION_LEADER',				'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'RELIC_ENIG_AJAW_TIKAL_PRODUCTION_REQ_SET');
--------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments
(ModifierId,										Name,												Value,																		Type)
VALUES	('RELIC_ENIG_AJAW_TIKAL_WONDER_WHORE',			'InitialValue',										-9,																			'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_WONDER_WHORE',					'StatementKey',										'LOC_DIPLO_WARNING_LEADER_RELIC_ENIG_YAXCHIN_WONDER_WHORE',				'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_WONDER_WHORE',					'SimpleModifierDescription',						'LOC_DIPLO_MODIFIER_RELIC_ENIG_AJAW_TIKAL_WONDER_WHORE',					'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_MILITARY_THREAT',				'InitialValue',										8,																			'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_MILITARY_THREAT',				'StatementKey',										'LOC_DIPLO_KUDO_LEADER_RELIC_ENIG_YAXCHIN_MILITARY_THREAT',						'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_MILITARY_THREAT',				'SimpleModifierDescription',						'LOC_DIPLO_MODIFIER_RELIC_ENIG_AJAW_TIKAL_MILITARY_THREAT',						'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_PRODUCTION_LEADER',				'InitialValue',										10,																				'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_PRODUCTION_LEADER',				'StatementKey',										'LOC_DIPLO_KUDO_LEADER_RELIC_ENIG_YAXCHIN_REASON_PRODUCTION_LEADER',			'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_PRODUCTION_LEADER',				'SimpleModifierDescription',						'LOC_DIPLO_MODIFIER_AGENDA_RELIC_ENIG_AJAW_TIKAL_PRODUCTION_LEADER',			'ARGTYPE_IDENTITY');
--------------------------------------------------------------------------------------------------------------------------
-- Requirements
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Requirements 			
		(RequirementId,											RequirementType)
VALUES	('RELIC_ENIG_AJAW_TIKAL_PRODUCTION_REQ',			'REQUIREMENT_PLAYER_YIELD_LEAD');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId,											Name,																			Value)
VALUES	('RELIC_ENIG_AJAW_TIKAL_PRODUCTION_REQ',				'YieldType',									'YIELD_PRODUCTION');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementSets
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,										RequirementSetType)
VALUES	('RELIC_ENIG_AJAW_TIKAL_PRODUCTION_REQ_SET',			'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
VALUES	('RELIC_ENIG_AJAW_TIKAL_PRODUCTION_REQ_SET',				'RELIC_ENIG_AJAW_TIKAL_PRODUCTION_REQ');	

--==========================================================================================================================
-- LEADERS: LOADING INFO
--==========================================================================================================================
-- LoadingInfo
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO LoadingInfo
(LeaderType,				BackgroundImage, 			ForegroundImage,					PlayDawnOfManAudio)
VALUES	('LEADER_RELIC_ENIG_YAXCHIN',	'LEADER_GORGO_BACKGROUND',	'LEADER_RELIC_ENIG_YAXCHIN_NEUTRAL',	0);
--==========================================================================================================================
-- LEADERS: TRAITS
--==========================================================================================================================
-- Types
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Types
(Type,													Kind)
VALUES	('TRAIT_LEADER_RELIC_ENIG_DARK_SKY',					'KIND_TRAIT');
--------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Traits
(TraitType,												Name,														Description)
VALUES	('TRAIT_LEADER_RELIC_ENIG_DARK_SKY',					'LOC_TRAIT_LEADER_RELIC_ENIG_DARK_SKY_NAME',				'LOC_TRAIT_LEADER_RELIC_ENIG_DARK_SKY_DESCRIPTION');
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- CivilizationLeaders
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO CivilizationLeaders
(CivilizationType,			LeaderType,					CapitalName)
VALUES	('CIVILIZATION_RELIC_ENIG_MAYA',	'LEADER_RELIC_ENIG_YAXCHIN',	'LOC_CITY_NAME_MAYA_TIKAL');
--==========================================================================================================================
--==========================================================================================================================
