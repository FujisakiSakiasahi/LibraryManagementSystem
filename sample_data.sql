INSERT INTO Book (bookId, bookName, authorName, bookImage, bookDescription, publisherName, pubDate, rating, lang, isbn, available, shelfid)
VALUES 
(1, 'Bloom into You Vol. 1', 'Nio Nakatani', 'https://images-na.ssl-images-amazon.com/images/I/91OoCCkH0jL.jpg', 'Yuu has always adored shoujo manga and yearns for the day when someone might give her a love confession that would send her heart aflutter. Yet when a junior high school classmate confesses his feelings to her--she feels nothing. Disappointed and confused, Yuu enters high school, where she sees the confident and beautiful student council member Nanami. When the next person to confess to Yuu is Nanami herself. Has her romantic dream finally started to blossom?', 'Seven Seas', '2018-04-10', 4, 'English', 1626923718, true, 3),
(2, 'Whisper me a Love Song Vol. 1', 'Eku Takeshima', 'https://images-na.ssl-images-amazon.com/images/I/81uV7D9Kj4S.jpg', 'A high schooler Tsukiko Yahara has a crush on her coworker, a reserved adult woman who also happens to be the store manager. Tsukiko still doesn''t know how to confess to her crush and she''s unsure what to do when the store manager starts to show an interest in her, too. Little does she know that the manager has a secret of her own...', 'MANGA Plus by SHUEISHA', '2019-09-06', 5, 'English', 1974708026, true, 1),
(3, 'Love Me for Who I Am Vol. 1', 'Kata Konayama', 'https://images-na.ssl-images-amazon.com/images/I/81maRxSwN1L.jpg', 'Mogumo is a cute but lonely high school student who just wants a few loving friends. Fellow student Iwaoka Tetsu invites Mogumo to work at his family''s café for “cross-dressing day,” but he makes an incorrect assumption: Mogumo is nonbinary and doesn’t identify as a boy or a girl. When Mogumo happily agrees to the plan, Tetsu doesn’t realize his mistake, and it’s not long before the rest of the students at their school are in on the secret too. Mogumo wants to help others understand her, but that’s easier said than done!', 'Seven Seas', '2020-06-30', 3, 'English', 1645052853, true, 2);

INSERT INTO Member (memberId, memberName, memberNo, memberEmail, memberPasswd, newsletter, librarian)
VALUES 
    (1, 'John Smith', 12345, 'john.smith@example.com', 'password123', 1, 0),
    (2, 'Jane Doe', 67890, 'jane.doe@example.com', 'qwerty456', 0, 0),
    (3, 'Mike Johnson', 24680, 'mike.johnson@example.com', 'password789', 1, 1);

INSERT INTO Genre (bookId, genre)
VALUES 
    (1, 'Romance'),
    (1, 'Drama'),
    (2, 'Romance'),
    (2, 'Comedy'),
    (3, 'Drama'),
    (3, 'Slice of life');

INSERT INTO Borrowed (borrowId, bookId, memberId, dateBorrowed, expectDate, returnDate)
VALUES 
    (1, 1, 1, '2022-01-01', '2022-01-08', '2022-01-07'),
    (2, 2, 1, '2022-02-01', '2022-02-08', NULL),
    (3, 3, 2, '2022-03-01', '2022-03-08', NULL),
    (4, 1, 3, '2022-04-01', '2022-04-08', NULL);

INSERT INTO Ratings (bookId, memberId, comment, rating)
VALUES 
    (1, 1, 'Great book, loved the characters!', 5),
    (1, 2, 'The ending left me wanting more.', 4),
    (2, 1, 'So funny and heartwarming!', 5),
    (2, 3, 'Not my favorite genre, but enjoyable.', 3),
    (3, 2, 'The art style is beautiful.', 4),
    (3, 3, 'A bit slow-paced, but interesting.', 3);

INSERT INTO Notification (notifId, memberId, msg)
VALUES 
    (1, 1, 'Reminder: your book is due tomorrow.'),
    (2, 2, 'New books in the library!'),
    (3, 3, 'Library closed on Monday for holiday.');
