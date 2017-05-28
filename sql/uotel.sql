DROP DATABASE IF EXISTS Uotel;
CREATE DATABASE Uotel;
USE Uotel;
SELECT DATABASE();
CREATE TABLE IF NOT EXISTS TH (
    uid             integer,
    name            varchar(25),
    address         varchar(50),
    url             varchar(50),
    phone_number    varchar(25),
    year_built      integer,
    price           integer,
    PRIMARY KEY     (uid)
);

CREATE TABLE IF NOT EXISTS user (
    name            varchar(25),
    login_name      varchar(25),
    passwd          varchar(25),
    address         varchar(50),
    phone_number    varchar(25),
    PRIMARY KEY     (login_name)
);

CREATE TABLE IF NOT EXISTS period (
    start_date      timestamp,
    end_date        timestamp,
    PRIMARY KEY     (start_date, end_date)
);

CREATE TABLE IF NOT EXISTS available (
    uid             integer NOT NULL,
    start_date      timestamp NOT NULL,
    end_date        timestamp NOT NULL,
    PRIMARY KEY     (uid, start_date, end_date),
    FOREIGN KEY     (uid)                   REFERENCES TH (uid),
    FOREIGN KEY     (start_date, end_date)  REFERENCES period(start_date, end_date)
);


CREATE TABLE IF NOT EXISTS keyword (
    str             varchar(25),
    PRIMARY KEY     (str)
);

CREATE TABLE IF NOT EXISTS category (
	str             varchar(25),
	PRIMARY KEY     (str)
);

CREATE TABLE IF NOT EXISTS TH_keyword_pair (
    uid             integer NOT NULL,
    str             varchar(25) NOT NULL,
    PRIMARY KEY     (uid, str),
    FOREIGN KEY     (uid)   REFERENCES TH (uid),
    FOREIGN KEY     (str)   REFERENCES keyword (str)
);

CREATE TABLE IF NOT EXISTS TH_category_pair (
    uid             integer NOT NULL,
    str             varchar(25) NOT NULL,
    PRIMARY KEY     (uid, str),
    FOREIGN KEY     (uid)   REFERENCES TH (uid),
    FOREIGN KEY     (str)   REFERENCES keyword (str)
);

CREATE TABLE IF NOT EXISTS reserve(
    rid             INTEGER,
    uid             INTEGER NOT NULL,
    user_name       VARCHAR(25) NOT NULL,
    start_date      TIMESTAMP,
    end_date        TIMESTAMP,
    PRIMARY KEY     (rid),
    FOREIGN KEY     (uid)       REFERENCES TH(uid),
    FOREIGN KEY     (user_name) REFERENCES user(login_name)
);

CREATE TABLE IF NOT EXISTS favorite(
    uid             INTEGER NOT NULL,
    user_name       VARCHAR(25) NOT NULL,
    PRIMARY KEY     (uid, user_name),
    FOREIGN KEY     (uid)       REFERENCES TH(uid),
    FOREIGN KEY     (user_name) REFERENCES user(login_name)
);

CREATE TABLE IF NOT EXISTS visit(
    vid             integer,
    uid             integer NOT NULL,
    user_name       varchar(25) NOT NULL,
    start_date      timestamp,
    end_date        timestamp,
    total_spent     integer,
    num_person      integer,
    PRIMARY KEY     (vid),
    FOREIGN KEY     (uid)       REFERENCES TH(uid),
    FOREIGN KEY     (user_name) REFERENCES user(login_name)
);

