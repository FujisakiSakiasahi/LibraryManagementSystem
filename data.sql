create table Book (
    bookId INT NOT NULL
        CHECK (bookId > 0),
    bookName VARCHAR(50) NOT NULL,
    authorName VARCHAR(50) NOT NULL,
    bookDescription VARCHAR(150),
    publisherName VARCHAR(50) NOT NULL,
    publishYear INT NOT NULL,
    rating INT
        CHECK (rating BETWEEN 1 AND 5),
    pubDate DATE NOT NULL,
    lan VARCHAR(10) NOT NULL,
    isbn INT(13),

    PRIMARY KEY (bookId)
)

create table Member (
    memberId INT NOT NULL,
    memberName VARCHAR(50) NOT NULL,
    memberNo INT NOT NULL,
    memberEmail VARCHAR (30) NOT NULL
        CHECK (memberEmail LIKE '%_@__%.__%'),
    newsletter BOOLEAN NOT NULL,

    PRIMARY KEY (memberId)
)

create table Genre (
    bookId INT NOT NULL,
    genre VARCHAR(10) NOT NULL, 

    PRIMARY KEY (bookId,genre)
)

create table Borrowed (
    bookId INT NOT NULL,
    memberId INT NOT NULL,
    dateBorrowed DATE NOT NULL,
    returned BOOLEAN NOT NULL,

    PRIMARY KEY (bookId,memberId),
    FOREIGN KEY (bookId) REFERENCES Book (BookId),
    FOREIGN KEY (memberId) REFERENCES Member (memberId)
)

create table Ratings (
    bookId INT NOT NULL,
    memberId INT NOT NULL,
    rating INT NOT NULL
        CHECK (rating BETWEEN 1 AND 5),

    PRIMARY KEY (bookId,memberId),
    FOREIGN KEY (bookId) REFERENCES Book (BookId),
    FOREIGN KEY (memberId) REFERENCS Member (memberId)
)