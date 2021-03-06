--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- StartPosition 
----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS StartPosition (MapName TEXT, Civilization TEXT, Leader TEXT, X INT default 0, Y INT default 0);
INSERT INTO StartPosition
		(Civilization,						Leader,						MapName,			X,	Y)
VALUES	('CIVILIZATION_RELIC_ENIG_MAYA',	'LEADER_RELIC_ENIG_PAKAL',	'GiantEarth',		144,47),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LEADER_RELIC_ENIG_PAKAL',	'GreatestEarthMap',	16,	32),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LEADER_RELIC_ENIG_YAXKIN',	'GiantEarth',		145,47),
		('CIVILIZATION_RELIC_ENIG_MAYA',	'LEADER_RELIC_ENIG_YAXKIN',	'GreatestEarthMap',	17,	32);

UPDATE StartPosition SET X = 151, Y = 27
WHERE Civilization = 'CIVILIZATION_PALENQUE' AND MapName = 'GiantEarth';

UPDATE StartPosition SET X = 22, Y = 16
WHERE Civilization = 'CIVILIZATION_PALENQUE' AND MapName = 'GreatestEarthMap';
--==========================================================================================================================
-- JFD RULE WITH FAITH
--==========================================================================================================================
-- Civilization_Titles
----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_Titles (
	CivilizationType  				text 		 		default null,
	GovernmentType					text 	 			default null,
	LeaderTitle					text				default null,
	PolicyType  					text 		 		default null);	
	
INSERT INTO Civilization_Titles
	(CivilizationType, 			 GovernmentType, 						PolicyType,				  	 LeaderTitle)
VALUES	('CIVILIZATION_RELIC_ENIG_MAYA',	'GOVERNMENT_CHIEFDOM',				    	    	null,			      		 	'LOC_GOVERNMENT_JFD_CHIEFDOM_LEADER_TITLE_RELIC_ENIG_MAYA'),				
	('CIVILIZATION_RELIC_ENIG_MAYA',	'GOVERNMENT_JFD_HORDE',				    	    	null,				        	'LOC_GOVERNMENT_JFD_HORDE_LEADER_TITLE_RELIC_ENIG_MAYA'),					
  	('CIVILIZATION_RELIC_ENIG_MAYA',	'GOVERNMENT_JFD_POLIS',				      	  	null,				        	'LOC_GOVERNMENT_JFD_POLIS_LEADER_TITLE_RELIC_ENIG_MAYA'),					
 	('CIVILIZATION_RELIC_ENIG_MAYA',	'GOVERNMENT_AUTOCRACY',				       		null,				        	'LOC_GOVERNMENT_JFD_AUTOCRACY_LEADER_TITLE_RELIC_ENIG_MAYA'),				
   	('CIVILIZATION_RELIC_ENIG_MAYA',	'GOVERNMENT_OLIGARCHY',				      	  	null,					        'LOC_GOVERNMENT_JFD_OLIGARCHY_LEADER_TITLE_RELIC_ENIG_MAYA'),					    	
	('CIVILIZATION_RELIC_ENIG_MAYA',	'GOVERNMENT_CLASSICAL_REPUBLIC',	  	  		null,				        	'LOC_GOVERNMENT_JFD_CLASSICAL_DEMOCRACY_LEADER_TITLE_RELIC_ENIG_MAYA'),	
    	('CIVILIZATION_RELIC_ENIG_MAYA',	'GOVERNMENT_MERCHANT_REPUBLIC',		  	  		null,				        	'LOC_GOVERNMENT_JFD_MERCHANT_REPUBLIC_LEADER_TITLE_RELIC_ENIG_MAYA'),		
    	('CIVILIZATION_RELIC_ENIG_MAYA',	'GOVERNMENT_MONARCHY',					        null,				        	'LOC_GOVERNMENT_JFD_MONARCHY_LEADER_TITLE_RELIC_ENIG_MAYA'),					    	
	('CIVILIZATION_RELIC_ENIG_MAYA',	'GOVERNMENT_JFD_ABSOLUTE_MONARCHY',			 	null,				        	'LOC_GOVERNMENT_JFD_MONARCHY_LEADER_TITLE_RELIC_ENIG_MAYA'),				
    	('CIVILIZATION_RELIC_ENIG_MAYA',	'GOVERNMENT_JFD_CONSTITUTIONAL_MONARCHY',			null,				        	'LOC_GOVERNMENT_JFD_MONARCHY_LEADER_TITLE_RELIC_ENIG_MAYA'),				
    	('CIVILIZATION_RELIC_ENIG_MAYA',	'GOVERNMENT_JFD_NOBLE_REPUBLIC',			    	null,			        		'LOC_GOVERNMENT_JFD_NOBLE_REPUBLIC_LEADER_TITLE_RELIC_ENIG_MAYA'),			
  	('CIVILIZATION_RELIC_ENIG_MAYA',	'GOVERNMENT_DEMOCRACY',					        null,			        		'LOC_GOVERNMENT_JFD_LIBERAL_DEMOCRACY_LEADER_TITLE_RELIC_ENIG_MAYA'),		
 	('CIVILIZATION_RELIC_ENIG_MAYA',	'GOVERNMENT_COMMUNISM',					        null,			        		'LOC_GOVERNMENT_JFD_PEOPLES_REPUBLIC_LEADER_TITLE_RELIC_ENIG_MAYA'),		
	('CIVILIZATION_RELIC_ENIG_MAYA',	'GOVERNMENT_FASCISM',					        null,				        	'LOC_GOVERNMENT_JFD_MILITARY_GUARDIANSHIP_LEADER_TITLE_RELIC_ENIG_MAYA'),	
    	('CIVILIZATION_RELIC_ENIG_MAYA',	 null,								'POLICY_JFD_EMPIRE',				'LOC_GOVERNMENT_JFD_EMPIRE_LEADER_TITLE_RELIC_ENIG_MAYA');					
DELETE FROM Civilization_Titles WHERE CivilizationType = 'CIVILIZATION_RELIC_ENIG_MAYA' AND GovernmentType IS NOT null AND GovernmentType NOT IN (SELECT GovernmentType FROM Governments);
DELETE FROM Civilization_Titles WHERE CivilizationType = 'CIVILIZATION_RELIC_ENIG_MAYA' AND PolicyType IS NOT null AND PolicyType NOT IN (SELECT PolicyType FROM Policies);
--==========================================================================================================================
--==========================================================================================================================
