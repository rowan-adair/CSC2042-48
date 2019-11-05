-- Test data for testing query 2. All other tables populated with date from insertdb48.sql
-- Running query 2, we should expect manager 3, and 4 to be returned

-- Apt 1-5 = building 1
-- Apt 6-10 = building 2
-- Apt 11-15 = building 3
-- Apt 16-20 = building 4
-- Apt 21-25 = building 5
-- Apt 26-30 = building 6
-- Apt 31-35 = building 7
-- Apt 36-40 = building 8
-- Apt 41-45 = building 9

-- All in one building, many apartments
insert into ApartmentManager (AptID, ManagerID) values (1, 1); -- B1
insert into ApartmentManager (AptID, ManagerID) values (3, 1); -- B1
insert into ApartmentManager (AptID, ManagerID) values (4, 1); -- B1

-- All in one building, one apartment
insert into ApartmentManager (AptID, ManagerID) values (6, 2); -- B2

-- Two in one building, one in a different building
insert into ApartmentManager (AptID, ManagerID) values (7, 3); -- B2
insert into ApartmentManager (AptID, ManagerID) values (8, 3); -- B2
insert into ApartmentManager (AptID, ManagerID) values (16, 3); -- B4

-- All in different buildings
insert into ApartmentManager (AptID, ManagerID) values (20, 4); -- B4
insert into ApartmentManager (AptID, ManagerID) values (22, 4); -- B5
insert into ApartmentManager (AptID, ManagerID) values (34, 4); -- B7