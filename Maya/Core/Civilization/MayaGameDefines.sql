--==========================================================================================================================
-- DISTRICTS
--==========================================================================================================================
-- Types
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Types	
		(Type,						Kind)
VALUES	('DISTRICT_RELIC_ENIG_CARACOL',			'KIND_DISTRICT');
--------------------------------------------------------------------------------------------------------------------------
-- Districts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Districts
		(DistrictType,				Name,						Description,						 TraitType,								Cost, 	Maintenance, PrereqTech, PrereqCivic, Aqueduct, PlunderType, PlunderAmount, AdvisorType, CostProgressionModel, CostProgressionParam1, RequiresPlacement, RequiresPopulation, NoAdjacentCity, InternalOnly, ZOC, CaptureRemovesBuildings, HitPoints, CaptureRemovesCityDefenses, MilitaryDomain, TravelTime, CityStrengthModifier, Appeal, Housing)
SELECT	'DISTRICT_RELIC_ENIG_CARACOL',			'LOC_DISTRICT_RELIC_ENIG_CARACOL_NAME',	'LOC_DISTRICT_RELIC_ENIG_CARACOL_DESCRIPTION',	 'TRAIT_CIVILIZATION_DISTRICT_RELIC_ENIG_CARACOL',	Cost/2, Maintenance, PrereqTech, PrereqCivic, Aqueduct, PlunderType, PlunderAmount, AdvisorType, CostProgressionModel, CostProgressionParam1, RequiresPlacement, RequiresPopulation, NoAdjacentCity, InternalOnly, ZOC, CaptureRemovesBuildings, HitPoints, CaptureRemovesCityDefenses, MilitaryDomain, TravelTime, CityStrengthModifier, Appeal, Housing
FROM Districts WHERE DistrictType = 'DISTRICT_CAMPUS';
--------------------------------------------------------------------------------------------------------------------------
-- DistrictReplaces
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO DistrictReplaces
		(CivUniqueDistrictType,		ReplacesDistrictType)
VALUES	('DISTRICT_RELIC_ENIG_CARACOL',			'DISTRICT_CAMPUS');
--------------------------------------------------------------------------------------------------------------------------
-- District_GreatPersonPoints
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO District_GreatPersonPoints
		(DistrictType,				GreatPersonClassType,		PointsPerTurn)
SELECT 	'DISTRICT_RELIC_ENIG_CARACOL',			GreatPersonClassType,		PointsPerTurn
FROM District_GreatPersonPoints WHERE DistrictType = 'DISTRICT_CAMPUS';
--------------------------------------------------------------------------------------------------------------------------
-- District_TradeRouteYields
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO District_TradeRouteYields
		(DistrictType,				YieldType,	YieldChangeAsOrigin,	YieldChangeAsDomesticDestination,	YieldChangeAsInternationalDestination)
SELECT 	'DISTRICT_RELIC_ENIG_CARACOL',			YieldType,	YieldChangeAsOrigin,	YieldChangeAsDomesticDestination,	YieldChangeAsInternationalDestination
FROM District_TradeRouteYields WHERE DistrictType = 'DISTRICT_CAMPUS';
--------------------------------------------------------------------------------------------------------------------------
-- District_ValidTerrains
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO District_ValidTerrains
		(DistrictType,				TerrainType)
SELECT 	'DISTRICT_RELIC_ENIG_CARACOL',			TerrainType
FROM District_ValidTerrains WHERE DistrictType = 'DISTRICT_CAMPUS';
--------------------------------------------------------------------------------------------------------------------------
-- District_Adjacencies
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO District_Adjacencies
		(DistrictType,				YieldChangeId)
SELECT 	'DISTRICT_RELIC_ENIG_CARACOL',			YieldChangeId
FROM District_Adjacencies WHERE DistrictType = 'DISTRICT_CAMPUS';

INSERT INTO District_Adjacencies
		(DistrictType,				YieldChangeId)
