-- Insert sample data into User table
INSERT INTO user (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('11111111-2222-3333-4444-555555555555', 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_pwd1', '123-456-7890', 'host', '2025-01-01 10:00:00'),
('22222222-3333-4444-5555-666666666666', 'Bob', 'Jones', 'bob.jones@example.com', 'hashed_pwd2', '234-567-8901', 'guest', '2025-01-02 12:00:00'),
('33333333-4444-5555-6666-777777777777', 'Charlie', 'Brown', 'charlie.brown@example.com', 'hashed_pwd3', '345-678-9012', 'host', '2025-01-03 14:00:00');

-- Insert sample data into Property table
INSERT INTO property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
('44444444-5555-6666-7777-888888888888', '11111111-2222-3333-4444-555555555555', 'Cozy Cabin', 'A cozy cabin in the woods', 'Woodland, CA', 100.00, '2025-02-01 09:00:00', NULL),
('55555555-6666-7777-8888-999999999999', '11111111-2222-3333-4444-555555555555', 'Beach House', 'A lovely beach house with ocean views', 'Santa Monica, CA', 200.00, '2025-02-02 11:00:00', NULL),
('66666666-7777-8888-9999-000000000000', '33333333-4444-5555-6666-777777777777', 'City Apartment', 'Modern apartment in downtown', 'San Francisco, CA', 150.00, '2025-02-03 13:00:00', NULL);

-- Insert sample data into Booking table
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, status, created_at) VALUES
('77777777-8888-9999-0000-111111111111', '44444444-5555-6666-7777-888888888888', '22222222-3333-4444-5555-666666666666', '2025-05-01', '2025-05-05', 'confirmed', '2025-04-01 15:00:00'),
('88888888-9999-0000-1111-222222222222', '55555555-6666-7777-8888-999999999999', '22222222-3333-4444-5555-666666666666', '2025-06-01', '2025-06-03', 'pending', '2025-04-02 16:00:00'),
('99999999-0000-1111-2222-333333333333', '66666666-7777-8888-9999-000000000000', '22222222-3333-4444-5555-666666666666', '2025-07-01', '2025-07-04', 'confirmed', '2025-04-03 17:00:00');

-- Insert sample data into Payment table
INSERT INTO payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('aaaaaaa1-bbbb-cccc-dddd-eeeeeeeeeeee', '77777777-8888-9999-0000-111111111111', 400.00, '2025-04-01', 'credit_card'),
('bbbbbbb2-cccc-dddd-eeee-ffffffffffff', '77777777-8888-9999-0000-111111111111', 100.00, '2025-04-02', 'paypal'),
('ccccccc3-dddd-eeee-ffff-gggggggggggg', '99999999-0000-1111-2222-333333333333', 450.00, '2025-04-03', 'credit_card');

-- Insert sample data into Message table
INSERT INTO message (message_id, sender_id, recipient_id, body, sent_at) VALUES
('ddddddd4-eeee-ffff-gggg-hhhhhhhhhhhh', '22222222-3333-4444-5555-666666666666', '11111111-2222-3333-4444-555555555555', 'Is the cabin available for May?', '2025-03-01 10:00:00'),
('eeeeeee5-ffff-gggg-hhhh-iiiiiiiiiiii', '11111111-2222-3333-4444-555555555555', '22222222-3333-4444-5555-666666666666', 'Yes, it’s available!', '2025-03-02 11:00:00'),
('fffffff6-gggg-hhhh-iiii-jjjjjjjjjjjj', '22222222-3333-4444-5555-666666666666', '33333333-4444-5555-6666-777777777777', 'How’s the apartment location?', '2025-03-03 12:00:00');

-- Insert sample data into Review table
INSERT INTO review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('ggggggg7-hhhh-iiii-jjjj-kkkkkkkkkkkk', '44444444-5555-6666-7777-888888888888', '22222222-3333-4444-5555-666666666666', 5, 'Amazing stay, very cozy!', '2025-05-06 09:00:00'),
('hhhhhhh8-iiii-jjjj-kkkk-llllllllllll', '66666666-7777-8888-9999-000000000000', '22222222-3333-4444-5555-666666666666', 4, 'Great location, but noisy at night.', '2025-07-05 10:00:00');