create table Book (
    bookId INT NOT NULL
        CHECK (bookId > 0),
    bookName VARCHAR(50) NOT NULL,
    authorName VARCHAR(50) NOT NULL,
    bookImage VARCHAR(100),
    bookDescription VARCHAR(1000),
    publisherName VARCHAR(50) NOT NULL,
    pubDate DATE NOT NULL,
    rating INT
        CHECK (rating BETWEEN 1 AND 5),
    lang VARCHAR(10) NOT NULL,
    isbn INT NOT NULL,
    available BIT NOT NULL,
    shelfid INT NOT NULL,

    PRIMARY KEY (bookId)
)

create table Member (
    memberId INT NOT NULL,
    memberName VARCHAR(50) NOT NULL,
    memberNo INT NOT NULL,
    memberEmail VARCHAR (30) NOT NULL
        CHECK (memberEmail LIKE '%_@__%.__%'),\
    memberPasswd VARCHAR (50) NOT NULL,
    newsletter BIT NOT NULL,
    librarian BIT NOT NULL,

    PRIMARY KEY (memberId)
)

create table Genre (
    bookId INT NOT NULL,
    genre VARCHAR(10) NOT NULL, 

    PRIMARY KEY (bookId,genre)
)

create table Borrowed (
    borrowId INT NOT NULL,
    bookId INT NOT NULL,
    memberId INT NOT NULL,
    dateBorrowed DATE NOT NULL,
    expectDate DATE NOT NULL,
    returnDate DATE,

    PRIMARY KEY (borrowId),
    FOREIGN KEY (bookId) REFERENCES Book (BookId),
    FOREIGN KEY (memberId) REFERENCES Member (memberId)
)

create table Ratings (
    bookId INT NOT NULL,
    memberId INT NOT NULL,
    comment VARCHAR(150),
    rating INT NOT NULL
        CHECK (rating BETWEEN 1 AND 5),

    PRIMARY KEY (bookId,memberId),
    FOREIGN KEY (bookId) REFERENCES Book (BookId),
    FOREIGN KEY (memberId) REFERENCES Member (memberId)
)

create table Notification (
    notifId INT NOT NULL,
    memberId INT NOT NULL,
    msg VARCHAR(100),

    PRIMARY KEY (notifId),
    FOREIGN KEY (memberId) REFERENCES Member (memberId)
)