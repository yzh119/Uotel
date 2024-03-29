DROP DATABASE if EXISTS acmdb10;
CREATE DATABASE acmdb10;
USE acmdb10;
SELECT DATABASE();

CREATE TABLE IF NOT EXISTS user (
    name         VARCHAR(25),
    login_name   VARCHAR(25),
    passwd       VARCHAR(25),
    address      VARCHAR(50),
    phone_number VARCHAR(25),
    PRIMARY KEY (login_name)
);

CREATE TABLE IF NOT EXISTS TH (
    uid          INTEGER,
    owner        VARCHAR(25) NOT NULL ,
    name         VARCHAR(25),
    address      VARCHAR(50),
    url          VARCHAR(50),
    phone_number VARCHAR(25),
    year_built   INTEGER,
    price        INTEGER,
    visit_count  INTEGER,
    PRIMARY KEY (uid),
    FOREIGN KEY (owner) REFERENCES user(login_name)
);


CREATE TABLE IF NOT EXISTS period (
    start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (start_date, end_date)
);


CREATE TABLE IF NOT EXISTS available (
    uid        INTEGER   NOT NULL,
    start_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    end_date   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (uid, start_date, end_date),
    FOREIGN KEY (uid) REFERENCES TH (uid),
    FOREIGN KEY (start_date, end_date) REFERENCES period (start_date, end_date)
);


CREATE TABLE IF NOT EXISTS keyword (
    str VARCHAR(25),
    PRIMARY KEY (str)
);


CREATE TABLE IF NOT EXISTS category (
    str VARCHAR(25),
    PRIMARY KEY (str)
);


CREATE TABLE IF NOT EXISTS TH_keyword_pair (
    uid INTEGER     NOT NULL,
    str VARCHAR(25) NOT NULL,
    PRIMARY KEY (uid, str),
    FOREIGN KEY (uid) REFERENCES TH (uid),
    FOREIGN KEY (str) REFERENCES keyword (str)
);


CREATE TABLE IF NOT EXISTS TH_category_pair (
    uid INTEGER     NOT NULL,
    str VARCHAR(25) NOT NULL,
    PRIMARY KEY (uid, str),
    FOREIGN KEY (uid) REFERENCES TH (uid),
    FOREIGN KEY (str) REFERENCES keyword (str)
);


CREATE TABLE IF NOT EXISTS reservation (
    rid        INTEGER,
    uid        INTEGER     NOT NULL,
    user_name  VARCHAR(25) NOT NULL,
    start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (rid, user_name),
    FOREIGN KEY (uid) REFERENCES TH (uid),
    FOREIGN KEY (user_name) REFERENCES user (login_name)
);


CREATE TABLE IF NOT EXISTS favorite (
    uid       INTEGER     NOT NULL,
    user_name VARCHAR(25) NOT NULL,
    PRIMARY KEY (uid, user_name),
    FOREIGN KEY (uid) REFERENCES TH (uid),
    FOREIGN KEY (user_name) REFERENCES user (login_name)
);


CREATE TABLE IF NOT EXISTS visit (
    rid         INTEGER     NOT NULL,
    user_name   VARCHAR(25) NOT NULL,
    start_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_spent INTEGER,
    num_person  INTEGER,
    PRIMARY KEY (rid, user_name, start_date, end_date),
    FOREIGN KEY (rid, user_name) REFERENCES reservation (rid, user_name)
);


