## Index Performance Summary
This document summarizes the identification of high-usage columns in the User, Booking, and Property tables of the AirBnB MySQL database, the creation of appropriate indexes, and the performance impact analysis using EXPLAIN.
### High-Usage Columns

User Table: user_id (JOINs), email (WHERE, UNIQUE), role (WHERE).
Booking Table: booking_id (JOINs), property_id (JOINs, WHERE), user_id (JOINs, WHERE), start_date (WHERE, ORDER BY), end_date (WHERE), status (WHERE).
Property Table: property_id (JOINs), host_id (JOINs, WHERE), location (WHERE), pricepernight (WHERE, ORDER BY).

Indexes Created

CREATE INDEX idx_user_role ON user(role);
CREATE INDEX idx_booking_start_date ON booking(start_date);
CREATE INDEX idx_booking_end_date ON booking(end_date);
CREATE INDEX idx_booking_status ON booking(status);
CREATE INDEX idx_property_location ON property(location);
CREATE INDEX idx_property_pricepernight ON property(pricepernight);

### Performance Analysis
User Table: Filter by Role

Before: Full table scan (type: ALL, ~15 rows) due to no index on role.
After: Index idx_user_role enables ref type (~5 rows), reducing scanned rows.

Booking Table: Filter by Date Range

Before: Full table scan (type: ALL, ~15 rows) with filesort for ORDER BY.
After: Index idx_booking_start_date enables range type (~10 rows), optimizing range queries and sorting.

Property Table: Filter by Location and Price

Before: Full table scan (type: ALL, ~15 rows) with filesort for ORDER BY.
After: Index idx_property_location enables ref type (~1 row), and idx_property_pricepernight aids filtering and sorting.

# Conclusion
Adding indexes on role, start_date, end_date, status, location, and pricepernight significantly improves query performance by reducing full table scans and optimizing filtering and sorting. A composite index (e.g., location, pricepernight) could further enhance complex queries.
