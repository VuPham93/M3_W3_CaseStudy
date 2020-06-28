create database game;

use game;

CREATE TABLE gamelist (

    id                 int           NOT NULL AUTO_INCREMENT,
    name               varchar(200)  NOT NULL,
    category           varchar(200)  NOT NULL,
    detail             varchar(1000) NOT NULL,
    systemRequirements varchar(1000) NOT NULL,
    price              double       DEFAULT NULL,
    discount           double       DEFAULT NULL,
    status             varchar(30)  DEFAULT NULL,
    downloadLink       varchar(200) DEFAULT NULL,
    smallImgPath       varchar(200) DEFAULT NULL,
    bigImg1Path        varchar(200) DEFAULT NULL,
    bigImg2Path        varchar(200) DEFAULT NULL,
    bigImg3Path        varchar(200) DEFAULT NULL,
    videoPath          varchar(200) DEFAULT NULL,
    PRIMARY KEY (id)
);

INSERT INTO gamelist (name, category, detail, systemRequirements, price, discount, status, downloadLink, smallImgPath, bigImg1Path, bigImg2Path, bigImg3Path, videoPath)
VALUES
    ('The Witcher 3: Wild Hunt',
    'Fantasy',
    'As war rages on throughout the Northern Realms, you take on the greatest contract of your life — tracking down the Child of Prophecy, a living weapon that can alter the shape of the world.',
    'Window 10 i5 gtx 960',
    40,
    25,
    'Top seller',
    'https://www.skidrowcodex.net/the-witcher-3-wild-hunt-game-of-the-year-edition-gog/',
    'view/component/img/game/witcher3/min.jpeg',
    'view/component/img/game/witcher3/1.jpg',
    'view/component/img/game/witcher3/2.png',
    'view/component/img/game/witcher3/3.png',
    'c0i88t0Kacs');

INSERT INTO gamelist (name, category, detail, systemRequirements, price, discount, status, downloadLink, smallImgPath, bigImg1Path, bigImg2Path, bigImg3Path, videoPath)
VALUES
    ('Red Dead Redemption 2',
    'Action',
    'Winner of over 175 Game of the Year Awards and recipient of over 250 perfect scores, RDR2 is the epic tale of outlaw Arthur Morgan and the infamous Van der Linde gang, on the run across America at the dawn of the modern age. Also includes access to the shared living world of Red Dead Online.',
    'Window 10 i5 gtx 1060',
    80,
    5,
    'Top seller',
    'https://www.skidrowcodex.net',
    'view/component/img/game/rdr2/min.jpg',
    'view/component/img/game/rdr2/1.jpg',
    'view/component/img/game/rdr2/2.jpg',
    'view/component/img/game/rdr2/3.jpg',
    'eaW0tYpxyp0');

INSERT INTO gamelist (name, category, detail, systemRequirements, price, discount, status, downloadLink, smallImgPath, bigImg1Path, bigImg2Path, bigImg3Path, videoPath)
VALUES
    ('Grand Theft Auto V',
    'Action',
    'Grand Theft Auto V for PC offers players the option to explore the award-winning world of Los Santos and Blaine County in resolutions of up to 4k and beyond, as well as the chance to experience the game running at 60 frames per second.',
    'Window 10 i5 gtx 1060',
    30,
    35,
    'Top seller',
    'https://www.skidrowcodex.net',
    'view/component/img/game/gtav/min.jpeg',
    'view/component/img/game/gtav/1.jpg',
    'view/component/img/game/gtav/2.jpg',
    'view/component/img/game/gtav/3.jpg',
    'QkkoHAzjnUs');

INSERT INTO gamelist (name, category, detail, systemRequirements, price, discount, status, downloadLink, smallImgPath, bigImg1Path, bigImg2Path, bigImg3Path, videoPath)
VALUES
    ('Death Stranding',
    'Adventure',
    'From legendary game creator Hideo Kojima comes an all-new, genre-defying experience. Sam Bridges must brave a world utterly transformed by the Death Stranding. Carrying the disconnected remnants of our future in his hands, he embarks on a journey to reconnect the shattered world',
    'Window',
    41.99,
    0,
    'Coming Soon',
    'https://www.epicgames.com/store/en-US/product/death-stranding/home',
    'view/component/img/game/deathStranding/min.jpg',
    'view/component/img/game/deathStranding/1.jpg',
    'view/component/img/game/deathStranding/2.jpg',
    'view/component/img/game/deathStranding/3.jpg',
    'tCI396HyhbQ');

INSERT INTO gamelist (name, category, detail, systemRequirements, price, discount, status, downloadLink, smallImgPath, bigImg1Path, bigImg2Path, bigImg3Path, videoPath)
VALUES
    ('Resident Evil 3',
    'Horror',
    'Jill Valentine is one of the last remaining people in Raccoon City to witness the atrocities Umbrella performed. To stop her, Umbrella unleashes their ultimate secret weapon: Nemesis! Also includes Resident Evil Resistance, a new 1 vs 4 online multiplayer game set in the Resident Evil universe.'
    ,'Intel Core i7-3770 or AMD FX-9590 or better',
    26,
    34,
    'New Releases',
    'https://store.steampowered.com/app/952060/Resident_Evil_3/',
    'view/component/img/game/re3/min.jpg',
    'view/component/img/game/re3/1.jpg',
    'view/component/img/game/re3/2.jpg',
    'view/component/img/game/re3/3.jpg',
    '9LrLM4Hvr9U');

CREATE TABLE userlist (
    id                 int           NOT NULL AUTO_INCREMENT,
    name               varchar(200)  NOT NULL,
    email              varchar(200)  NOT NULL,
    password           varchar(1000) NOT NULL,
    balance            double        DEFAULT NULL,
    role               varchar(20)  NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO userlist (name, email, password, balance, role)
VALUE ('vu', 'vu@gmail.com', '123', 1000000, 'admin');

INSERT INTO userlist (name, email, password, balance, role)
    VALUE ('Hung', 'hung@gmail.com', '123', 1000000, 'user');

INSERT INTO userlist (name, email, password, balance, role)
    VALUE ('Phu', 'phu@gmail.com', '123', 1000000, 'user');
