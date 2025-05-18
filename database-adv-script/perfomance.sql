-- Initial Query: Retrieve all bookings with user, property, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.total_price,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    u.email AS user_email,
    p.name AS property_name,
    p.location AS property_location,
    p.pricepernight,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method
FROM 
    booking b
INNER JOIN 
    user u ON b.user_id = u.user_id
INNER JOIN 
    property p ON b.property_id = p.property_id
LEFT JOIN 
    payment pay ON b.booking_id = pay.booking_id
ORDER BY 
    b.start_date DESC;


--Running EXPLAIN on the Initial Query:

EXPLAIN SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.total_price,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    u.email AS user_email,
    p.name AS property_name,
    p.location AS property_location,
    p.pricepernight,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method
FROM 
    booking b
INNER JOIN 
    user u ON b.user_id = u.user_id
INNER JOIN 
    property p ON b.property_id = p.property_id
LEFT JOIN 
    payment pay ON b.booking_id = pay.booking_id
ORDER BY 
    b.start_date DESC;


-- Refactored Query: Retrieve all bookings with user, property, and payment details
WITH filtered_bookings AS (
    SELECT 
        booking_id,
        property_id,
        user_id,
        start_date,
        end_date,
        status,
        total_price
    FROM 
        booking
    WHERE 
        start_date >= '2025-01-01'
)
SELECT 
    fb.booking_id,
    fb.start_date,
    fb.end_date,
    fb.status,
    fb.total_price,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    u.email AS user_email,
    p.name AS property_name,
    p.location AS property_location,
    p.pricepernight,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method
FROM 
    filtered_bookings fb
INNER JOIN 
    user u ON fb.user_id = u.user_id
INNER JOIN 
    property p ON fb.property_id = p.property_id
LEFT JOIN 
    payment pay ON fb.booking_id = pay.booking_id
ORDER BY 
    fb.start_date DESC;


--Analyze Refactored Query Performance Using EXPLAIN

EXPLAIN WITH filtered_bookings AS (
    SELECT 
        booking_id,
        property_id,
        user_id,
        start_date,
        end_date,
        status,
        total_price
    FROM 
        booking
    WHERE 
        start_date >= '2025-01-01'
)
SELECT 
    fb.booking_id,
    fb.start_date,
    fb.end_date,
    fb.status,
    fb.total_price,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    u.email AS user_email,
    p.name AS property_name,
    p.location AS property_location,
    p.pricepernight,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method
FROM 
    filtered_bookings fb
INNER JOIN 
    user u ON fb.user_id = u.user_id
INNER JOIN 
    property p ON fb.property_id = p.property_id
LEFT JOIN 
    payment pay ON fb.booking_id = pay.booking_id
ORDER BY 
    fb.start_date DESC;