--UA Stuff for the lua code
CREATE TABLE C15_REL_CityStateGPLinkage
 (Type TEXT, GreatPersonClassType TEXT DEFAULT 'GREATPERSONCLASS_CHOOSEONE',
  PRIMARY KEY (Type, GreatPersonClassType),
  FOREIGN KEY (Type) REFERENCES TypeProperties  (Type) , 
  FOREIGN KEY (GreatPersonClassType) REFERENCES GreatPersonClasses (GreatPersonClassType));

INSERT INTO C15_REL_CityStateGPLinkage
		(Type, GreatPersonClassType)
SELECT	Type, 'GREAT_PERSON_CLASS_SCIENTIST'
FROM TypeProperties WHERE Value = 'SCIENTIFIC' AND Name = 'CityStateCategory';

INSERT INTO C15_REL_CityStateGPLinkage
		(Type, GreatPersonClassType)
SELECT	Type, 'GREAT_PERSON_CLASS_MERCHANT'
FROM TypeProperties WHERE Value = 'TRADE' AND Name = 'CityStateCategory';

INSERT INTO C15_REL_CityStateGPLinkage
		(Type, GreatPersonClassType)
SELECT	Type, 'GREAT_PERSON_CLASS_PROPHET'
FROM TypeProperties WHERE Value = 'RELIGIOUS' AND Name = 'CityStateCategory';

INSERT INTO C15_REL_CityStateGPLinkage
		(Type, GreatPersonClassType)
SELECT	Type, 'GREAT_PERSON_CLASS_ARTIST'
FROM TypeProperties WHERE Value = 'CULTURAL' AND Name = 'CityStateCategory';

INSERT INTO C15_REL_CityStateGPLinkage
		(Type, GreatPersonClassType)
SELECT	Type, 'GREAT_PERSON_CLASS_WRITER'
FROM TypeProperties WHERE Value = 'CULTURAL' AND Name = 'CityStateCategory';

INSERT INTO C15_REL_CityStateGPLinkage
		(Type, GreatPersonClassType)
SELECT	Type, 'GREAT_PERSON_CLASS_MUSICIAN'
FROM TypeProperties WHERE Value = 'CULTURAL' AND Name = 'CityStateCategory';

INSERT INTO C15_REL_CityStateGPLinkage
		(Type, GreatPersonClassType)
SELECT	Type, 'GREAT_PERSON_CLASS_ENGINEER'
FROM TypeProperties WHERE Value = 'INDUSTRIAL' AND Name = 'CityStateCategory';

INSERT INTO C15_REL_CityStateGPLinkage
		(Type, GreatPersonClassType)
SELECT	Type, 'GREAT_PERSON_CLASS_GENERAL'
FROM TypeProperties WHERE Value = 'MILITARISTIC' AND Name = 'CityStateCategory';

INSERT INTO C15_REL_CityStateGPLinkage
		(Type, GreatPersonClassType)
SELECT	Type, 'GREAT_PERSON_CLASS_ADMIRAL'
FROM TypeProperties WHERE Value = 'MILITARISTIC' AND Name = 'CityStateCategory';