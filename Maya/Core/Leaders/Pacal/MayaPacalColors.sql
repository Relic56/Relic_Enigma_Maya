--==========================================================================================================================
-- COLOURS
--==========================================================================================================================
-- Colors
-------------------------------------	
INSERT OR REPLACE INTO Colors
		(Type,											Color)
VALUES	("COLOR_PLAYER_RELIC_ENIG_PAKAL_PRIMARY",		"198,151,60,255"),	--#C6973C
		("COLOR_PLAYER_RELIC_ENIG_PAKAL_SECONDARY",		"41,84,88,255"),	--#295458
		("COLOR_PLAYER_RELIC_ENIG_PAKAL_PRIMARY_1",		"9,49,50,255");	--#093132
-------------------------------------
-- PlayerColors
-------------------------------------	
INSERT INTO PlayerColors
		(
			Type,
			Usage,

			PrimaryColor,
			SecondaryColor,

			Alt1PrimaryColor,
			Alt1SecondaryColor,

			Alt2PrimaryColor,
			Alt2SecondaryColor,

			Alt3PrimaryColor,
			Alt3SecondaryColor
		)
VALUES
		(
			'LEADER_RELIC_ENIG_PAKAL',
			'Unique',

			'COLOR_PLAYER_RELIC_ENIG_PAKAL_PRIMARY',
			'COLOR_PLAYER_RELIC_ENIG_PAKAL_SECONDARY',

			'COLOR_STANDARD_GREEN_LT',
			'COLOR_STANDARD_AQUA_DK',

			'COLOR_PLAYER_RELIC_ENIG_PAKAL_PRIMARY_1',
			'COLOR_STANDARD_GREEN_LT',

			'COLOR_STANDARD_PURPLE_DK',
			'COLOR_STANDARD_RED_LT'
		);
--==========================================================================================================================
--==========================================================================================================================
