/*
   usage:  open mysql client,then input the command like this:
   source path
   wait....
*/

/*
  * drop the database if the database `relationship` existed
*/
/*DROP DATABASE  `relationship`;*/
DROP DATABASE IF EXISTS  `relationship`;
CREATE DATABASE `relationship`;

/*CHOOSE THE DATABASE*/
USE `relationship`;

DROP TABLE IF EXISTS `LEVEL_INFO`;

/*THE LEVEL TABLE*/
CREATE TABLE `LEVEL_INFO`(
  `LEVEL_ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `LEVEL_DESC` TEXT NOT NULL ,
  `LEVEL_NEED_SCORE` REAL NOT NULL
);

/*INSERT THE LEVEL DATA*/
INSERT INTO `LEVEL_INFO`(`LEVEL_DESC`,`LEVEL_NEED_SCORE`) VALUES ('难民',5.0);
INSERT INTO `LEVEL_INFO`(`LEVEL_DESC`,`LEVEL_NEED_SCORE`) VALUES ('愚民',10.0);
INSERT INTO `LEVEL_INFO`(`LEVEL_DESC`,`LEVEL_NEED_SCORE`) VALUES ('百姓',15.0);
INSERT INTO `LEVEL_INFO`(`LEVEL_DESC`,`LEVEL_NEED_SCORE`) VALUES ('乡绅',30.0);
INSERT INTO `LEVEL_INFO`(`LEVEL_DESC`,`LEVEL_NEED_SCORE`) VALUES ('秀才',100.0);
INSERT INTO `LEVEL_INFO`(`LEVEL_DESC`,`LEVEL_NEED_SCORE`) VALUES ('土豪',1000.0);

/*CREATE THE TABLE*/

DROP TABLE IF EXISTS `USER_INFO`;

/*THE USER INFO TABLE*/
CREATE TABLE `USER_INFO`(
  `USER_ID` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `USER_NICK_NAME` VARCHAR(20),
  `USER_SEX` VARCHAR(2),
  `USER_AGE` INT,
  `USER_WORDS` VARCHAR(100),
  `USER_LEVEL` INT REFERENCES `LEVEL_INFO`(`LEVEL_ID`),
  `USER_ONLINE_DATES` INT DEFAULT 0,
  `USER_STATUS` BOOLEAN DEFAULT FALSE
);

/*INSERT SOME SAMPLES DATA*/
INSERT INTO `USER_INFO` (`USER_NICK_NAME`,`USER_SEX`,`USER_LEVEL`) VALUES ('pong','m',0);
INSERT INTO `USER_INFO` (`USER_NICK_NAME`,`USER_SEX`,`USER_LEVEL`) VALUES ('jone','m',2);
INSERT INTO `USER_INFO` (`USER_NICK_NAME`,`USER_SEX`,`USER_LEVEL`) VALUES ('hoke','m',3);
INSERT INTO `USER_INFO` (`USER_NICK_NAME`,`USER_SEX`,`USER_LEVEL`) VALUES ('pdn','w',6);
INSERT INTO `USER_INFO` (`USER_NICK_NAME`,`USER_SEX`,`USER_LEVEL`) VALUES ('tiny','m',1);
INSERT INTO `USER_INFO` (`USER_NICK_NAME`,`USER_SEX`,`USER_LEVEL`) VALUES ('bob','w',4);
INSERT INTO `USER_INFO` (`USER_NICK_NAME`,`USER_SEX`,`USER_LEVEL`) VALUES ('piny','w',3);

DROP TABLE IF EXISTS `USER_RELATIONSHIP`;

/*THE USER RELATIONSHIP TABLE*/
CREATE TABLE `USER_RELATIONSHIP`(
  `OWNER_ID` INT(11) NOT NULL REFERENCES `USER_INFO`(`USER_ID`),
  `FOLLOWER_ID` INT(11) NOT NULL REFERENCES `USER_INFO`(`USER_ID`),
  `FOLLOW_STATUS` BOOLEAN NOT NULL DEFAULT FALSE ,
  `FOLLOW_DATES` INT DEFAULT 0
);

/*CREATE THE RELATIONSHIP*/
INSERT into `USER_RELATIONSHIP` VALUES (0,0,TRUE,10);
INSERT into `USER_RELATIONSHIP` VALUES (0,1,FALSE ,0);
INSERT into `USER_RELATIONSHIP` VALUES (0,2,TRUE ,1);

INSERT into `USER_RELATIONSHIP` VALUES (1,0,TRUE,10);
INSERT into `USER_RELATIONSHIP` VALUES (1,1,FALSE ,0);
INSERT into `USER_RELATIONSHIP` VALUES (1,2,TRUE ,11);
INSERT into `USER_RELATIONSHIP` VALUES (1,4,FALSE ,0);
INSERT into `USER_RELATIONSHIP` VALUES (1,6,TRUE ,12);

INSERT into `USER_RELATIONSHIP` VALUES (2,2,FALSE ,0);
INSERT into `USER_RELATIONSHIP` VALUES (2,0,TRUE ,11);
INSERT into `USER_RELATIONSHIP` VALUES (2,1,FALSE ,0);
INSERT into `USER_RELATIONSHIP` VALUES (2,4,TRUE ,12);

INSERT into `USER_RELATIONSHIP` VALUES (3,1,FALSE ,0);
INSERT into `USER_RELATIONSHIP` VALUES (3,3,TRUE ,11);
INSERT into `USER_RELATIONSHIP` VALUES (3,4,FALSE ,0);
INSERT into `USER_RELATIONSHIP` VALUES (3,6,TRUE ,12);

INSERT into `USER_RELATIONSHIP` VALUES (4,4,FALSE ,0);
INSERT into `USER_RELATIONSHIP` VALUES (4,2,TRUE ,11);

INSERT into `USER_RELATIONSHIP` VALUES (5,5,FALSE ,0);
INSERT into `USER_RELATIONSHIP` VALUES (5,3,TRUE ,12);

INSERT into `USER_RELATIONSHIP` VALUES (6,1,FALSE ,0);
INSERT into `USER_RELATIONSHIP` VALUES (6,2,TRUE ,11);
INSERT into `USER_RELATIONSHIP` VALUES (6,4,FALSE ,0);
INSERT into `USER_RELATIONSHIP` VALUES (6,6,TRUE ,12);






