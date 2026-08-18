USE aeromuse;

CREATE TABLE systems (
    id INT AUTO_INCREMENT PRIMARY KEY,
    system_name VARCHAR(100) NOT NULL,
    description TEXT,
    ip_address VARCHAR(45),
    port INT,
    protocol VARCHAR(20),
    status ENUM('ONLINE','OFFLINE','WARNING') DEFAULT 'ONLINE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255),
    role ENUM('ADMIN','ENGINEER','OPERATOR'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    source_system VARCHAR(100),
    destination_system VARCHAR(100),
    message_type VARCHAR(50),
    payload JSON,
    status ENUM('QUEUED','PROCESSING','DELIVERED','FAILED') DEFAULT 'QUEUED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    log_level ENUM('INFO','WARNING','ERROR'),
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO systems
(system_name, description, ip_address, port, protocol, status)
VALUES
('AODB', 'Airport Database', '192.168.1.10', 8080, 'TCP', 'ONLINE'),
('FIDS', 'Flight Information Display System', '192.168.1.20', 8081, 'ONLINE'),
('BHS', 'Baggage Handling System', '192.168.1.30', 8082, 'OFFLINE'),
('CUSS', 'Common Use Self Service', '192.168.1.40', 8083, 'WARNING');

ALTER TABLE systems
ADD COLUMN system_type VARCHAR(100) AFTER system_name;