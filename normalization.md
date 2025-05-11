Normalization Steps for ERD
This document outlines the normalization process to transform the initial Entity-Relationship Diagram (ERD) into Third Normal Form (3NF). The initial ERD includes the entities User, Property, Booking, Payment, Message, and Review with their respective attributes and relationships.
Initial ERD Overview

User: user_id (PK), first_name, last_name, email, password_hash, phone_number, role, created_at.
Property: property_id (PK), host_id, name, description, location, price_per_night, created_at, updated_at.
Booking: booking_id (PK), property_id, user_id, start_date, end_date, total_price, status, created_at.
Payment: payment_id (PK), booking_id, amount, payment_date, payment_method.
Message: message_id (PK), sender_id, recipient_id, body, sent_at.
Review: review_id (PK), property_id, user_id, rating, comment, created_at.
Relationships:
User to Property (via host_id).
Property to Booking (via property_id).
Booking to Payment (via booking_id).
User to Message (via sender_id and recipient_id).
Property and User to Review (via property_id and user_id).



Step 1: First Normal Form (1NF)

Objective: Ensure all attributes are atomic and each table has a primary key.
Actions:
Verified that all entities have a single-column primary key (user_id, property_id, etc.).
Confirmed no repeating groups or multi-valued attributes (e.g., phone_number is atomic).
Ensured all attributes are scalar (e.g., description, comment are text fields without nested structures).


Result: The initial ERD satisfies 1NF.

Step 2: Second Normal Form (2NF)

Objective: Ensure 1NF is met and remove partial dependencies (non-key attributes must depend on the entire primary key).
Analysis:
Most entities have a single-column primary key, so no partial dependencies exist.
Booking: Attributes (start_date, end_date, total_price, status, created_at) depend on booking_id. However, total_price might be derived from price_per_night (from Property) and end_date - start_date. This suggests a potential functional dependency, but it’s not a partial dependency since booking_id is the full key.
Review: Attributes (rating, comment, created_at) depend on review_id. No partial dependency since property_id and user_id are foreign keys, not part of a composite key.


Actions: No changes needed as no partial dependencies were identified.
Result: The ERD satisfies 2NF.

Step 3: Third Normal Form (3NF)

Objective: Ensure 2NF is met and remove transitive dependencies (non-key attributes must not determine other non-key attributes).
Analysis:
User: No transitive dependency (e.g., email does not determine phone_number).
Property: host_id (foreign key) and other attributes depend on property_id. No transitive dependency (e.g., location does not determine price_per_night).
Booking: total_price might transitively depend on property_id (via price_per_night) and end_date - start_date. This is a potential violation.
Payment: No transitive dependency (e.g., amount does not determine payment_method).
Message: No transitive dependency (e.g., sender_id does not determine body).
Review: No transitive dependency (e.g., property_id does not determine rating).


Actions:
To address the potential transitive dependency in Booking, total_price should be calculated dynamically or stored separately if derived. For 3NF, remove total_price from Booking and compute it using a query joining Property and Booking (e.g., price_per_night * (end_date - start_date)).
Updated Booking attributes: booking_id (PK), property_id, user_id, start_date, end_date, status, created_at.


Result: After removing total_price, the ERD satisfies 3NF by eliminating transitive dependencies.

Final Normalized ERD

User: user_id (PK), first_name, last_name, email, password_hash, phone_number, role, created_at.
Property: property_id (PK), host_id, name, description, location, price_per_night, created_at, updated_at.
Booking: booking_id (PK), property_id, user_id, start_date, end_date, status, created_at.
Payment: payment_id (PK), booking_id, amount, payment_date, payment_method.
Message: message_id (PK), sender_id, recipient_id, body, sent_at.
Review: review_id (PK), property_id, user_id, rating, comment, created_at.

Conclusion
The normalization process confirmed the initial ERD was in 1NF and 2NF. To achieve 3NF, total_price was removed from Booking due to its transitive dependency on property_id and date fields. The final structure ensures all non-key attributes depend directly on their primary keys, meeting 3NF requirements.
