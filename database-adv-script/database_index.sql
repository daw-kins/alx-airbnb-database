-- Create indexes for performance optimization

-- Index on role in User table
CREATE INDEX idx_user_role ON user(role);

-- Indexes on start_date, end_date, and status in Booking table
CREATE INDEX idx_booking_start_date ON booking(start_date);
CREATE INDEX idx_booking_end_date ON booking(end_date);
CREATE INDEX idx_booking_status ON booking(status);

-- Indexes on location and pricepernight in Property table
CREATE INDEX idx_property_location ON property(location);
CREATE INDEX idx_property_pricepernight ON property(pricepernight);

-- Performance Measurement with EXPLAIN ANALYZE (MySQL 8.0.18+)
-- Note: Run these queries before and after creating indexes to compare performance.
-- Comment out CREATE INDEX commands and re-run for "before" measurements.

-- 1. User Table: Filter by role
-- Before (assume no idx_user_role)
EXPLAIN ANALYZE SELECT * FROM user WHERE role = 'host';
-- After (with idx_user_role)
EXPLAIN ANALYZE SELECT * FROM user WHERE role = 'host';

-- 2. Booking Table: Filter by date range
-- Before (assume no idx_booking_start_date)
EXPLAIN ANALYZE SELECT * FROM booking WHERE start_date >= '2025-05-01' ORDER BY start_date;
-- After (with idx_booking_start_date)
EXPLAIN ANALYZE SELECT * FROM booking WHERE start_date >= '2025-05-01' ORDER BY start_date;

-- 3. Property Table: Filter by location and price
-- Before (assume no idx_property_location or idx_property_pricepernight)
EXPLAIN ANALYZE SELECT * FROM property WHERE location = 'San Francisco, CA' AND pricepernight < 200.00 ORDER BY pricepernight;
-- After (with idx_property_location and idx_property_pricepernight)
EXPLAIN ANALYZE SELECT * FROM property WHERE location = 'San Francisco, CA' AND pricepernight < 200.00 ORDER BY pricepernight;