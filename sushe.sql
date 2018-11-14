/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50137
Source Host           : localhost:3306
Source Database       : sushe

Target Server Type    : MYSQL
Target Server Version : 50137
File Encoding         : 65001

Date: 2018-06-26 14:15:26
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `Admin_ID` int(11) NOT NULL DEFAULT '0',
  `Admin_Username` varchar(255) DEFAULT NULL,
  `Admin_Password` varchar(255) DEFAULT NULL,
  `Admin_Name` varchar(255) DEFAULT NULL,
  `Admin_Sex` varchar(255) DEFAULT NULL,
  `Admin_Tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Admin_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO admin VALUES ('1', 'root', 'root', 'root', 'man', '123');

-- ----------------------------
-- Table structure for `building`
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `Building_ID` int(11) NOT NULL DEFAULT '0',
  `Building_Name` varchar(255) DEFAULT NULL,
  `Building_Introduction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Building_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of building
-- ----------------------------

-- ----------------------------
-- Table structure for `domitory`
-- ----------------------------
DROP TABLE IF EXISTS `domitory`;
CREATE TABLE `domitory` (
  `Domitory_ID` int(11) NOT NULL DEFAULT '0',
  `Domitory_BuildingId` int(11) DEFAULT NULL,
  `Domitory_Name` varchar(255) DEFAULT NULL,
  `Domitory_Type` varchar(255) DEFAULT NULL,
  `Domitory_Number` varchar(255) DEFAULT NULL,
  `Domitory_Tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Domitory_ID`),
  KEY `Domitory_BuildingId` (`Domitory_BuildingId`),
  CONSTRAINT `domitory_ibfk_1` FOREIGN KEY (`Domitory_BuildingId`) REFERENCES `building` (`Building_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of domitory
-- ----------------------------

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `Log_ID` int(11) NOT NULL DEFAULT '0',
  `Log_StudentID` int(11) DEFAULT NULL,
  `Log_TeacherID` int(11) DEFAULT NULL,
  `Log_Date` varchar(255) DEFAULT NULL,
  `Log_Remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Log_ID`),
  KEY `Log_TeacherID` (`Log_TeacherID`),
  KEY `Log_StudentID` (`Log_StudentID`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`Log_TeacherID`) REFERENCES `teacher` (`Teacher_ID`),
  CONSTRAINT `log_ibfk_2` FOREIGN KEY (`Log_StudentID`) REFERENCES `student` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for `out1`
-- ----------------------------
DROP TABLE IF EXISTS `out1`;
CREATE TABLE `out1` (
  `Out_ID` int(11) NOT NULL DEFAULT '0',
  `Out_StudentID` int(11) DEFAULT NULL,
  `Out_Date` varchar(255) DEFAULT NULL,
  `Out_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Out_ID`),
  KEY `Out_StudentID` (`Out_StudentID`),
  CONSTRAINT `out1_ibfk_1` FOREIGN KEY (`Out_StudentID`) REFERENCES `student` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of out1
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `Student_ID` int(11) NOT NULL DEFAULT '0',
  `Student_DomitoryID` int(11) DEFAULT NULL,
  `Student_Username` varchar(255) DEFAULT NULL,
  `Student_Password` varchar(255) DEFAULT NULL,
  `Student_Name` varchar(255) DEFAULT NULL,
  `Student_Sex` varchar(255) DEFAULT NULL,
  `Student_Class` varchar(255) DEFAULT NULL,
  `Student_State` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`),
  KEY `Student_DomitoryID` (`Student_DomitoryID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Student_DomitoryID`) REFERENCES `domitory` (`Domitory_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for `tb`
-- ----------------------------
DROP TABLE IF EXISTS `tb`;
CREATE TABLE `tb` (
  `TB_ID` int(11) NOT NULL DEFAULT '0',
  `TB_TeacherID` int(11) DEFAULT NULL,
  `TB_BuildintID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TB_ID`),
  KEY `TB_TeacherID` (`TB_TeacherID`),
  KEY `TB_BuildintID` (`TB_BuildintID`),
  CONSTRAINT `tb_ibfk_2` FOREIGN KEY (`TB_BuildintID`) REFERENCES `building` (`Building_ID`),
  CONSTRAINT `tb_ibfk_1` FOREIGN KEY (`TB_TeacherID`) REFERENCES `teacher` (`Teacher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `Teacher_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Teacher_Username` varchar(255) DEFAULT NULL,
  `Teacher_Password` varchar(255) DEFAULT NULL,
  `Teacher_Name` varchar(255) DEFAULT NULL,
  `Teacher_Sex` varchar(255) DEFAULT NULL,
  `Teacher_Tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Teacher_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
