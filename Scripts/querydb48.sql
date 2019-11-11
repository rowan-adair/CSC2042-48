-- Query Scripts
-- Rowan Adair - 40226787 - Team 48
-- Draft 1


-- Query 1 Find the number of apartments with/without ensuites and the
-- total apartments in the building.
-- Draft 3 - Rowan Adair- 40231585 - 2019-11-09
SELECT apartmentbuilding.BuildingID AS "Building", 
building.Address AS "Address",
 COUNT(CASE 
	WHEN apartment.Bedrooms = apartment.Bathrooms 
    THEN apartment.aptid 
    END) AS "Number of Ensuite Apartments",
 COUNT(CASE 
	WHEN  apartment.Bedrooms != apartment.Bathrooms 
    THEN apartment.aptid 
    END) AS "Number of Non-ensuite Apartments",
 COUNT(apartment.aptid) AS "Total Apartments"
FROM apartment
INNER JOIN apartmentbuilding ON apartment.AptID = apartmentbuilding.AptID
INNER JOIN building ON apartmentbuilding.BuildingID = building.BuildingID 
GROUP BY apartmentbuilding.buildingid;


-- Query 2 : Find managers managing multiple apartments over multiple buildings.
-- Draft 2 - Barney Young - 40231585 - 2019-11-05
SELECT Person.FirstName AS "First name", Person.LastName AS "Last name", Manager.ManagerID AS "ManagerID"
FROM Person
JOIN Employee ON Person.PersonID = Employee.PersonID
JOIN Manager ON Employee.EmployeeID = Manager.EmployeeID
JOIN (
    SELECT ApartmentManager.ManagerID, COUNT(DISTINCT ApartmentBuilding.BuildingID) AS "Number of buildings"
    From ApartmentManager
    JOIN ApartmentBuilding ON ApartmentManager.AptID = ApartmentBuilding.AptID
    GROUP BY ManagerID
    HAVING `Number of buildings` > 1
    ) dataTbl ON Manager.ManagerID = dataTbl.ManagerID;

-- Query 3 : Find employees with two or more skills and increase their pay appropriately.
-- Draft 1 - Youseff Emam
SET SQL_SAFE_UPDATES = 0;
UPDATE employee
SET employee.pay=employee.pay * 1.2
WHERE employeeID in(
SELECT * FROM(SELECT technicianskill.EmployeeID
FROM technicianskill
LEFT JOIN employee ON technicianskill.EmployeeID=employee.EmployeeID
GROUP BY EmployeeID
HAVING  COUNT(DISTINCT technicianskill.SkillID)>1)tblTmp
);

-- Query 4 : Increase rent based on size of apartments.
-- Draft 1 - Scott Lam
SET SQL_SAFE_UPDATES = 0;
UPDATE lease
Left JOIN apartment ON lease.AptID = apartment.AptID
SET lease.Rent = lease.Rent * 1.1
WHERE apartment.TotalArea >= 15;
