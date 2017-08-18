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
		('DISTRICT_RELIC_ENIG_CARACOL',			'Caracol_City_Center');
--------------------------------------------------------------------------------------------------------------------------
-- Adjacency_YieldChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Adjacency_YieldChanges			
		(ID,						Description,							YieldType,		YieldChange,	TilesRequired,	AdjacentDistrict)
VALUES	('Caracol_Holy_Site', 		'LOC_DISTRICT_RELIC_ENIG_CARACOL_HOLY_SITE',		'YIELD_SCIENCE', 	1, 				1, 				'DISTRICT_HOLY_SITE'),		
		('Pa_City_Center', 			'LOC_DISTRICT_RELIC_ENIG_CARACOL_CITY_CENTER',		'YIELD_SCIENCE', 	1, 				1, 				'DISTRICT_CITY_CENTER');		
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
		(ModifierId,				ModifierType,									 Permanent,		 	SubjectRequirementSetId)
VALUES	('RELIC_ENIG_CARACOL_FAITH_PURCHASE',	'MODIFIER_CITY_ENABLE_BUILDING_FAITH_PURCHASE',	 1,			 		null);	
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
SELECT  'UNIT_RELIC_ENIG_MACUAHUITL',		BaseMoves, Cost, AdvisorType, BaseSightRange, ZoneOfControl, Domain, FormationClass, 'LOC_UNIT_RELIC_ENIG_MACUAHUITL_NAME',	'LOC_UNIT_RELIC_ENIG_MACUAHUITL_DESCRIPTION', MandatoryObsoleteTech, PurchaseYield, PromotionClass, Maintenance, Combat-5, 'CIVIC_MILITARY_TRADITION',  'TRAIT_CIVILIZATION_UNIT_RELIC_ENIG_MACUAHUITL'		
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
-- ModifierStrings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierStrings
		(ModifierId,							Context,									Text)
VALUES	('RELIC_ENIG_MACUAHUITL_SCIENCE',	'Preview',									'LOC_ABILITY_RELIC_ENIG_MACUAHUITL_SCIENCE_DESCRIPTION'),
		('RELIC_ENIG_MACUAHUITL_FAITH',		'Preview',									'LOC_ABILITY_RELIC_ENIG_MACUAHUITL_FAITH_DESCRIPTION');	
--------------------------------------------------------------------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,							Name,										Value)
VALUES	('RELIC_ENIG_MACUAHUITL_SCIENCE',		'YieldType',								'YIELD_SCIENCE'),
		('RELIC_ENIG_MACUAHUITL_SCIENCE',		'Amount',									10),
		('RELIC_ENIG_MACUAHUITL_FAITH',			'YieldType',								'YIELD_FAITH'),
		('RELIC_ENIG_MACUAHUITL_FAITH',			'Amount',									10),;
--------------------------------------------------------------------------------------------------------------------------
-- Requirements
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Requirements 			
		(RequirementId,											RequirementType)
VALUES	('RELIC_ENIG_MACUAHUITL_SCIENCE_REQ',			'REQUIREMENT_UNIT_IN_OWNER_TERRITORY'),
		('RELIC_ENIG_MACUAHUITL_FAITH_REQ',				'REQUIREMENT_UNIT_IN_ENEMY_TERRITORY');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementSets
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,										RequirementSetType)
VALUES	('RELIC_ENIG_MACUAHUITL_SCIENCE_REQ_SET',		'REQUIREMENTSET_TEST_ALL'),
		('RELIC_ENIG_MACUAHUITL_FAITH_REQ_SET',			'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
VALUES	('RELIC_ENIG_MACUAHUITL_SCIENCE_REQ_SET',			'RELIC_ENIG_MACUAHUITL_SCIENCE_REQ'),
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
