--==========================================================================================================================
-- COLOURS
--==========================================================================================================================
-- Colors
-------------------------------------	
INSERT OR REPLACE INTO Colors
		(Type,											Color)
VALUES	("COLOR_PLAYER_RELIC_ENIG_YAXCHIN_PRIMARY",		"0,68,0,255");	--#004400
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
			'LEADER_RELIC_ENIG_YAXCHIN',
			'Unique',

			'COLOR_PLAYER_RELIC_ENIG_YAXCHIN_PRIMARY',
			'COLOR_STANDARD_GREEN_LT',

			'COLOR_STANDARD_GREEN_LT',
			'COLOR_STANDARD_AQUA_DK',

			'COLOR_STANDARD_ORANGE_LT',
			'COLOR_STANDARD_AQUA_DK',

			'COLOR_STANDARD_PURPLE_DK',
			'COLOR_STANDARD_RED_LT'
		);
--==========================================================================================================================
--==========================================================================================================================
