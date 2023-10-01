-- Создание таблицы Books
CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    book_name VARCHAR(255) NOT NULL,
    year_of_release INT,
    genre VARCHAR(100),
    author_ID INT REFERENCES authors(author_ID),
    description TEXT
);

-- Создание таблицы Publishers
CREATE TABLE Publishers (
    publisher_id SERIAL PRIMARY KEY,
    name_of_publiser VARCHAR(255) NOT NULL,
    year_of_foundation INT,
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(255)
);

-- Создание таблицы Customers
CREATE TABLE Customers (
    buyers_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(255)
);

-- Создание таблицы Orders
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    buyers_id INT REFERENCES Customers(buyers_id),
    sum DECIMAL(10, 2),
    status VARCHAR(50)
);

-- Создание таблицы "Детали заказа" (OrderDetails)
CREATE TABLE OrderDetails (
    details_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES Orders(order_id),
    book_id INT REFERENCES Books(book_id),
    amount INT,
    price DECIMAL(10, 2)
);

-- Создание таблицы "Оценки книг" (BookRatings)
CREATE TABLE BookRatings (
    rating_id SERIAL PRIMARY KEY,
    buyers_id INT REFERENCES Customers(buyers_id),
    book_id INT REFERENCES Books(book_id),
    rating INT,
    comment TEXT
);

-- Создание таблицы "Акции и скидки" (Promotions)
CREATE TABLE Promotions (
    action_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    discount DECIMAL(5, 2),
    start_day DATE,
    end_day DATE
);