VALUES	('DISTRICT_RELIC_ENIG_CARACOL',			'Caracol_Holy_Site'),
		('DISTRICT_RELIC_ENIG_CARACOL',		'Caracol_City_Center');
--------------------------------------------------------------------------------------------------------------------------
-- Adjacency_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Adjacency_YieldChanges			
		(ID,						Description,							YieldType,		YieldChange,	TilesRequired,	AdjacentDistrict)
VALUES	('Caracol_Holy_Site', 			'LOC_DISTRICT_RELIC_ENIG_CARACOL_HOLY_SITE',		'YIELD_SCIENCE', 	1, 				1, 				'DISTRICT_HOLY_SITE'),		
	('Caracol_City_Center', 		'LOC_DISTRICT_RELIC_ENIG_CARACOL_CITY_CENTER',		'YIELD_SCIENCE', 	1, 				1, 				'DISTRICT_CITY_CENTER');		
--------------------------------------------------------------------------------------------------------------------------
-- District_CitizenYieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO District_CitizenYieldChanges
		(DistrictType,				YieldType,	YieldChange)
SELECT 	'DISTRICT_RELIC_ENIG_CARACOL',			YieldType,	YieldChange
FROM District_CitizenYieldChanges WHERE DistrictType = 'DISTRICT_CAMPUS';
--------------------------------------------------------------------------------------------------------------------------
-- DistrictModifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO DistrictModifiers
		(DistrictType,				ModifierId)
SELECT 	'DISTRICT_RELIC_ENIG_CARACOL',			ModifierId
FROM DistrictModifiers WHERE DistrictType = 'DISTRICT_CAMPUS';

INSERT INTO DistrictModifiers
		(DistrictType,				ModifierId)
VALUES	('DISTRICT_RELIC_ENIG_CARACOL',			'RELIC_ENIG_CARACOL_FAITH_PURCHASE');
--------------------------------------------------------------------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Modifiers	
		(ModifierId,							ModifierType,											 	SubjectRequirementSetId)
VALUES	('RELIC_ENIG_CARACOL_FAITH_PURCHASE',	'MODIFIER_PLAYER_CITIES_ENABLE_BUILDING_FAITH_PURCHASE',	null);	
--------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,				Name,									 		Value)
VALUES	('RELIC_ENIG_CARACOL_FAITH_PURCHASE',	'DistrictType',						'DISTRICT_RELIC_ENIG_CARACOL');
--==========================================================================================================================
-- DISTRICTS: TRAITS
--==========================================================================================================================
-- Types			
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Types	
		(Type,										Kind)
VALUES	('TRAIT_CIVILIZATION_DISTRICT_RELIC_ENIG_CARACOL',		'KIND_TRAIT');
--------------------------------------------------------------------------------------------------------------------------		
-- Traits			
--------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Traits				
		(TraitType,									Name,												Description)
VALUES	('TRAIT_CIVILIZATION_DISTRICT_RELIC_ENIG_CARACOL',		'LOC_TRAIT_CIVILIZATION_DISTRICT_RELIC_ENIG_CARACOL_NAME',		null);
--==========================================================================================================================
-- PROJECTS
--==========================================================================================================================
-- Types
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Types	
		(Type,							Kind)
VALUES	('PROJECT_RELIC_ENIG_VENUS',		'KIND_PROJECT');		
------------------------------------------------------------------------------------------------------------------------
-- Projects
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Projects	
		(ProjectType,					ShortName,								 Name,								Description,								PrereqDistrict, 	  	 PrereqTech,				 Cost, AdvisorType, CostProgressionModel, CostProgressionParam1, AmenitiesWhileActive,  PrereqResource)
