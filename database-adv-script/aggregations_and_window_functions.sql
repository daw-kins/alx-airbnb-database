

-- Query to Find the Total Number of Bookings Made by Each User

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(b.booking_id) AS total_bookings
FROM 
    user u
LEFT JOIN 
    booking b ON u.user_id = b.user_id
GROUP BY 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
ORDER BY 
    total_bookings DESC;




-- Query to Rank Properties Based on the Total Number of Bookings Using a Window Function


SELECT 
    p.property_id,
    p.name,
    p.location,
    p.pricepernight,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS ranking
FROM 
    property p
LEFT JOIN 
    booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id,
    p.name,
    p.location,
    p.pricepernight
ORDER BY 
    ranking ASC;