-- Query Scripts
-- Rowan Adair - 40226787 - Team 48
-- Draft 1


-- Query 1 : Find the number of apartments in a building with ensuites.
SELECT apartmentbuilding.BuildingID AS "Building" , apartment.AptNo AS "Apartment No.", apartment.Bedrooms AS "Bedrooms", apartment.Bathrooms AS "Bathrooms"
FROM apartmentbuilding 
LEFT JOIN apartment ON apartmentbuilding.AptID = apartment.AptID
-- LEFT JOIN building ON apartmentbuilding.BuildingID = building.BuildingID 
-- May alter to display building information or extended information on tenants.
WHERE apartment.Bedrooms = apartment.Bathrooms;
