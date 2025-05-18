-- Create index on role in User table
CREATE INDEX idx_user_role ON user(role);

-- Create indexes on start_date, end_date, and status in Booking table
CREATE INDEX idx_booking_start_date ON booking(start_date);
CREATE INDEX idx_booking_end_date ON booking(end_date);
CREATE INDEX idx_booking_status ON booking(status);

-- Create indexes on location and pricepernight in Property table
CREATE INDEX idx_property_location ON property(location);
CREATE INDEX idx_property_pricepernight ON property(pricepernight);