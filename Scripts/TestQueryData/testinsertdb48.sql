-- Test Data Scripts
-- Run this script for testing queries
-- Rowan Adair - 40226787 - Team 48

-- Test Inserts for Query 1
INSERT INTO building(Address,Postcode)VALUES("8 College St Belfast", "BT16DS"),("1 McClintock St Belfast","BT2 7GL");

INSERT INTO apartment (AptNo,Bedrooms,Bathrooms,TotalArea) VALUES
("1","3","3","300"), -- 1
("2","3","3","300"), -- 2 
("3","3","1","300"), -- 3
("4","1","1","300"), -- 4
("1","4","4","300"), -- 5
("2","1","1","300"), -- 6
("3","4","2","300"), -- 7
("4","1","1","300"); -- 8building
INSERT INTO apartmentbuilding(AptID,BuildingID) VALUES 
("1","1"),
("2","1"),
("3","1"),
("4","2"),
("5","2"),
("6","2");
