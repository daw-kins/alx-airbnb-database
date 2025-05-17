--Inner Join
--Retrieve all bookings and the respective users who made those bookings

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    booking b
INNER JOIN 
    user u ON b.user_id = u.user_id
ORDER BY 
    b.start_date DESC;

-- left join
--Retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    p.property_id,
    p.name,
    p.location,
    p.pricepernight,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at
FROM 
    property p
LEFT JOIN 
    review r ON p.property_id = r.property_id
ORDER BY 
    p.name ASC;

--FULL OUTER JOIN
-- Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status
FROM 
    user u
LEFT JOIN 
    booking b ON u.user_id = b.user_id
UNION
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status
FROM 
    user u
RIGHT JOIN 
    booking b ON u.user_id = b.user_id
ORDER BY 
    u.user_id ASC, b.start_date DESC;