--==========================================================================================================================
											-- NAMED PLACES --
--==========================================================================================================================
-- Types
--------------------------------------------------------------------
INSERT OR REPLACE INTO Types
		(Type,									Kind)
VALUES	('NAMED_RIVER_USUMACINTA',				'KIND_NAMED_RIVER'),
		('NAMED_RIVER_CHIXOY',					'KIND_NAMED_RIVER'),
		('NAMED_RIVER_GRIJVALVA',				'KIND_NAMED_RIVER'),
		('NAMED_RIVER_SALINAS',					'KIND_NAMED_RIVER'),
		('NAMED_RIVER_MOTAGUA',					'KIND_NAMED_RIVER'),
		('NAMED_RIVER_ULUA',					'KIND_NAMED_RIVER'),
		('NAMED_RIVER_HONDO',					'KIND_NAMED_RIVER'),
		('NAMED_RIVER_BALSAS',					'KIND_NAMED_RIVER'),
		('NAMED_MOUNTAIN_CHIAPAS',				'KIND_NAMED_MOUNTAIN'),
		('NAMED_MOUNTAIN_PUUC',					'KIND_NAMED_MOUNTAIN'),
		('NAMED_MOUNTAIN_MIXTECA',				'KIND_NAMED_MOUNTAIN'),
		('NAMED_VOLCANO_TACANA',				'KIND_NAMED_VOLCANO'),
		('NAMED_VOLCANO_TAJUMULCO',				'KIND_NAMED_VOLCANO'),
		('NAMED_VOLCANO_SANTAMARIA',			'KIND_NAMED_VOLCANO'),
		('NAMED_VOLCANO_IZALCO',				'KIND_NAMED_VOLCANO'),
		('NAMED_VOLCANO_MOMOTOMBO',				'KIND_NAMED_VOLCANO'),
		('NAMED_VOLCANO_ARENAL',				'KIND_NAMED_VOLCANO'),
		('NAMED_VOLCANO_PICO_DE_ORIZABA',		'KIND_NAMED_VOLCANO'),
		('NAMED_VOLCANO_PACAYA',				'KIND_NAMED_VOLCANO'),
		('NAMED_VOLCANO_SANTIAGUITO',			'KIND_NAMED_VOLCANO'),
		('NAMED_VOLCANO_FUEGO',					'KIND_NAMED_VOLCANO');
--------------------------------------------------------------------
-- NamedRivers
--------------------------------------------------------------------
INSERT OR REPLACE INTO NamedRivers
		(NamedRiverType,				Name)
VALUES	('NAMED_RIVER_USUMACINTA',		'LOC_NAMED_RIVER_USUMACINTA_NAME'),
		('NAMED_RIVER_CHIXOY',			'LOC_NAMED_RIVER_CHIXOY_NAME'),
		('NAMED_RIVER_GRIJVALVA',		'LOC_NAMED_RIVER_GRIJVALVA_NAME'),
		('NAMED_RIVER_SALINAS',			'LOC_NAMED_RIVER_SALINAS_NAME'),
		('NAMED_RIVER_MOTAGUA',			'LOC_NAMED_RIVER_MOTAGUA_NAME'),
		('NAMED_RIVER_ULUA',			'LOC_NAMED_RIVER_ULUA_NAME'),
		('NAMED_RIVER_HONDO',			'LOC_NAMED_RIVER_HONDO_NAME'),
		('NAMED_RIVER_BALSAS',			'LOC_NAMED_RIVER_BALSAS_NAME');
--------------------------------------------------------------------
-- NamedMountains
--------------------------------------------------------------------
INSERT OR REPLACE INTO NamedMountains
		(NamedMountainType,				Name)
VALUES	('NAMED_MOUNTAIN_CHIAPAS',		'LOC_NAMED_MOUNTAIN_CHIAPAS_NAME'),
		('NAMED_MOUNTAIN_PUUC',			'LOC_NAMED_MOUNTAIN_PUUC_NAME'),
		('NAMED_MOUNTAIN_MIXTECA',		'LOC_NAMED_MOUNTAIN_MIXTECA_NAME');
--------------------------------------------------------------------
-- NamedVolcanoes
--------------------------------------------------------------------
INSERT OR REPLACE INTO NamedVolcanoes
		(NamedVolcanoType,						Name)
VALUES	('NAMED_VOLCANO_TACANA',				'LOC_NAMED_VOLCANO_TACANA_NAME'),
		('NAMED_VOLCANO_TAJUMULCO',				'LOC_NAMED_VOLCANO_TAJUMULCO_NAME'),
		('NAMED_VOLCANO_SANTAMARIA',			'LOC_NAMED_VOLCANO_SANTAMARIA_NAME'),
		('NAMED_VOLCANO_IZALCO',				'LOC_NAMED_VOLCANO_IZALCO_NAME'),
		('NAMED_VOLCANO_MOMOTOMBO',				'LOC_NAMED_VOLCANO_MOMOTOMBO_NAME'),
		('NAMED_VOLCANO_ARENAL',				'LOC_NAMED_VOLCANO_ARENAL_NAME'),
		('NAMED_VOLCANO_PICO_DE_ORIZABA',		'LOC_NAMED_VOLCANO_PICO_DE_ORIZABA_NAME'),
		('NAMED_VOLCANO_PACAYA',				'LOC_NAMED_VOLCANO_PACAYA_NAME'),
		('NAMED_VOLCANO_SANTIAGUITO',			'LOC_NAMED_VOLCANO_SANTIAGUITO_NAME'),
		('NAMED_VOLCANO_FUEGO',					'LOC_NAMED_VOLCANO_FUEGO_NAME');
--------------------------------------------------------------------
-- NamedRiverCivilizations
--------------------------------------------------------------------
INSERT OR REPLACE INTO NamedRiverCivilizations
		(NamedRiverType,				CivilizationType)
VALUES	('NAMED_RIVER_USUMACINTA',		'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_RIVER_CHIXOY',			'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_RIVER_GRIJVALVA',		'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_RIVER_SALINAS',			'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_RIVER_MOTAGUA',			'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_RIVER_ULUA',			'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_RIVER_HONDO',			'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_RIVER_BALSAS',			'CIVILIZATION_RELIC_ENIG_MAYA');
--------------------------------------------------------------------
-- NamedMountainCivilizations
--------------------------------------------------------------------
INSERT OR REPLACE INTO NamedMountainCivilizations
		(NamedMountainType,					CivilizationType)
VALUES	('NAMED_MOUNTAIN_SIERRA_MADRES',	'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_MOUNTAIN_CHIAPAS',			'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_MOUNTAIN_PUUC',				'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_MOUNTAIN_MIXTECA',			'CIVILIZATION_RELIC_ENIG_MAYA');
--------------------------------------------------------------------
-- NamedVolcanoCivilizations
--------------------------------------------------------------------
INSERT OR REPLACE INTO NamedVolcanoCivilizations
		(NamedVolcanoType,						CivilizationType)
VALUES	('NAMED_VOLCANO_POPOCATEPETL',			'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_VOLCANO_TACANA',				'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_VOLCANO_TAJUMULCO',				'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_VOLCANO_SANTAMARIA',			'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_VOLCANO_IZALCO',				'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_VOLCANO_MOMOTOMBO',				'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_VOLCANO_ARENAL',				'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_VOLCANO_PICO_DE_ORIZABA',		'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_VOLCANO_PACAYA',				'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_VOLCANO_SANTIAGUITO',			'CIVILIZATION_RELIC_ENIG_MAYA'),
		('NAMED_VOLCANO_FUEGO',					'CIVILIZATION_RELIC_ENIG_MAYA');