SELECT  'PROJECT_RELIC_ENIG_VENUS',		'LOC_PROJECT_RELIC_ENIG_VENUS_SHORT_NAME', 'LOC_PROJECT_RELIC_ENIG_VENUS_NAME',	'LOC_PROJECT_RELIC_ENIG_VENUS_DESCRIPTION',	'DISTRICT_RELIC_ENIG_CARACOL',  'TECH_WRITING', Cost, AdvisorType, CostProgressionModel, CostProgressionParam1,	AmenitiesWhileActive, PrereqResource		
FROM Projects WHERE ProjectType = 'PROJECT_ENHANCE_DISTRICT_CAMPUS'; 
------------------------------------------------------------------------------------------------------------------------
-- Project_YieldConversions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Project_YieldConversions	
		 (ProjectType,					YieldType,			PercentOfProductionRate)
VALUES	('PROJECT_RELIC_ENIG_VENUS',		'YIELD_FAITH', 		5);
------------------------------------------------------------------------------------------------------------------------
-- Project_GreatPersonPoints
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Project_GreatPersonPoints	
		(ProjectType,					GreatPersonClassType,			Points,			PointProgressionModel, 				PointProgressionParam1)
VALUES	('PROJECT_RELIC_ENIG_VENUS',		'GREAT_PERSON_CLASS_PROPHET', 	5,				'COST_PROGRESSION_GAME_PROGRESS',	800);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Types
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Types	
		(Type,					Kind)
VALUES	('UNIT_RELIC_ENIG_MACUAHUITL',		'KIND_UNIT');	
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units	
		(UnitType,				BaseMoves, Cost, AdvisorType, BaseSightRange, ZoneOfControl, Domain, FormationClass, Name,						Description,					 MandatoryObsoleteTech, PurchaseYield, PromotionClass, Maintenance, Combat,   PrereqCivic, 				  TraitType)
SELECT  'UNIT_RELIC_ENIG_MACUAHUITL',		BaseMoves, Cost-20, AdvisorType, BaseSightRange, ZoneOfControl, Domain, FormationClass, 'LOC_UNIT_RELIC_ENIG_MACUAHUITL_NAME',	'LOC_UNIT_RELIC_ENIG_MACUAHUITL_DESCRIPTION', MandatoryObsoleteTech, PurchaseYield, PromotionClass, Maintenance, Combat-5, 'CIVIC_MILITARY_TRADITION',  'TRAIT_CIVILIZATION_UNIT_RELIC_ENIG_MACUAHUITL'		
FROM Units WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- UnitReplaces
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitReplaces	
		(CivUniqueUnitType,		ReplacesUnitType)
VALUES	('UNIT_RELIC_ENIG_MACUAHUITL',		'UNIT_SWORDSMAN');
--------------------------------------------------------------------------------------------------------------------------
-- UnitUpgrades
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitUpgrades	
		(Unit,					UpgradeUnit)
SELECT  'UNIT_RELIC_ENIG_MACUAHUITL',		UpgradeUnit
FROM UnitUpgrades WHERE Unit = 'UNIT_SWORDSMAN'; 
--------------------------------------------------------------------------------------------------------------------------
-- UnitAIInfos
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitAIInfos	
		(UnitType,				AiType)
SELECT  'UNIT_RELIC_ENIG_MACUAHUITL',		AiType
FROM UnitAIInfos WHERE UnitType = 'UNIT_SWORDSMAN'; 
--------------------------------------------------------------------------------------------------------------------------
-- Tags
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Tags	
		(Tag,					Vocabulary)
VALUES	('CLASS_RELIC_ENIG_MACUAHUITL',		'ABILITY_CLASS');	
--------------------------------------------------------------------------------------------------------------------------
-- TypeTags
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO TypeTags	
		(Type,					Tag)
SELECT  'UNIT_RELIC_ENIG_MACUAHUITL',		Tag
FROM TypeTags WHERE Type = 'UNIT_SWORDSMAN';

INSERT INTO TypeTags	
		(Type,					Tag)
VALUES	('UNIT_RELIC_ENIG_MACUAHUITL',		'CLASS_RELIC_ENIG_MACUAHUITL');
--==========================================================================================================================
-- UNITS: ABILITIES
--==========================================================================================================================
-- Types
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Types	
		(Type,									Kind)
