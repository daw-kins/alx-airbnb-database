-- Drop the existing Booking table if it exists (backup data first in production)
DROP TABLE IF EXISTS booking;

-- Create a partitioned Booking table
CREATE TABLE booking (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    INDEX idx_booking_start_date (start_date),
    INDEX idx_booking_end_date (end_date),
    INDEX idx_booking_status (status),
    INDEX idx_booking_property_id (property_id),
    INDEX idx_booking_booking_id (booking_id),
    INDEX idx_booking_user_id (user_id)
) PARTITION BY RANGE (UNIX_TIMESTAMP(start_date)) (
    PARTITION p202501 VALUES LESS THAN (UNIX_TIMESTAMP('2025-02-01')),
    PARTITION p202502 VALUES LESS THAN (UNIX_TIMESTAMP('2025-03-01')),
    PARTITION p202503 VALUES LESS THAN (UNIX_TIMESTAMP('2025-04-01')),
    PARTITION p202504 VALUES LESS THAN (UNIX_TIMESTAMP('2025-05-01')),
    PARTITION p202505 VALUES LESS THAN (UNIX_TIMESTAMP('2025-06-01')),
    PARTITION p202506 VALUES LESS THAN (UNIX_TIMESTAMP('2025-07-01')),
    PARTITION p202507 VALUES LESS THAN (UNIX_TIMESTAMP('2025-08-01')),
    PARTITION p202508 VALUES LESS THAN (UNIX_TIMESTAMP('2025-09-01')),
    PARTITION p_max VALUES LESS THAN (MAXVALUE)
);

-- Insert existing data into the partitioned table (adjust based on your data source)
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
SELECT booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
FROM old_booking; -- Replace old_booking with your existing table name or backup

-- Note: Ensure foreign key constraints are re-established after migration if needed.