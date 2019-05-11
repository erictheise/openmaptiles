CREATE OR REPLACE FUNCTION layer_neighborhood(bbox geometry, zoom_level int)
RETURNS TABLE(geometry geometry, name text) AS $$
    SELECT wkb_geometry AS geometry, name
    FROM z_neighborhoods
    WHERE wkb_geometry && bbox;
$$ LANGUAGE SQL IMMUTABLE;
