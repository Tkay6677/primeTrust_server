CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `firstname` VARCHAR(50) NOT NULL,
    `lastname` VARCHAR(50) NOT NULL,
    `address1` VARCHAR(100) NOT NULL,
    `address2` VARCHAR(100) NOT NULL,
    `country` VARCHAR(100) NOT NULL,
    `mobile1` VARCHAR(50) NOT NULL,
    `mobile2` VARCHAR(50) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `city` VARCHAR(100) NOT NULL,
    `username` VARCHAR(100) NOT NULL,    
    `password` VARCHAR(255) NOT NULL,
    `transpin` VARCHAR(100) NOT NULL,
    `filepath` VARCHAR(100) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample user data
-- INSERT INTO users (username, email, password_hash) VALUES
-- ('user1', 'user1@example.com', 'password_hash_1'),
-- ('user2', 'user2@example.com', 'password_hash_2'),
-- ('user3', 'user3@example.com', 'password_hash_3');


-- Assets table to store information about cryptocurrencies/assets
CREATE TABLE `assets` (
    `asset_id` INT AUTO_INCREMENT PRIMARY KEY,
    `symbol` VARCHAR(10) NOT NULL,  -- Symbol of the asset (e.g., BTC, ETH)
    `name` VARCHAR(100) NOT NULL,    -- Name of the asset (e.g., Bitcoin, Ethereum)
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Transactions table to record user transactions
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    asset_id INT NOT NULL,
    amount DECIMAL(18, 8) NOT NULL,  -- Amount of asset involved in the transaction
    transaction_type ENUM('buy', 'sell') NOT NULL,  -- Type of transaction
    price DECIMAL(18, 8) NOT NULL,   -- Price of the asset at the time of transaction
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders table to track user buy/sell orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    asset_id INT NOT NULL,
    order_type ENUM('buy', 'sell') NOT NULL,
    amount DECIMAL(18, 8) NOT NULL,
    price DECIMAL(18, 8) NOT NULL,
    status ENUM('pending', 'filled', 'cancelled') NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    filled_at TIMESTAMP NULL,
    cancelled_at TIMESTAMP NULL
);

-- Portfolio table to track user portfolio holdings
CREATE TABLE portfolio (
    portfolio_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    asset_id INT NOT NULL,
    amount DECIMAL(18, 8) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
