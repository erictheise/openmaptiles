CREATE OR REPLACE FUNCTION layer_tlotd(bbox geometry, zoom_level int)
RETURNS TABLE(geometry geometry, filmmaker text, addr text, street text) AS $$
    SELECT geometry, name AS filmmaker, tags->'addr:housenumber' AS addr, tags->'addr:street' AS street
    FROM osm_poi_point
    WHERE geometry && bbox AND subclass = 'tlotd';
$$ LANGUAGE SQL IMMUTABLE;