VALUES	('ABILITY_RELIC_ENIG_MACUAHUITL',					'KIND_ABILITY');	
--------------------------------------------------------------------------------------------------------------------------
-- TypeTags
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO TypeTags	
		(Type,									Tag)
VALUES	('ABILITY_RELIC_ENIG_MACUAHUITL',					'CLASS_RELIC_ENIG_MACUAHUITL');	
--------------------------------------------------------------------------------------------------------------------------
-- UnitAbilities
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitAbilities	
		(UnitAbilityType,						Name,										Inactive,	 Description)
VALUES	('ABILITY_RELIC_ENIG_MACUAHUITL',					'LOC_ABILITY_RELIC_ENIG_MACUAHUITL_NAME',				0,			 'LOC_ABILITY_RELIC_ENIG_MACUAHUITL_DESCRIPTION');	
--------------------------------------------------------------------------------------------------------------------------
-- UnitAbilityModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitAbilityModifiers	
		(UnitAbilityType,						ModifierId)
VALUES	('ABILITY_RELIC_ENIG_MACUAHUITL',					'RELIC_ENIG_MACUAHUITL_SCIENCE'),
	('ABILITY_RELIC_ENIG_MACUAHUITL',					'RELIC_ENIG_MACUAHUITL_FAITH');		
--------------------------------------------------------------------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Modifiers	
		(ModifierId,							ModifierType,								Permanent,	SubjectRequirementSetId)
VALUES	('RELIC_ENIG_MACUAHUITL_SCIENCE',		'MODIFIER_UNIT_ADJUST_POST_COMBAT_YIELD',		0,			'RELIC_ENIG_MACUAHUITL_SCIENCE_REQ_SET'),
	('RELIC_ENIG_MACUAHUITL_FAITH',			'MODIFIER_UNIT_ADJUST_POST_COMBAT_YIELD',		0,			'RELIC_ENIG_MACUAHUITL_FAITH_REQ_SET');	
--------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,							Name,										Value)
VALUES	('RELIC_ENIG_MACUAHUITL_SCIENCE',		'YieldType',								'YIELD_SCIENCE'),
	('RELIC_ENIG_MACUAHUITL_SCIENCE',		'PercentDefeatedStrength',							50),
	('RELIC_ENIG_MACUAHUITL_FAITH',			'YieldType',								'YIELD_FAITH'),
	('RELIC_ENIG_MACUAHUITL_FAITH',			'PercentDefeatedStrength',									50);
--------------------------------------------------------------------------------------------------------------------------
-- Requirements
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Requirements 			
		(RequirementId,											RequirementType)
