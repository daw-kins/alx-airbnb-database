SELECT 
    p.property_id,
    p.name,
    p.location,
    p.pricepernight
FROM 
    property p
WHERE 
    p.property_id IN (
        SELECT 
            r.property_id
        FROM 
            review r
        GROUP BY 
            r.property_id
        HAVING 
            AVG(r.rating) > 4.0
    )
ORDER BY 
    p.name ASC;