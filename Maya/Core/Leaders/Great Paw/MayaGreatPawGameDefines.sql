--UA Stuff for the lua code
CREATE TABLE C15_REL_CityStateGPLinkage
(Value TEXT, GreatPersonClassType TEXT DEFAULT 'GREATPERSONCLASS_GENERAL',
PRIMARY KEY (Value, GreatPersonClassType),
FOREIGN KEY (Value) REFERENCES TypeProperties  (Value) ,
FOREIGN KEY (GreatPersonClassType) REFERENCES GreatPersonClasses (GreatPersonClassType));

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
SELECT	'LEADER_RELIC_ENIG_YAXCHIN',	'KIND_LEADER'
WHERE EXISTS (SELECT * FROM RELIC_ENIG_GlobalUserSettings WHERE Type = 'RELIC_ENIG_MAYA_YAXCHIN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leaders
(LeaderType,				Name,								InheritFrom,		SceneLayers)
SELECT	'LEADER_RELIC_ENIG_YAXCHIN',	'LOC_LEADER_RELIC_ENIG_YAXCHIN_NAME',	'LEADER_DEFAULT',	4
WHERE EXISTS (SELECT * FROM RELIC_ENIG_GlobalUserSettings WHERE Type = 'RELIC_ENIG_MAYA_YAXCHIN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- LeaderQuotes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO LeaderQuotes
(LeaderType,				Quote)
SELECT	'LEADER_RELIC_ENIG_YAXCHIN',	'LOC_PEDIA_LEADERS_PAGE_LEADER_RELIC_ENIG_YAXCHIN_QUOTE'
WHERE EXISTS (SELECT * FROM RELIC_ENIG_GlobalUserSettings WHERE Type = 'RELIC_ENIG_MAYA_YAXCHIN' AND Value = 1);
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
SELECT	'LEADER_RELIC_ENIG_YAXCHIN',	'TRAIT_LEADER_RELIC_ENIG_DARK_SKY'
WHERE EXISTS (SELECT * FROM RELIC_ENIG_GlobalUserSettings WHERE Type = 'RELIC_ENIG_MAYA_YAXCHIN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- FavoredReligions
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO FavoredReligions
(LeaderType,				ReligionType)
SELECT	'LEADER_RELIC_ENIG_YAXCHIN',	ReligionType
FROM Religions WHERE ReligionType = 'RELIGION_CATHOLICISM'
AND EXISTS (SELECT * FROM RELIC_ENIG_GlobalUserSettings WHERE Type = 'RELIC_ENIG_MAYA_YAXCHIN' AND Value = 1);

UPDATE FavoredReligions
SET ReligionType = 'RELIGION_TZOLKIN'
WHERE LeaderType = 'LEADER_RELIC_ENIG_YAXCHIN'
AND EXISTS (SELECT ReligionType FROM Religions WHERE ReligionType = 'RELIGION_TZOLKIN');

CREATE TRIGGER RELIC_ENIG_Maya_Yaxchin_FavoredReligions
AFTER INSERT ON Religions WHEN 'RELIGION_TZOLKIN' = NEW.ReligionType
AND EXISTS (SELECT * FROM RELIC_ENIG_GlobalUserSettings WHERE Type = 'RELIC_ENIG_MAYA_YAXCHIN' AND Value = 1)
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
VALUES	('RELIC_ENIG_AJAW_TIKAL_WONDER_WHORE',					'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'PLAYER_BUILT_WONDER'),
('RELIC_ENIG_AJAW_TIKAL_MILITARY_THREAT',				'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'PLAYER_MILITARY_STRENGTH_LEAD'),
('RELIC_ENIG_AJAW_TIKAL_PRODUCTION_LEADER',				'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'PLAYER_YIELD_LEAD');
--------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments
(ModifierId,										Name,												Value,																		Type)
VALUES	('RELIC_ENIG_AJAW_TIKAL_WONDER_WHORE',					'InitialValue',										-6,																			'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_WONDER_WHORE',					'StatementKey',										'LOC_DIPLO_WARNING_LEADER_RELIC_ENIG_YAXCHIN_ATTACKED_CONTINENT',				'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_WONDER_WHORE',					'SimpleModifierDescription',						'LOC_DIPLO_MODIFIER_RELIC_ENIG_AJAW_TIKAL_ATTACKED_CONTINENT',					'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_MILITARY_THREAT',				'InitialValue',										10,																			'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_MILITARY_THREAT',				'StatementKey',										'LOC_DIPLO_KUDO_LEADER_RELIC_ENIG_YAXCHIN_DECLARED_FRIEND',						'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_MILITARY_THREAT',				'SimpleModifierDescription',						'LOC_DIPLO_MODIFIER_RELIC_ENIG_AJAW_TIKAL_DECLARED_FRIEND',						'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_PRODUCTION_LEADER',				'InitialValue',										15,																			'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_PRODUCTION_LEADER',				'YieldType',										'YIELD_PRODUCTION'),
('RELIC_ENIG_AJAW_TIKAL_PRODUCTION_LEADER',				'StatementKey',										'LOC_DIPLO_KUDO_LEADER_RELIC_ENIG_YAXCHIN_REASON_RELIGION_RECEIVED',			'ARGTYPE_IDENTITY'),
('RELIC_ENIG_AJAW_TIKAL_PRODUCTION_LEADER',				'SimpleModifierDescription',						'LOC_DIPLO_MODIFIER_AGENDA_RELIC_ENIG_AJAW_TIKAL_RELIGION_RECEIVED',			'ARGTYPE_IDENTITY');
--==========================================================================================================================
-- LEADERS: COLOURS
--==========================================================================================================================
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO PlayerColors
(Type,							Usage,				PrimaryColor, 									SecondaryColor,									 TextColor)
SELECT	'LEADER_RELIC_ENIG_YAXCHIN',		'Unique',			'COLOR_PLAYER_RELIC_ENIG_MAYA_YAXCHIN_PRIMARY',	'COLOR_PLAYER_RELIC_ENIG_MAYA_YAXCHIN_SECONDARY', 	 'COLOR_PLAYER_WHITE_TEXT'
WHERE EXISTS (SELECT * FROM RELIC_ENIG_GlobalUserSettings WHERE Type = 'RELIC_ENIG_MAYA_YAXCHIN' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Colors
(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_RELIC_ENIG_MAYA_YAXCHIN_PRIMARY', 		0,	0.266,	0,	1),
('COLOR_PLAYER_RELIC_ENIG_MAYA_YAXCHIN_SECONDARY', 	0.433,	0.726,		0.402,	1);
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
SELECT	'CIVILIZATION_RELIC_ENIG_MAYA',	'LEADER_RELIC_ENIG_YAXCHIN',	'LOC_CITY_NAME_RELIC_ENIG_TIKAL'
WHERE EXISTS (SELECT * FROM RELIC_ENIG_GlobalUserSettings WHERE Type = 'RELIC_ENIG_MAYA_YAXCHIN' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
