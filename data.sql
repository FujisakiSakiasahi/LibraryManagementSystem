create table Book (
    bookId INT NOT NULL AUTO_INCREMENT,
    bookName VARCHAR(50) NOT NULL,
    authorName VARCHAR(50) NOT NULL,
    bookImage VARCHAR(100),
    bookDescription VARCHAR(1000),
    publisherName VARCHAR(50) NOT NULL,
    pubDate DATE NOT NULL,
    lang VARCHAR(10) NOT NULL,
    isbn BIGINT NOT NULL,
    available BIT NOT NULL,
    shelfid INT NOT NULL,

    PRIMARY KEY (bookId)
);

create table Member (
    memberId INT NOT NULL AUTO_INCREMENT,
    memberName VARCHAR(50) NOT NULL,
    memberNo INT NOT NULL,
    memberEmail VARCHAR (30) NOT NULL,
    memberPasswd VARCHAR (50) NOT NULL,
    newsletter BIT NOT NULL,
    librarian BIT NOT NULL,

    PRIMARY KEY (memberId)
);

create table Genre (
    bookId INT NOT NULL,
    genre VARCHAR(15) NOT NULL, 

    PRIMARY KEY (bookId,genre)
);

create table Borrowed (
    borrowId INT NOT NULL AUTO_INCREMENT,
    bookId INT NOT NULL,
    memberId INT NOT NULL,
    dateBorrowed DATE NOT NULL,
    expectDate DATE NOT NULL,
    returnDate DATE,

    PRIMARY KEY (borrowId),
    FOREIGN KEY (bookId) REFERENCES Book (bookId),
    FOREIGN KEY (memberId) REFERENCES Member (memberId)
);

create table Ratings (
    bookId INT NOT NULL,
    memberId INT NOT NULL,
    comment VARCHAR(150),
    rating INT NOT NULL,

    PRIMARY KEY (bookId,memberId),
    FOREIGN KEY (bookId) REFERENCES Book (bookId),
    FOREIGN KEY (memberId) REFERENCES Member (memberId)
);

create table Notification (
    notifId INT NOT NULL AUTO_INCREMENT,
    notifTitle VARCHAR(500) NOT NULL,
    memberId INT NOT NULL,
    msg VARCHAR(1024),

    PRIMARY KEY (notifId),
    FOREIGN KEY (memberId) REFERENCES Member (memberId)
);

create table Reserved (
    bookId INT NOT NULL,
    memberId INT NOT NULL,
    reservedUntil DATE NOT NULL,

    PRIMARY KEY (bookId, memberId),
    FOREIGN KEY (bookId) REFERENCES Book (bookId),
    FOREIGN KEY (memberId) REFERENCES Member (memberId)
);

create table Wishlist (
    bookId INT NOT NULL,
    memberId INT NOT NULL,

    PRIMARY KEY (bookId, memberId),
    FOREIGN KEY (bookId) REFERENCES Book (bookId),
    FOREIGN KEY (memberId) REFERENCES Member (memberId)
);

create table Requests(
    requestId INT NOT NULL AUTO_INCREMENT,
    bookName VARCHAR(50) NOT NULL,
    isbn BIGINT,
    
    PRIMARY KEY (requestId)
);

DELIMITER $$

CREATE 
    PROCEDURE Send_Notification()
    BEGIN
        -- declaring cursor for iterations
        DECLARE v_memberId INT;
        DECLARE v_bookName VARCHAR(50);
        DECLARE v_remain INT;
        DECLARE v_done INT DEFAULT 0;

        DECLARE overdue_cursor CURSOR FOR SELECT Borrowed.memberId, Book.bookName, (expectDate - CURRENT_DATE) AS remaining FROM Borrowed INNER JOIN Book USING (bookId) WHERE (expectDate - CURRENT_DATE) <= 3 AND returnDate IS NULL;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done=1;

        OPEN overdue_cursor;
        FETCH overdue_cursor INTO v_memberId, v_bookName, v_remain;
        LP:LOOP
            FETCH overdue_cursor INTO v_memberId, v_bookName, v_remain;
            IF v_done = 1 THEN
                LEAVE LP;
            END IF;

            IF v_remain > 0 THEN
                INSERT INTO Notification (notifTitle, memberId, msg) VALUES ('Book Expiry Warning', v_memberId, CONCAT('The book ', v_bookName, ' has to be returned in ', v_remain, ' day(s).'));
            ELSE 
                INSERT INTO Notification (notifTitle, memberId, msg) VALUES ('Book Overdue Warning', v_memberId, CONCAT('The book ', v_bookName, ' has been overdue for ', ABS(v_remain), ' day(s). Please return the book to the library ASAP.'));
            END IF;
        END LOOP LP;
        CLOSE overdue_cursor;
    END;$$

CREATE 
    EVENT Send_Notification
    ON SCHEDULE EVERY 1 DAY STARTS CONCAT(DATE(DATE_ADD(NOW(), INTERVAL 1 DAY)), ' 00:00:00')
    DO BEGIN
        CALL Send_Notification();
    END;$$

DELIMITER ;
