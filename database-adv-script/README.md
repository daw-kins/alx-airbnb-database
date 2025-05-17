### INNER JOIN: 
Retrieve all bookings and the respective users who made those bookings
This query joins the booking and user tables to get details of bookings along with the users who made them, matching only where a user is associated with a booking.
Explanation: The INNER JOIN ensures only bookings with matching user_id in the user table are returned. The result includes booking details and user information, ordered by start_date for readability.

### LEFT JOIN: 
Retrieve all properties and their reviews, including properties that have no reviews
This query joins the property and review tables to list all properties, with their reviews if available, and includes properties without reviews.
Explanation: The LEFT JOIN ensures all properties are included, even if they have no matching reviews (review_id, rating, etc. will be NULL for such cases). The result is ordered by name for clarity.


### FULL OUTER JOIN: 
Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
MySQL does not natively support FULL OUTER JOIN. To achieve this, we can simulate it using a combination of LEFT JOIN and RIGHT JOIN with a UNION. This query will show all users and all bookings, including users with no bookings and bookings with no associated users.

### Explanation:
The LEFT JOIN includes all users, with NULL booking details where no booking exists.
The RIGHT JOIN includes all bookings, with NULL user details where no user is linked.
UNION combines these results, removing duplicates, to simulate a FULL OUTER JOIN.
The result is ordered by user_id and start_date for organization.
Notes
These queries are tailored to the MySQL schema with CHAR(36) for UUIDs and can be tested with the seed data provided earlier.
The FULL OUTER JOIN simulation works in MySQL; if you’re using a database like PostgreSQL that supports FULL OUTER JOIN natively, you could replace the UNION approach with a single FULL OUTER JOIN clause.
