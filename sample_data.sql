INSERT INTO Book (bookId, bookName, authorName, bookImage, bookDescription, publisherName, pubDate, rating, lang, isbn, available, shelfId) 
VALUES 
(1, "Bloom into You Vol 1", "Nakatani Nio", "bloom-into-you.jpg", "A shy high school student named Yuu sets out to explore her feelings for a classmate named Touko.", "Dengeki Comics", "2015-04-18", 4, "Japanese", 9781626923539, TRUE, 2),
(2, "Citrus Vol 1", "Saburouta", "citrus.jpg", "Step-sisters Yuzu and Mei navigate their complicated and forbidden romance while dealing with family drama and school life.", "Comic Yuri Hime", "2012-11-17", 3, "Japanese", 9784758074520, TRUE, 3),
(3, "Sweet Blue Flowers Vol 1", "Takako Shimura", "sweet-blue-flowers.jpg", "Childhood friends Fumi and Akira reunite in high school and discover new feelings for each other.", "Manga Erotics F", "2005-12-22", 5, "Japanese", 9781421592985, TRUE, 1),
(4, "Girlfriends", "Milk Morinaga", "girlfriends.jpg", "Tomboy Mari develops a close relationship with the popular and reserved Akko, exploring their growing feelings for each other.", "Manga Time Kirara", "2006-10-27", 4, "Japanese", 9782351806777, TRUE, 1),
(5, "Sweet Blue Flowers Vol 2", "Takako Shimura", "aoi-hana.jpg", "Fumi falls in love with her older, sophisticated cousin while developing feelings for her new school friend, Akira.", "Manga Erotics F", "2004-12-22", 5, "Japanese", 9781421592992, TRUE, 3),
(6, "Whispered Words", "Takashi Ikeda", "whispered-words.jpg", "The boisterous and outgoing Sumika falls in love with her quiet and reserved friend Ushio, who struggles to come to terms with her own feelings.", "Media Factory", "2007-03-23", 3, "Japanese", 9781935548454, TRUE, 2),
(7, "Kase-san and Yamada Vol 1", "Hiromi Takashima", "kase-san.jpg", "Aspiring track and field star Yamada falls for the popular, green-thumbed Kase, exploring new feelings and challenges in their relationship.", "Shinshokan", "2012-05-30", 4, "Japanese", 9781626929593, TRUE, 3),
(8, "After Hours Vol 1", "Yuhta Nishio", "after-hours.jpg", "Part-time worker Emi becomes enamored with her favorite DJ, the charismatic Kei, and starts exploring her own passions and desires.", "Morning Comics", "2015-02-21", 5, "Japanese", 9781421593807, TRUE, 1),
(9, "Pulse Vol 1", "Ratana Satis", "pulse.jpg", "Hardworking and successful Mae finds herself falling for her new assistant, the charming and free-spirited Lynn, as they work together in a hospital.", "Lezhin Comics", "2014-06-22", 4, "English", 9781638585640, TRUE, 2),
(10, "What Does the Fox Say? Vol 1", "Team Gaji", "what-does-the-fox-say.jpg", "Office worker Sumin becomes romantically involved with her boss, the cold and professional Sungji, while trying to navigate their complicated company politics.", "Lezhin Comics", "2014-07-02", 3, "English", 9791191022964, TRUE, 1),
(11, "Prism 1", "Higashiyama Shou", "prism.jpg", "High school students Megumi and Aki develop feelings for each other, but struggle with their own insecurities and the intense scrutiny of their peers.", "Comic Yuri Hime", "2012-02-18", 4, "Japanese", 9784832241404, TRUE, 3),
(12, "Hana & Hina After School Vol 1", "Morinaga Milk", "hana-and-hina.jpg", "Hana starts a part-time job at a toy store, where she meets the bubbly and outgoing Hina, with whom she develops a close relationship.", "Big Gangan", "2015-02-28", 3, "Japanese", 9781626924628, TRUE, 2),
(13, "Comic Girls", "Kaoru Hanzawa", "comic-girls.jpg", "Four female manga artists living together in a dormitory share their experiences and growth as artists, exploring their own passions and creative struggles.", "Manga Time Kirara Max", "2014-06-28", 4, "Japanese", 9784800002767, TRUE, 1),
(14, "Bloom into You Anthology", "Various", "bloom-into-you-anthology.jpg", "A collection of stories and art inspired by the original manga, exploring various relationships and experiences within the Bloom into You universe.", "Dengeki Comics", "2019-12-19", 5, "Japanese", 9784049124237, TRUE, 3),
(15, "Kiss and White Lily for My Dearest Girl", "Canno", "kiss-and-white-lily.jpg", "Private girls' school students Ayaka and Yurine develop a complex and intense relationship while navigating school life and their own personal struggles.", "Kadokawa", "2014-08-09", 4, "Japanese", 9784041211035, TRUE, 1),
(16, "Yagate Kimi ni Naru: Saeki Sayaka ni Tsuite", "Nakatani Nio", "yagate-kimi-ni-naru.jpg", "A spin-off of the original Bloom into You manga, exploring the background and experiences of side character Saeki Sayaka.", "Dengeki Comics", "2018-10-27", 5, "Japanese", 9784049120840, TRUE, 2),
(17, "Still Sick", "Akashi", "still-sick.jpg", "Popular webcomic featuring the charming and sarcastic Kairi and her relationship with the serious and reserved Yoru, exploring their growth and challenges as a couple.", "Tokuma Shoten", "2017-10-07", 4, "Japanese", 9784199507881, TRUE, 2),
(18, "Kimi no Tameni Dekiru Koto", "Tanaka Ogeretsu", "kimi-no-tameni-dekiru-koto.jpg", "Working to move on from a past heartbreak, high school student Eiji founds herself drawn to college student Subaru, with whom she slowly develops a deep and intense relationship.", "Be x Boy GOLD", "2018-06-25", 3, "Japanese", 9784049121182, TRUE, 1),
(19, "Girls' Last Tour", "Tsukumizu", "girls-last-tour.jpg", "Two young girls, Chito and Yuuri, explore a post-apocalyptic world together, discovering new places and learning about the past while facing the harsh realities of survival.", "Kadokawa", "2014-02-12", 5, "Japanese", 9784041215323, TRUE, 3),
(20, "Eclair", "Mizuki Nomura", "eclair.jpg", "Misaki decides to quit basketball and join the French cooking club, where she meets the reserved and talented Aoi, whom she quickly develops feelings for.", "Tohan", "2010-12-23", 4, "Japanese", 9784844292986, TRUE, 2);



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

INSERT INTO Notification (notifId, notifTitle, memberId, msg)
VALUES 
    (1, "Reminder", 1, 'Reminder: your book is due tomorrow.'),
    (2, "Reminder", 2, 'New books in the library!'),
    (3, "Reminder", 3, 'Library closed on Monday for holiday.');
