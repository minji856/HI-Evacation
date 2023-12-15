CREATE TABLE IF NOT EXISTS vac_request (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    vacation_type VARCHAR(20) NOT NULL,
    start_day DATE NOT NULL,
    end_day DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    current_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reason TEXT NOT NULL
); 