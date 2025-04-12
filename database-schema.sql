create database db_batch6_rels;

use db_batch6_rels;


-- Table: agents
CREATE TABLE agents (
    agent_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    agency VARCHAR(100)
);

-- Table: listings
CREATE TABLE listings (
    listing_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(12, 2) NOT NULL,
    property_type VARCHAR(50),
    listing_type VARCHAR(10) CHECK (listing_type IN ('Sale', 'Rent')),
    bedrooms INT DEFAULT 0,
    bathrooms INT DEFAULT 0,
    area_sqft INT,
    location VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(20),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    listing_date DATE DEFAULT CURRENT_DATE,
    is_active BOOLEAN DEFAULT TRUE,
    agent_id INT,
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
        ON DELETE SET NULL
);

-- Table: listing_photos
CREATE TABLE listing_photos (
    photo_id INT PRIMARY KEY AUTO_INCREMENT,
    listing_id INT,
    photo_url VARCHAR(255) NOT NULL,
    is_main BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id)
        ON DELETE CASCADE
);
