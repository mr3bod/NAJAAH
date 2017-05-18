-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 17, 2017 at 09:04 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kfupm`
--

-- --------------------------------------------------------

--
-- Table structure for table `VIEW_ACTIVETERMS`
--

CREATE TABLE `VIEW_ACTIVETERMS` (
  `Student_ID` varchar(9) NOT NULL,
  `No. of Active Terms` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VIEW_ADVISOR`
--

CREATE TABLE `VIEW_ADVISOR` (
  `ADVISOR_ID` varchar(255) DEFAULT NULL,
  `ADVISOR_NAME` varchar(183) DEFAULT NULL,
  `STU_ID` varchar(255) DEFAULT NULL,
  `STU_NAME` varchar(183) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VIEW_COREQ`
--

CREATE TABLE `VIEW_COREQ` (
  `CRSE_CODE` varchar(4) NOT NULL,
  `CRSE_NUMB` varchar(5) NOT NULL,
  `COREQ_CRSE_CODE` varchar(4) DEFAULT NULL,
  `COREQ_CRSE_NUMB` varchar(5) DEFAULT NULL,
  `SCRRTST_CONCURRENCY_IND` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `VIEW_COURSE`
--

CREATE TABLE `VIEW_COURSE` (
  `CRSE_CODE` varchar(4) NOT NULL,
  `CRSE_NUMB` varchar(5) NOT NULL,
  `CRSE_TITLE` varchar(30) DEFAULT NULL,
  `CRSE_LEVEL` varchar(2) NOT NULL,
  `LEC_HRS` int(11) DEFAULT NULL,
  `LAB_HRS` int(11) DEFAULT NULL,
  `CREDIT_HRS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VIEW_COURSE_OFFERING_ALL_TERMS`
--

CREATE TABLE `VIEW_COURSE_OFFERING_ALL_TERMS` (
  `TERM_CODE` varchar(6) NOT NULL,
  `COURSE_CODE` varchar(10) DEFAULT NULL,
  `SECTION_ID` varchar(3) NOT NULL,
  `CRN_Numb` varchar(5) NOT NULL,
  `SECTION_TYPE` varchar(3) NOT NULL,
  `SECTION_TYPE_DESC` varchar(30) NOT NULL,
  `FACULTY_ID` varchar(9) DEFAULT NULL,
  `STATUS` varchar(5) DEFAULT NULL,
  `BLDG_NUMB` varchar(6) DEFAULT NULL,
  `ROOM_NUMB` varchar(10) DEFAULT NULL,
  `START_TIME` varchar(4) DEFAULT NULL,
  `END_TIME` varchar(4) DEFAULT NULL,
  `MAX_ENRL` varchar(4) NOT NULL,
  `CURR_ENRL` varchar(4) NOT NULL,
  `SUN` varchar(1) DEFAULT NULL,
  `MON` varchar(1) DEFAULT NULL,
  `TUE` varchar(1) DEFAULT NULL,
  `WED` varchar(1) DEFAULT NULL,
  `THU` varchar(1) DEFAULT NULL,
  `CLASS_DAYS` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VIEW_COURSE_OFFERING_TERM`
--

CREATE TABLE `VIEW_COURSE_OFFERING_TERM` (
  `TERM` varchar(6) NOT NULL,
  `CRN` varchar(5) NOT NULL,
  `COURSE` varchar(21) DEFAULT NULL,
  `DEPT` varchar(4) DEFAULT NULL,
  `SEC` varchar(3) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `AVIL` int(4) NOT NULL,
  `M_ACT` varchar(3) DEFAULT NULL,
  `DAYS1` varchar(6) DEFAULT NULL,
  `START1` varchar(4) DEFAULT NULL,
  `END1` varchar(4) DEFAULT NULL,
  `BLDG` varchar(6) DEFAULT NULL,
  `ROOM` varchar(10) DEFAULT NULL,
  `INSTR` varchar(121) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VIEW_DEPARTMENT`
--

CREATE TABLE `VIEW_DEPARTMENT` (
  `DEPT_CODE` varchar(4) NOT NULL,
  `DEPT_NAME` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VIEW_FACULTY`
--

CREATE TABLE `VIEW_FACULTY` (
  `FAC_ID` varchar(9) NOT NULL,
  `FAC_FIRST_NAME` varchar(60) DEFAULT NULL,
  `FAC_LAST_NAME` varchar(60) NOT NULL,
  `FAC_EMAIL_ID` varchar(255) DEFAULT NULL,
  `FAC_EMAIL_ADDRESS` varchar(268) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VIEW_MAJOR`
--

CREATE TABLE `VIEW_MAJOR` (
  `MAJOR_CODE` varchar(4) NOT NULL,
  `MAJOR_NAME` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VIEW_PREREQ`
--

CREATE TABLE `VIEW_PREREQ` (
  `CRSE_CODE` varchar(4) NOT NULL,
  `CRSE_NUMB` varchar(5) NOT NULL,
  `PREREQ_CRSE_CODE` varchar(4) DEFAULT NULL,
  `PREREQ_CRSE_NUMB` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VIEW_PROGRAMS`
--

CREATE TABLE `VIEW_PROGRAMS` (
  `PROGRAM_CODE` varchar(12) NOT NULL,
  `PROGRAM_NAME` varchar(30) NOT NULL,
  `STUDENT_LEVEL` varchar(2) NOT NULL,
  `PROG_TOTAL_HOURS` int(11) DEFAULT NULL,
  `SMBPGEN_TERM_CODE_EFF` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VIEW_STUDENT`
--

CREATE TABLE `VIEW_STUDENT` (
  `STU_ID` varchar(9) NOT NULL,
  `STU_FIRST_NAME` varchar(60) DEFAULT NULL,
  `STU_LAST_NAME` varchar(60) NOT NULL,
  `STU_EMAIL_ID` varchar(255) DEFAULT NULL,
  `STU_STATUS` varchar(2) NOT NULL,
  `STATUS_DESC` varchar(30) DEFAULT NULL,
  `STU_LEVEL` varchar(2) DEFAULT NULL,
  `STU_LEVEL_DESC` varchar(30) DEFAULT NULL,
  `STU_MAJOR` varchar(4) DEFAULT NULL,
  `MAJOR_DESC` varchar(30) DEFAULT NULL,
  `STU_CUMM_GPA` double DEFAULT NULL,
  `ADVISOR_ID` varchar(255) DEFAULT NULL,
  `ADVISOR_NAME` varchar(183) DEFAULT NULL,
  `ASTD_TERM` varchar(6) DEFAULT NULL,
  `STU_STANDING_CODE` varchar(2) DEFAULT NULL,
  `STU_STANDING` varchar(30) DEFAULT NULL,
  `STU_CLASS` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VIEW_STUDENT_SCHEDULE`
--

CREATE TABLE `VIEW_STUDENT_SCHEDULE` (
  `TERM_CODE` varchar(6) NOT NULL,
  `STUDENT_ID` varchar(9) NOT NULL,
  `STU_SECTION_CRN` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VIEW_TRANSCRIPT`
--

CREATE TABLE `VIEW_TRANSCRIPT` (
  `STU_ID` varchar(9) NOT NULL,
  `CRSE_CODE` varchar(10) DEFAULT NULL,
  `SECTION_NUMB` varchar(40) DEFAULT NULL,
  `CRSE_TITLE` varchar(30) DEFAULT NULL,
  `FINAL_GRADE` varchar(6) DEFAULT NULL,
  `TERM_CODE` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