VALUES	('RELIC_ENIG_MACUAHUITL_SCIENCE_REQ',				'REQUIREMENT_UNIT_IN_OWNER_TERRITORY'),
	('RELIC_ENIG_MACUAHUITL_FAITH_REQ',				'REQUIREMENT_UNIT_IN_ENEMY_TERRITORY');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementSets
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,										RequirementSetType)
VALUES	('RELIC_ENIG_MACUAHUITL_SCIENCE_REQ_SET',			'REQUIREMENTSET_TEST_ALL'),
		('RELIC_ENIG_MACUAHUITL_FAITH_REQ_SET',			'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
VALUES	('RELIC_ENIG_MACUAHUITL_SCIENCE_REQ_SET',				'RELIC_ENIG_MACUAHUITL_SCIENCE_REQ'),
		('RELIC_ENIG_MACUAHUITL_FAITH_REQ_SET',				'RELIC_ENIG_MACUAHUITL_FAITH_REQ');	
--==========================================================================================================================
-- UNITS: TRAITS
--==========================================================================================================================	
-- Types			
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Types	
		(Type,									Kind)
VALUES	('TRAIT_CIVILIZATION_UNIT_RELIC_ENIG_MACUAHUITL',	'KIND_TRAIT');
--------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Traits				
		(TraitType,								Name,							Description)
VALUES	('TRAIT_CIVILIZATION_UNIT_RELIC_ENIG_MACUAHUITL',	'LOC_UNIT_RELIC_ENIG_MACUAHUITL_NAME',		null);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- Types
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Types	
		(Type,						Kind)
VALUES	('CIVILIZATION_RELIC_ENIG_MAYA',	'KIND_CIVILIZATION');
----------------------------------------------------------------------------------------------------------------------------
-- Civilizations
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations	
		(CivilizationType,			Name,								Description,								Adjective,								StartingCivilizationLevelType,	RandomCityNameDepth,	Ethnicity)
VALUES	('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CIVILIZATION_RELIC_ENIG_MAYA_NAME',	'LOC_CIVILIZATION_RELIC_ENIG_MAYA_DESCRIPTION',	'LOC_CIVILIZATION_RELIC_ENIG_MAYA_ADJECTIVE',	'CIVILIZATION_LEVEL_FULL_CIV',	10,						'ETHNICITY_SOUTHAM');	
----------------------------------------------------------------------------------------------------------------------------			
-- CityNames			
----------------------------------------------------------------------------------------------------------------------------		
INSERT INTO CityNames	
			(CivilizationType,								CityName)	
VALUES		('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_PALENQUE'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_COPAN'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_TIKAL'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_Q''UMARKAJ'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_CHICHEN_ITZA'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_MAYAPAN'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_IXIMCHE'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_CALAKMUL'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_YO''K''IB'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_TULU''UM'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_YAXCHILAN'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_OXMAL'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_DZIBILCHALTUN'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_CH''EN_CHUN_CHUKUM'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_KAMINALJUYU'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_KAN'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_NAKBE'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_QUIRIGUA'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_BEKAN'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_YAXHA'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_OXWITZA'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_KOBA_'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_DOS_PILAS'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_SAN_BARTOLO'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_WAKA'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_OXKINTOK'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_SA''AAL'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_IXKUN'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_EL_BAUL'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_CEIBAL'),	
			('CIVILIZATION_RELIC_ENIG_MAYA',			'LOC_CITY_NAME_MAYA_NAACHTUN');	
----------------------------------------------------------------------------------	
----------------------------------------------------------------------------------	
	
----------------------------------------------------------------------------------------------------------------------------
-- CivilizationCitizenNames
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO CivilizationCitizenNames	
		(CivilizationType,			CitizenName,								Female,		Modern)
VALUES	('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MALE_1',				0,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MALE_2',				0,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MALE_3',				0,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MALE_4',				0,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MALE_5',				0,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MALE_6',				0,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MALE_7',				0,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MALE_8',				0,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MALE_9',				0,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MALE_10',				0,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_FEMALE_1',			1,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_FEMALE_2',			1,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_FEMALE_3',			1,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_FEMALE_4',			1,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_FEMALE_5',			1,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_FEMALE_6',			1,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_FEMALE_7',			1,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_FEMALE_8',			1,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_FEMALE_9',			1,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_FEMALE_10',			1,			0),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_MALE_1',		0,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_MALE_2',		0,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_MALE_3',		0,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_MALE_4',		0,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_MALE_5',		0,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_MALE_6',		0,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_MALE_7',		0,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_MALE_8',		0,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_MALE_9',		0,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_MALE_10',		0,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_FEMALE_1',		1,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_FEMALE_2',		1,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_FEMALE_3',		1,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_FEMALE_4',		1,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_FEMALE_5',		1,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_FEMALE_6',		1,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_FEMALE_7',		1,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_FEMALE_8',		1,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_FEMALE_9',		1,			1),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LOC_CITIZEN_RELIC_ENIG_MAYA_MODERN_FEMALE_10',	1,			1);	
----------------------------------------------------------------------------------------------------------------------------			
-- CivilizationInfo			
----------------------------------------------------------------------------------------------------------------------------		
INSERT INTO CivilizationInfo	
		(CivilizationType,				Header,						Caption,								SortIndex)	
VALUES	('CIVILIZATION_RELIC_ENIG_MAYA',		'LOC_CIVINFO_LOCATION',		'LOC_CIVINFO_RELIC_ENIG_MAYA_LOCATION',		10),	
		('CIVILIZATION_RELIC_ENIG_MAYA',		'LOC_CIVINFO_SIZE',			'LOC_CIVINFO_RELIC_ENIG_MAYA_SIZE',			20),	
		('CIVILIZATION_RELIC_ENIG_MAYA',		'LOC_CIVINFO_POPULATION',	'LOC_CIVINFO_RELIC_ENIG_MAYA_POPULATION',		30),	
		('CIVILIZATION_RELIC_ENIG_MAYA',		'LOC_CIVINFO_CAPITAL', 		'LOC_CIVINFO_RELIC_ENIG_MAYA_CAPITAL',		40);
----------------------------------------------------------------------------------------------------------------------------
-- CivilizationTraits
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO CivilizationTraits	
		(TraitType,													CivilizationType)
VALUES	('TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS',						'CIVILIZATION_RELIC_ENIG_MAYA'),
		('TRAIT_CIVILIZATION_DISTRICT_RELIC_ENIG_CARACOL',						'CIVILIZATION_RELIC_ENIG_MAYA'),
		('TRAIT_CIVILIZATION_UNIT_RELIC_ENIG_MACUAHUITL',						'CIVILIZATION_RELIC_ENIG_MAYA');
--==========================================================================================================================
-- CIVILIZATIONS: TRAITS
--==========================================================================================================================
-- Types
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Types	
		(Type,											Kind)
VALUES	('TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS',					'KIND_TRAIT');	
--------------------------------------------------------------------------------------------------------------------------			
-- Traits			
--------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Traits				
		(TraitType,										Name,												Description)
VALUES	('TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS',					'LOC_TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS_NAME',				'LOC_TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS_DESCRIPTION');	
--------------------------------------------------------------------------------------------------------------------------		
-- TraitModifiers		
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO TraitModifiers			
		(TraitType,										ModifierId)
VALUES	('TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS',					'RELIC_ENIG_CALENDAR_ROUNDS_HOLY_SITE_FREE');
--------------------------------------------------------------------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers	
		(ModifierId,									ModifierType,										SubjectRequirementSetId)
VALUES	('RELIC_ENIG_CALENDAR_ROUNDS_HOLY_SITE_FREE',		'MODIFIER_SINGLE_CITY_EXTRA_DISTRICT',					'RELIC_ENIG_CALENDAR_ROUNDS_HOLY_SITE_FREE_REQ_SET');
--------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,									Name,												Value)
VALUES	('RELIC_ENIG_CALENDAR_ROUNDS_HOLY_SITE_FREE',	'Amount',										1);
--------------------------------------------------------------------------------------------------------------------------
-- Requirements
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Requirements 			
		(RequirementId,											RequirementType)
VALUES	('RELIC_ENIG_CALENDAR_ROUNDS_HOLY_SITE_FREE_REQ',			'REQUIREMENT_CITY_HAS_DISTRICT');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId,											Name,																			Value)
VALUES	('RELIC_ENIG_CALENDAR_ROUNDS_HOLY_SITE_FREE_REQ',				'DistrictType',																	'DISTRICT_HOLY_SITE');	
--------------------------------------------------------------------------------------------------------------------------
-- RequirementSets
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,										RequirementSetType)
VALUES	('RELIC_ENIG_CALENDAR_ROUNDS_HOLY_SITE_FREE_REQ_SET',		'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
VALUES	('RELIC_ENIG_CALENDAR_ROUNDS_HOLY_SITE_FREE_REQ_SET',			'RELIC_ENIG_CALENDAR_ROUNDS_HOLY_SITE_FREE_REQ');	
--==========================================================================================================================
--==========================================================================================================================
--MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE
--Complicated SQL! Yay!
INSERT INTO Modifiers
		(ModifierId,			ModifierType)
SELECT	'RELIC_ENIG_CALENDAR_ROUNDS_'||BuildingType||'_SCIENCE',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND InternalOnly = 0 AND TraitType IS NULL;
INSERT INTO ModifierArguments
		(ModifierId,												 Name,			 Value)
SELECT 'RELIC_ENIG_CALENDAR_ROUNDS_'||b.BuildingType||'_SCIENCE',	'Value',		a.YieldChange/2
FROM Buildings AS b, Building_YieldChanges AS a WHERE b.BuildingType = a.BuildingType
												 AND b.PrereqDistrict = "DISTRICT_HOLY_SITE" 
												 AND b.TraitType IS NULL
												 AND b.InternalOnly = 0
												 AND a.YieldType = "YIELD_FAITH";
INSERT INTO ModifierArguments
		(ModifierId,	Name,	Value)
SELECT	'RELIC_ENIG_CALENDAR_ROUNDS_'||BuildingType||'_SCIENCE',	'YieldType',	'Science'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND InternalOnly = 0 AND TraitType IS NULL;

INSERT INTO ModifierArguments
		(ModifierId,	Name,	Value)
SELECT	'RELIC_ENIG_CALENDAR_ROUNDS_'||BuildingType||'_SCIENCE',	'BuildingType',	BuildingType
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND InternalOnly = 0 AND TraitType IS NULL;

INSERT INTO TraitModifiers
		(TraitType,				ModifierId)
SELECT	'TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS',	ModifierId
FROM Modifiers WHERE ModifierId LIKE 'RELIC_ENIG_CALENDAR_ROUNDS_%';

CREATE TRIGGER Relic_Maya_Holy_Site_ScienceTriggerBuildings
AFTER INSERT ON Buildings
WHEN NEW.PrereqDistrict = 'DISTRICT_HOLY_SITE' AND NEW.InternalOnly = 0 AND TraitType IS NULL
BEGIN
		INSERT INTO TraitModifiers
				(TraitType,				ModifierId)
		VALUES	('TRAIT_CIVILIZATION_RELIC_ENIG_CALENDAR_ROUNDS',	'RELIC_ENIG_CALENDAR_ROUNDS_'||NEW.BuildingType||'_SCIENCE');
		INSERT INTO ModifierArguments
				(ModifierId, Name,	Value)
		VALUES	('RELIC_ENIG_CALENDAR_ROUNDS_'||NEW.BuildingType||'_SCIENCE',	'YieldType',	'Science'),
				('RELIC_ENIG_CALENDAR_ROUNDS_'||NEW.BuildingType||'_SCIENCE',	'BuildingType',	NEW.BuildingType);
		INSERT INTO Modifiers
				(ModifierId, ModifierType)
		VALUES	('RELIC_ENIG_CALENDAR_ROUNDS_'||NEW.BuildingType||'_SCIENCE',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE');
END;
CREATE TRIGGER Relic_Maya_Holy_Site_ScienceTriggerBuilding_YieldChanges
AFTER INSERT ON Building_YieldChanges
WHEN NEW.BuildingType = (SELECT b.BuildingType FROM Buildings AS b, Building_YieldChanges AS a WHERE b.BuildingType = a.BuildingType
												 AND b.PrereqDistrict = "DISTRICT_HOLY_SITE" 
												 AND b.TraitType IS NULL
												 AND b.InternalOnly = 0
												 AND a.YieldType = "YIELD_FAITH")
BEGIN
		INSERT INTO ModifierArguments
				(ModifierId, Name,	Value)
		VALUES	('RELIC_ENIG_CALENDAR_ROUNDS_'||NEW.BuildingType||'_SCIENCE',	'Value',	NEW.YieldChange/2);
END;
