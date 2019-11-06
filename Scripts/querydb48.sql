-- Query Scripts
-- Rowan Adair - 40226787 - Team 48
-- Draft 1


-- Query 1 : Find the number of apartments in a building with ensuites.
SELECT apartmentbuilding.BuildingID AS "Building" , apartment.AptNo AS "Apartment No.", apartment.Bedrooms AS "Bedrooms", apartment.Bathrooms AS "Bathrooms"
FROM apartmentbuilding 
LEFT JOIN apartment ON apartmentbuilding.AptID = apartment.AptID
LEFT JOIN building ON apartmentbuilding.BuildingID = building.BuildingID 
-- May alter to display building information or extended information on tenants.
WHERE apartment.Bedrooms = apartment.Bathrooms;


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
UPDATE employee
set employee.pay=3000
Where employeeID in(
SELECT * FROM(SELECT technicianskill.EmployeeID
from technicianskill
left join employee ON technicianskill.EmployeeID=employee.EmployeeID
group by EmployeeID
HAVING  COUNT(DISTINCT technicianskill.SkillID)>1)tblTmp
);

-- Query 4 : Increase rent based on size of apartments.
-- Draft 1 - Scott Lam
