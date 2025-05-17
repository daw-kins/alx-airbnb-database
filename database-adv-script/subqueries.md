Non-Correlated Subquery: Find all properties where the average rating is greater than 4.0
A non-correlated subquery executes independently of the outer query. Here, I'll use a subquery to calculate the average rating per property and then select properties where this average exceeds 4.0.

Explanation:
The subquery (SELECT r.property_id FROM review r GROUP BY r.property_id HAVING AVG(r.rating) > 4.0) calculates the average rating per property and returns property_ids where the average is greater than 4.0.
The outer query selects details from the property table for those property_ids.
This is non-correlated because the subquery does not depend on the outer query's rows.
Ordered by name for readability.

Correlated Subquery: Find users who have made more than 3 bookings
A correlated subquery depends on the outer query for its execution, evaluating for each row of the outer query. Here, I'll use a correlated subquery to count bookings per user and find users with more than 3 bookings.

Explanation:
The subquery (SELECT COUNT(*) FROM booking b WHERE b.user_id = u.user_id) counts the number of bookings for each user in the outer query.
The WHERE b.user_id = u.user_id makes this correlated, as the subquery references u.user_id from the outer query and runs for each user row.
The outer query selects users where the subquery result (booking count) is greater than 3.
Ordered by last_name for readability.