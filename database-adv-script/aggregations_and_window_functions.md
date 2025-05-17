## Query to Find the Total Number of Bookings Made by Each User
This query uses the COUNT aggregation function and GROUP BY clause to calculate the total number of bookings per user, retrieving user details along with their booking count.

### Explanation:
LEFT JOIN ensures all users are included, even those with no bookings (where total_bookings will be 0).
COUNT(b.booking_id) counts the number of bookings per user.
GROUP BY aggregates the data by user details to avoid ambiguity.
ORDER BY total_bookings DESC sorts users by the number of bookings in descending order for clarity.
This provides a comprehensive view of user booking activity.

## Query to Rank Properties Based on the Total Number of Bookings Using a Window Function
This query uses a window function (RANK) to rank properties based on the total number of bookings they have received, including ties where properties have the same number of bookings.

### Explanation:
LEFT JOIN includes all properties, even those with no bookings (where total_bookings will be 0).
COUNT(b.booking_id) calculates the total number of bookings per property.
GROUP BY aggregates the data by property details.
RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) assigns a rank to each property based on the number of bookings, with ties receiving the same rank (e.g., if two properties have 5 bookings, both get rank 1, and the next rank is 3).
ORDER BY ranking ASC sorts the results by rank for readability.
This provides a ranked list of properties by popularity based on bookings.
