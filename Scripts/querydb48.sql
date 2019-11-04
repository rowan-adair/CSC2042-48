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
-- Draft 1 - Barney Young - 40231585 - Definitely need to test this properly. Also will need to add more joins if we want to display the manager's name instead of just their ManagerID. **TBD**
SELECT ManagerID AS "Manager"
FROM apartmentmanager
JOIN apartmentmanager ON apartmentbuilding.AptID = apartmentmanager.AptID
WHERE COUNT(apartmentbuilding.BuildingID) > 1;

-- Query 3 : Find employees with two or more skills and increase their pay appropriately.
-- Draft 1 - Youseff Emam

-- Query 4 : Increase rent based on size of apartments.
-- Draft 1 - Scott Lam
