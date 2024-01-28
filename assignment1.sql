create database assignment;
use assignment;

CREATE TABLE user (
    userid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(15)
);

CREATE TABLE tweet (
    tweetid INT PRIMARY KEY AUTO_INCREMENT,
    userid INT,
    content TEXT,
    original_tweetid_for_retweet INT,
    parent_tweetid_for_comment INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userid) REFERENCES user(userid),
    FOREIGN KEY (original_tweetid_for_retweet) REFERENCES tweet(tweetid),
    FOREIGN KEY (parent_tweetid_for_comment) REFERENCES tweet(tweetid) 
);

CREATE TABLE likes (
    likeid INT PRIMARY KEY AUTO_INCREMENT,
    userid INT,
    tweetid INT,
    FOREIGN KEY (userid) REFERENCES user(userid),
    FOREIGN KEY (tweetid) REFERENCES tweet(tweetid)
);

CREATE TABLE follow (
    followid INT PRIMARY KEY AUTO_INCREMENT,
    follower_userid INT,
    following_userid INT,
    FOREIGN KEY (follower_userid) REFERENCES user(userid),
    FOREIGN KEY (following_userid) REFERENCES user(userid)
);
