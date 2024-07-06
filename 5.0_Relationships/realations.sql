--Teach Foreign Key
-- user_id INT REFERENCES users(user_id),
-- user_id INT FOREIGN KEY REFERENCES Users(user_id)
-- FOREIGN KEY (user_id) REFERENCES users(user_id)

-- In a one-to-one relationship, each record in Table A can have at most one matching record in Table B, and vice versa.---

-- One-to-One Relationship
-- Example: User Profile and Address

-- In a one-to-one relationship, each record in Table A can have at most one matching record in Table B, and vice versa

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE addresses (
    address_id INT PRIMARY KEY,
    user_id INT UNIQUE,
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- In this example:

-- Each user (in the users table) can have at most one address (in the addresses table).
-- The user_id in the addresses table is a foreign key referencing the user_id in the users table, establishing the one-to-one relationship.

-- One-to-Many Relationship
-- Example: User Profile and Posts

-- In a one-to-many relationship, each record in Table A can have many matching records in Table B, but each record in Table B can have at most one matching record in Table A.

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    user_id INT,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- In this example:

-- Each user (in the users table) can have multiple posts (in the posts table).
-- The user_id in the posts table is a foreign key referencing the user_id in the users table, establishing the one-to-many relationship.

-- Many-to-Many Relationship
-- Example: Users and Interests

--In a many-to-many relationship, each record in Table A can have many matching records in Table B, and vice versa.

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE interests (
    interest_id INT PRIMARY KEY,
    interest_name VARCHAR(50) NOT NULL
);

CREATE TABLE user_interests (
    user_id INT,
    interest_id INT,
    PRIMARY KEY (user_id, interest_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (interest_id) REFERENCES interests(interest_id)
);

-- In this example:

-- Each user (in the users table) can have multiple interests (in the interests table), and each interest can be associated with multiple users.
-- The user_interests table serves as a junction table that connects users and interests, with foreign keys referencing their respective tables, establishing the many-to-many relationship.


-- Inputs

--User Input
INSERT INTO users  VALUES (1,'john_doe', 'john.doe@example.com');
INSERT INTO users  VALUES (2,'jane_smith', 'jane.smith@company.org');
INSERT INTO users  VALUES (3,'awesome_coder123', 'coder123@programming.com');
INSERT INTO users  VALUES (4,'book_lover', 'books@mylibrary.net');
INSERT INTO users  VALUES (5,'traveling_enthusiast', 'traveler@explore.world');

--Adresses Input
INSERT INTO addresses 
VALUES (1,1, '123 Main Street', 'Anytown', 'CA');  -- User with ID 1

INSERT INTO addresses 
VALUES (2,2, '456 Elm Street', 'Springfield', 'NY');  -- User with ID 2

INSERT INTO addresses 
VALUES (3,3, '789 Maple Avenue', 'Metropolis', 'IL');  -- User with ID 3

-- Assuming user with ID 4 doesn't exist yet (avoiding foreign key constraint violation)
INSERT INTO addresses 
VALUES (4,4, '10 Windy Lane', 'Sunnyville', 'FL');  -- User with ID 5

INSERT INTO addresses 
VALUES (5,5, 'Apt. B, 456 Evergreen Drive', 'Anytown', 'CA');  -- User with ID 1 (duplicate user_id allowed)

--POSTS

INSERT INTO posts (user_id, title, content)
VALUES (1, 'Welcome to My Blog!', 'This is my first blog post. I am excited to share my thoughts and experiences with you.');

INSERT INTO posts (user_id, title, content) 
VALUES (2, 'Tips for Learning a New Language', 'Here are some strategies that helped me learn a new language effectively.');

INSERT INTO posts (user_id, title, content)
VALUES (3, 'The Power of Positive Thinking', 'A positive attitude can make a big difference in your life.');


INSERT INTO posts (user_id, title, content)
VALUES (4, 'My Favorite Travel Destinations', 'Sharing some of the most amazing places I have visited.');

INSERT INTO posts (user_id, title, content)
VALUES (5, 'Review: iKAGAI', 'A quick review of a book I recently finished reading.');  

--Intrest Table

INSERT INTO interests (interest_id,interest_name)
VALUES (1,'Programming');
INSERT INTO interests (interest_id,interest_name)
VALUES (2,'Reading');
INSERT INTO interests (interest_id,interest_name)
VALUES (3,'Traveling');
INSERT INTO interests (interest_id,interest_name)
VALUES (4,'Cooking');
INSERT INTO interests (interest_id,interest_name)
VALUES (5,'Music');

