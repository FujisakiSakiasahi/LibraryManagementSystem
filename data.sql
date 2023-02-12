create table Book (
    bookId INT NOT NULL
        CHECK (bookId > 0),
    bookName VARCHAR(50) NOT NULL,
    authorName VARCHAR(50) NOT NULL,
    bookDescription VARCHAR(150),
    publisherName VARCHAR(50),
    rating INT
        CHECK (rating BETWEEN 1 AND 5),
    pubDate DATE NOT NULL,
    lan VARCHAR(10) NOT NULL,
    isbn INT(13)

    PRIMARY KEY (bookId)
)

create table Borrowed (
    bookId INT NOT NULL,
    studentId INT NOT NULL,
    dateBorrowed DATE NOT NULL,

    PRIMARY KEY (bookId,studentId),
    FOREIGN KEY (bookId) REFERENCES Book (BookId)
)

create table Ratings (
    bookId INT NOT NULL,
    studentId INT NOT NULL,
    rating INT NOT NULL
        CHECK (rating BETWEEN 1 AND 5),

    PRIMARY KEY (bookId,studentId)
    FOREIGN KEY (bookId) REFERENCES Book (BookId)
)