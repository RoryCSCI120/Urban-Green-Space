SELECT osm_id, name, ST_Area(way) as area
FROM planet_osm_polygon
WHERE leisure = 'park'
ORDER BY area DESC;
--This command allowed me to view the table of leisure areas designated as parks in my data which I dowloaded from BBBike in order of area. 

CREATE TABLE green_spaces (
id SERIAL PRIMARY KEY,
name VARCHAR (255),
location GEOMETRY (Point, 4326),
area_sq_m NUMERIC
);
--I used this command to to create a separate table for the items specified int he table above.

INSERT INTO green_spaces (name, location, area_sq_m)
SELECT name, ST_Centroid(way), ST_Area(way) 
FROM planet_osm_polygon
WHERE leisure = 'park';
--I used this command to then populate the parks data into the new green_spaces table.

SELECT SUM(ST_Area(way)) as total_green_space_area
FROM planet_osm_polygon
WHERE leisure = 'park';
--This command took the park data in the green_spaces table and added together all of the areas, producing the sum area of parks in the data.

SELECT name, ST_Area(way) as area
FROM planet_osm_polygon
WHERE leisure = 'park'
ORDER BY area DESC
LIMIT 5;
-- This command ranked the parks by area in descending order and then selected the top 5, producing the top 5 largest parks in the data.

SELECT name, ST_Area(way) as area
From planet_osm_polygon
WHERE place = 'municipality'
-- This command allowed me to see the municipalities in the data, therefore granting me access to the area of the city boundary of Curitiba.