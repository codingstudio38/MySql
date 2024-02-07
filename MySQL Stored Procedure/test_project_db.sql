-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2024 at 05:07 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_project_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CountRowByEmail` (IN `emailid` VARCHAR(150) CHARSET utf8, OUT `total_row` INT)   BEGIN

SELECT COUNT(`id`) INTO total_row FROM `users` WHERE `users`.`email` = emailid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CountRowById` (IN `id` INT, OUT `total_row` INT)   BEGIN

SELECT COUNT(`id`) INTO total_row FROM `users` WHERE `users`.`id` =id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateNew` (IN `name` VARCHAR(150) CHARSET utf8, IN `email` VARCHAR(100) CHARSET utf8, IN `phone` BIGINT, IN `password` VARCHAR(255) CHARSET utf8, IN `user_role_id` INT)   BEGIN
    INSERT INTO `users` (`user_role_id`,`name`,`email`,`phone`,`password`) values (user_role_id,name,email,phone,password);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateNewBlog` (IN `photo` CHAR(50) CHARSET utf8, IN `title` VARCHAR(255) CHARSET utf8, IN `description` MEDIUMTEXT CHARSET utf8, IN `user_id` INT)   BEGIN
    INSERT INTO `blog_list_tbl` (`user_id`,`photo`,`title`,`description`) values (user_id,photo,title,description);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteBlogById` (IN `idis` INT)   BEGIN
    DELETE FROM `blog_list_tbl` WHERE `blog_list_tbl`.`id` = idis;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBlogById` (IN `id` INT)   BEGIN

SELECT * from `blog_list_tbl` WHERE `blog_list_tbl`.`id` = id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBlogByTitle` (IN `titleis` VARCHAR(255))   BEGIN

SELECT * from `blog_list_tbl` WHERE `blog_list_tbl`.`title` = titleis;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRowByEmail` (IN `emailid` VARCHAR(150) CHARSET utf8)   BEGIN

SELECT * from `users` WHERE `users`.`email` = emailid;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRowById` (IN `id` INT)   BEGIN

SELECT * from `users` WHERE `users`.`id` = id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `QuarterStartAndEnd` (IN `ToDay` DATE)   BEGIN
DECLARE StartDate DATE DEFAULT NULL;
DECLARE EndDate DATE DEFAULT NULL;
-- SET StartDate = 
--     (CASE
--         WHEN MONTH(ToDay) BETWEEN 1 AND 3 THEN CONCAT(YEAR(ToDay) , '-01-01')
--         WHEN MONTH(ToDay) BETWEEN 4 AND 6 THEN CONCAT(YEAR(ToDay) , '-04-01')
--         WHEN MONTH(ToDay) BETWEEN 7 AND 9 THEN CONCAT(YEAR(ToDay) , '-07-01')
--         WHEN MONTH(ToDay) BETWEEN 10 AND 12 THEN CONCAT(YEAR(ToDay) , '-10-01')
--     END);
-- SET EndDate = 
--     (CASE
--         WHEN MONTH(ToDay) BETWEEN 1 AND 3 THEN CONCAT(YEAR(ToDay), '-03-31')
--         WHEN MONTH(ToDay) BETWEEN 4 AND 6 THEN CONCAT(YEAR(ToDay), '-06-30')
--         WHEN MONTH(ToDay) BETWEEN 7 AND 9 THEN CONCAT(YEAR(ToDay), '-09-30')
--         WHEN MONTH(ToDay) BETWEEN 10 AND 12 THEN CONCAT(YEAR(ToDay), '-12-31')
--     END);
    CASE
        WHEN MONTH(ToDay) BETWEEN 1 AND 3 THEN
           SET StartDate = CONCAT(YEAR(ToDay) , '-01-01');
           SET EndDate = CONCAT(YEAR(ToDay), '-03-31');
        WHEN MONTH(ToDay) BETWEEN 4 AND 6 THEN
            SET StartDate = CONCAT(YEAR(ToDay) , '-04-01');
            SET EndDate = CONCAT(YEAR(ToDay), '-06-30');
        WHEN MONTH(ToDay) BETWEEN 7 AND 9 THEN
            SET StartDate = CONCAT(YEAR(ToDay) , '-07-01');
            SET EndDate = CONCAT(YEAR(ToDay), '-09-30');
        WHEN MONTH(ToDay) BETWEEN 10 AND 12 THEN
            SET StartDate = CONCAT(YEAR(ToDay) , '-10-01');
            SET EndDate = CONCAT(YEAR(ToDay), '-12-31');
        ELSE
            SET EndDate = '0000-00-00';
            SET StartDate = '0000-00-00';
    END CASE;

SELECT ToDay, QUARTER(ToDay) AS QuarterNo, StartDate, EndDate;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBlog` (IN `id` INT, IN `photo` CHAR(50) CHARSET utf8, IN `title` VARCHAR(255) CHARSET utf8, IN `description` MEDIUMTEXT CHARSET utf8, IN `user_id` INT)   BEGIN
    UPDATE `blog_list_tbl` SET `user_id` = user_id,`photo` = photo,`title` = title,`description` = description WHERE `blog_list_tbl`.`id` = id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `blog_list_tbl`
--

CREATE TABLE `blog_list_tbl` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `photo` char(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_list_tbl`
--

INSERT INTO `blog_list_tbl` (`id`, `user_id`, `photo`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'blog-18546.png', 'Where is Putin? Silence cloaks Kremlin after Wagner mutiny', '<h2 class=\"sortDec\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px 0px 16px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-weight: 400; font-family: Lato, sans-serif; font-size: 16px; line-height: 20px;\">\n	In a bewildering 24 hours, a transfixed international audience watched troops loyal to Russian mercenary Prigozhin advance hundreds of miles toward Moscow.</h2>\n<p>\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">An eerie calm fell on Russia after the dramatic end to an armed uprising that posed the greatest threat to Vladimir Putin&rsquo;s almost quarter-century rule.</span></p>\n<p>\n	<strong style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; position: relative; color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">Read here:</strong><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">&nbsp;</span><a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/world-news/be-very-careful-around-windows-ex-cia-chiefs-warning-after-wagner-mutiny-against-putin-101687741290779.html\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205); font-family: Lato, sans-serif; font-size: 16px;\" target=\"_blank\">&lsquo;Be very careful around windows&rsquo;: Ex-CIA chief&#39;s warning after Wagner mutiny against Putin</a></p>\n<p>\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">The man who led the insurrection has gone uncharacteristically quiet. The president hasn&rsquo;t been seen in public since denouncing the mutiny as &ldquo;treason&rdquo; and threatening &ldquo;harsh&rdquo; punishment that never transpired.</span></p>\n<p>\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">In a bewildering 24 hours, a transfixed international audience watched troops loyal to Russian mercenary Yevgeny Prigozhin advance hundreds of miles toward Moscow at breakneck speed only for him to suddenly call off the assault and agree to go into exile with all charges dropped in a late-night deal.</span></p>\n<p>\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">The rapid chain of events left the US and Europe puzzling over the political implications of a rebellion that shattered Putin&rsquo;s invincible image as Russia&rsquo;s leader. The crisis unfolded amid bitter divisions in Russia over the faltering war in Ukraine that&rsquo;s the biggest conflict in Europe since World War II, as a Ukrainian counteroffensive continues to try to push Russian forces out of occupied territories.</span></p>\n<p>\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">US Secretary of State Antony Blinken said the Wagner mercenary group&rsquo;s revolt was a &ldquo;direct challenge&rdquo; to Putin&rsquo;s authority and &ldquo;raises profound questions,&rdquo; in an interview Sunday on CBS&rsquo;s Face the Nation. &ldquo;We can&rsquo;t speculate or know exactly where that&rsquo;s going to go. We do know that Putin has a lot more to answer for in the weeks and months ahead.&rdquo;</span></p>\n<p>\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">The US had intelligence several days ago that Prigozhin was plotting to take armed action against Russian defense officials, according to a person familiar with the matter.</span></p>', 1, '2023-06-26 05:15:22', '2023-06-28 05:48:07'),
(2, 1, 'blog-13349.png', '‘Can say very clearly that…’: RBI governor Das on withdrawal of ₹2000 notes', '<h2 class=\"sortDec\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px 0px 16px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-weight: 400; font-family: Lato, sans-serif; font-size: 16px; line-height: 20px;\">\r\n	On May 19, the Reserve Bank of India announced the withdrawal from circulation of the note, though it stays a legal tender.</h2>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">The&nbsp;</span><a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/india-news/on-rs-2000-notes-withdrawal-exchange-rbi-governor-shaktikanta-das-assurance-101684923938741.html\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205); font-family: Lato, sans-serif; font-size: 16px;\" target=\"_blank\"><strong style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; position: relative;\">withdrawal&nbsp;</strong></a><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">of the&nbsp;</span><span class=\"webrupee\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; font-family: Arial, Helvetica, sans-serif; color: rgb(66, 66, 66); font-size: 16px;\">₹</span><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">2000 currency note, announced last month by the Reserve Bank of India (RBI), will not have any negative impact on the economy, RBI governor Shaktikanta Das stressed on Monday.</span></p>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">&ldquo;I can tell you very clearly that the&nbsp;</span><span class=\"webrupee\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; font-family: Arial, Helvetica, sans-serif; color: rgb(66, 66, 66); font-size: 16px;\">₹</span><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">2000 currency note, that is being withdrawn from circulation, will not have any negative impact on the economy,&rdquo; Das told PTI in an exclusive interview.</span></p>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">The RBI governor, however, pointed to challenges such as &lsquo;uncertainties&rsquo; that the Indian economy must deal with.</span></p>\r\n<p>\r\n	<span style=\"color: rgb(47, 47, 47); font-family: Lato, sans-serif; font-size: 15px;\">Also Read |&nbsp;</span><a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/business/will-strive-to-get-inflation-down-to-4-el-nino-a-challenge-for-food-inflation-rbi-governor-shaktikanta-das-101687710646563.html\" style=\"font-family: Lato, sans-serif; font-size: 15px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205);\" target=\"_blank\">Will strive to get inflation down to 4%; El Nino a challenge for food inflation: RBI Governor Shaktikanta Das</a></p>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">&ldquo;There are two or three challenges. The first is international uncertainty, the second is the El Nino forecast, and others are mainly weather-related events,&rdquo; he remarked.</span></p>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">Also, the central bank has taken several measures, including raising policy rates in a &lsquo;calibrated&rsquo; manner, and brought inflation down to less than 5%, the ex-bureaucrat further stated.</span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<h2 style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px 0px 10px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(47, 47, 47); font-family: Lato, sans-serif; font-size: 15px;\">\r\n	Withdrawal of&nbsp;<span class=\"webrupee\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; font-family: Arial, Helvetica, sans-serif;\">₹</span>2,000 denomination notes</h2>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	On May 19, the RBI announced the withdrawal of the&nbsp;<span class=\"webrupee\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; font-family: Arial, Helvetica, sans-serif;\">₹</span>2000 denomination notes, doing so as part of its currency management. The notes, however, continue to be legal tender, and people can exchange or deposit these at their nearest bank branch, with the deadline to do so being September 30. Additionally, a maximum of ten such notes can be exchanged or deposited in one go. There is however, no limit on the number of times these can be exchanged/deposited.</p>', 1, '2023-06-26 05:17:05', '2023-06-26 08:01:24'),
(3, 1, 'blog-64684.png', '\'He partied all night and scored 250 next day, has changed\': Senior India pacer narrates unheard tale about Virat Kohli', '<h2 class=\"sortDec\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px 0px 16px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-weight: 400; font-family: Lato, sans-serif; font-size: 16px; line-height: 20px;\">\r\n	The veteran India pacer recounted how Virat Kohli used to be in his younger days and how the former captain has changed with age.</h2>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">Former Indian skipper&nbsp;</span><a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/topic/virat-kohli\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205); font-family: Lato, sans-serif; font-size: 16px;\" target=\"_blank\">Virat Kohli</a><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">&nbsp;has always raised the bar when it comes to fitness. Besides consistently scoring runs for India across formats, the 34-year-old has also been the flagbearer of modern-day fitness in world cricket. For the unversed, the Indian run-machine completely changed his fitness regime after a below-par season in the Indian Premier League (IPL) 2012. Switching from a chubby-face lad and surrendering himself to the gym for hours, Kohli elevated his game through his revamped fitness regime.</span></p>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">Fast forwarding the clock to the present, Kohli has inspired many through his remarkable fitness journey. The ace cricketer is often seen sharing fitness videos through his social media handles. Under his captaincy stint, the yo-yo test became a selection standard at Team India. Talking about the dramatic transformation of the ex-India skipper, veteran pacer Ishant Sharma shared an unheard story about Kohli.</span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<h2 style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px 0px 10px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(47, 47, 47); font-family: Lato, sans-serif; font-size: 15px;\">\r\n	Also Read:&nbsp;<a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/cricket/shreyas-iyer-took-injection-for-back-pain-at-nca-india-star-doubtful-for-asia-cup-2023-reports-101687689099293.html\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205);\" target=\"_blank\">&#39;Shreyas Iyer took injection for back pain at NCA&#39;: India star doubtful for Asia Cup 2023 - Reports</a></h2>\r\n<h2 style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px 0px 10px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(47, 47, 47); font-family: Lato, sans-serif; font-size: 15px;\">\r\n	Kohli partied all night and the next day scored 250</h2>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">Speaking to Ranveer Allahbadia on his YouTube channel, senior pacer Ishant said that he has seen the &#39;party phase&#39; and the &#39;tattoo phase&#39; of his Delhi teammate. &ldquo;We were playing a U-19 match in Kolkata. He was batting overnight, yet partied all night and the next day he scored 250. I have seen that phase of Kohli as well. The best thing about him, according to me, is how he changed his physical aspect starting in 2012, after the World Cup. He was training, but because of his diet, his mental strength and cricket, in general, went to a different level,&quot; Ishant said.</span></p>', 1, '2023-06-26 05:31:13', '2023-06-26 08:01:25'),
(5, 1, 'blog-81749.png', 'Adipurush box office day 10 collection: Prabhas film adds ₹6 crore on Sunday, stands at ₹274 crore.', '<h2 class=\"sortDec\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px 0px 16px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-weight: 400; font-family: Lato, sans-serif; font-size: 16px; line-height: 20px;\">\r\n	Adipurush box office collection: Prabhas, Kriti Sanon and Saif Ali Khan&#39;s film could only add around ₹58 crore to its India collection in last seven days.</h2>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">Adipurush box office collection: The Om Raut film got some relief in its second weekend but the improvement is too little to make much of a difference. Starring Prabhas,&nbsp;</span><a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/topic/saif-ali-khan\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205); font-family: Lato, sans-serif; font-size: 16px;\" target=\"_blank\">Saif Ali Khan</a><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">&nbsp;and&nbsp;</span><a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/topic/kriti-sanon\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205); font-family: Lato, sans-serif; font-size: 16px;\" target=\"_blank\">Kriti Sanon</a><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">&nbsp;in lead roles, the film went on to collect around&nbsp;</span><span class=\"webrupee\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; font-family: Arial, Helvetica, sans-serif; color: rgb(66, 66, 66); font-size: 16px;\">₹</span><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">6 crore on its second Sunday.&nbsp;</span><strong style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; position: relative; color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">Also read:</strong><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">&nbsp;</span><a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/entertainment/tv/exclusive-mahabharats-girija-shankar-on-gufi-paintal-101687743181740.html\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205); font-family: Lato, sans-serif; font-size: 16px;\" target=\"_blank\">Mahabharat actor Girija Shankar on Adipurush: &#39;There&#39;s no need to use this tapori langauge, they could have done better&#39;</a></p>\r\n<h2 style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px 0px 10px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(47, 47, 47); font-family: Lato, sans-serif; font-size: 15px;\">\r\n	Adipurush faces negative word of mouth</h2>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	<a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/topic/adipurush\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205);\" target=\"_blank\">Adipurush</a>&nbsp;has been widely slammed for its treatment of characters, the epic story of Ramayana and its colloquial dialogues. Amid severe backlash, some of the dialogues were modified by the makers after few days of its release. Despite the changes, the negative word of mouth refuses to slow down.</p>\r\n<h2 style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px 0px 10px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(47, 47, 47); font-family: Lato, sans-serif; font-size: 15px;\">\r\n	Adipurush box office</h2>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	According to a report on Sacnilk.com, Adipurush earned an estimated&nbsp;<span class=\"webrupee\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; font-family: Arial, Helvetica, sans-serif;\">₹</span>6 crore net in India in all languages on its tenth day. This takes its 10-day total to around&nbsp;<span class=\"webrupee\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; font-family: Arial, Helvetica, sans-serif;\">₹</span>274.55 crore at the domestic box office in all languages.</p>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	The film had a wonderful opening of&nbsp;<span class=\"webrupee\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; font-family: Arial, Helvetica, sans-serif;\">₹</span>37 crore on June 16 with&nbsp;<span class=\"webrupee\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; font-family: Arial, Helvetica, sans-serif;\">₹</span>140 crore worldwide gross collection. It crossed&nbsp;<span class=\"webrupee\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; font-family: Arial, Helvetica, sans-serif;\">₹</span>200 crore in India in its first weekend itself but since its first Monday, it has been on a free fall and has failed to add another&nbsp;<span class=\"webrupee\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; font-family: Arial, Helvetica, sans-serif;\">₹</span>100 crore in a week.</p>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	The film has been called out for its dialogues written by&nbsp;<a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/cities/mumbai-news/writer-manoj-muntashir-gets-death-threat-over-adipurush-dialogues-101687203621459.html\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205);\" target=\"_blank\">Manoj Muntashir.</a>&nbsp;On Saturday, All India Cine Workers Association wrote a letter to Union Home Minister Amit Shah and Mumbai Police, demanding the registration of a case against the producer, director, and writer of Adipurush.</p>', 1, '2023-06-26 06:41:26', '2023-06-26 08:10:50'),
(6, 1, 'blog-96744.png', 'On Obama\'s Muslims in India remark, Rajnath says, \'All people are one family\'', '<h2 class=\"sortDec\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px 0px 16px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-weight: 400; font-family: Lato, sans-serif; font-size: 16px; line-height: 20px;\">\r\n	Barack Obama had spoken about the protection of the rights of the ethnic minorities in India, this at a time when PM Modi was on a State visit to the US.</h2>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 14px;\">Defence Minister Rajnath Singh during a National Security Conclave&#39;, at Zorawar Singh Auditorium in Jammu, Monday.(PTI)</span></p>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">Defence minister Rajnath Singh on Monday retorted to former US President Barack Obama&#39;s remark on Muslims in India.</span></p>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">&ldquo;Obama ji should not forget that India is the only country which considers all the people living in the world as family members... He should also think about himself as to how many Muslim countries he has attacked&rdquo;, the minister said at an event in Jammu.</span></p>\r\n<p>\r\n	<br style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\" />\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">Singh&#39;s remarks come a day after finance minister&nbsp;</span><a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/india-news/nirmala-sitharaman-barack-obama-bombed-6-muslim-countries-pm-modi-us-visit-protection-of-minorities-101687700398984.html\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205); font-family: Lato, sans-serif; font-size: 16px;\" target=\"_blank\">Nirmala Sitharaman had hit back at Obama</a><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">. Addressing a presser on Sunday, she said six Muslim-dominated countries were bombed by the US when Obama was its president.</span></p>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: medium;\">&ldquo;More than 26,000 bombs were dropped&hellip;how will people trust his words?&rdquo; she had added.</span></p>\r\n<div class=\"embed_div ht-twitter-embed\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 15px 0px; list-style-type: none; outline: none; overflow-wrap: break-word; position: relative; color: rgb(0, 0, 0); font-family: Lato, sans-serif; font-size: medium;\">\r\n	<div class=\"lozad\" data-loaded=\"true\" data-twitter-src=\"https://twitter.com/ANI/status/1673250469999951873?ref_src=twsrc%5Etfw\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word;\">\r\n		<blockquote class=\"twitter-tweet\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word;\">\r\n			<span style=\"color: rgb(66, 66, 66);\">In an interview to CNN, the former US president had&nbsp;</span><a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/india-news/prime-minister-narendra-modi-us-visit-barack-obama-muslim-minorities-india-pm-modi-meets-joe-biden-congress-101687450702498.html\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205);\" target=\"_blank\">spoken about the protection of the rights of the ethnic minorities</a><span style=\"color: rgb(66, 66, 66);\">&nbsp;in India. He has said India may start &lsquo;pulling apart&rsquo; if its government does not protect the rights of ethnic minorities.</span></blockquote>\r\n	</div>\r\n</div>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	Obama&#39;s remarks had come at a time when Prime Minister Narendra Modi was on a state visit to the United States. He has said if a US president meets PM Modi, then &ldquo;the protection of Muslim minority in a Hindu-majority India&rdquo; is worth mentioning.</p>', 1, '2023-06-26 10:00:47', '2023-06-26 10:00:47'),
(7, 1, 'blog-18470.png', 'Did OceanGate CEO actively pursue wealthy clients for fatal dive? Industry expert called him ‘predatory’', '<h2 class=\"sortDec\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px 0px 16px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-weight: 400; font-family: Lato, sans-serif; font-size: 16px; line-height: 20px;\">\r\n	OceanGate&#39;s CEO, Stockton Rush, has been accused of actively seeking out wealthy clients to participate in his costly deep-sea submersible trips to the Titanic</h2>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">OceanGate&#39;s CEO, Stockton Rush, has been accused of actively seeking out wealthy clients to participate in his costly deep-sea submersible trips to the Titanic. Industry expert Patrick Lahey, president of Triton Submarines, described Rush&#39;s approach as &quot;predatory,&quot; highlighting his ability to convince even those aware of the risks involved.</span></p>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: medium;\">French Titanic expert Paul-Henri Nargeolet was among those persuaded by Rush, leading to his tragic demise along with Rush and three other passengers when the vessel suffered a catastrophic implosion.</span></p>\r\n<h2 style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px 0px 10px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(47, 47, 47); font-family: Lato, sans-serif; font-size: 15px;\">\r\n	Lahey&#39;s Warnings and Concerns Ignored</h2>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	Patrick Lahey, who was acquainted with Nargeolet, revealed that he had warned him against joining the ill-fated dive. Lahey expressed his candid concerns about the operation and its lack of safety precautions. He even described Rush&#39;s pursuit as predatory, emphasizing how he could convince individuals despite the known risks involved.Lahey lamented the fact that Nargeolet ended up in the middle of a tragedy, believing he may have thought he could help avoid it.</p>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	Lahey had cautioned Nargeolet that participating in the OceanGate expedition would inadvertently endorse and legitimize the operation.</p>\r\n<h2 style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px 0px 10px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(47, 47, 47); font-family: Lato, sans-serif; font-size: 15px;\">\r\n	Safety Concerns Dismissed by Rush</h2>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	Lahey had previously cautioned Nargeolet about Rush&#39;s disregard for safety concerns. Rush had dismissed warnings about the Titan, referring to it as a &quot;monstrosity&quot; constructed with outdated and unpredictable parts. Rob McCallum, a consultant for OceanGate, had also raised concerns about the lack of certification for the submersible, asserting that it put passengers&#39; lives at risk. However, Rush disregarded these concerns and labeled them as baseless cries and personal insults.</p>', 1, '2023-06-27 03:49:28', '2023-06-27 03:49:28'),
(8, 1, 'blog-48497.png', '‘We honor their zest for life’: Florida couple drops lawsuit against late Stockton Rush as ‘respect’ is more important', '<h2 class=\"sortDec\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px 0px 16px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-weight: 400; font-family: Lato, sans-serif; font-size: 16px; line-height: 20px;\">\r\n	Marc and Sharon Hagle filed the lawsuit in February after Stockton Rush reportedly refused to refund them over $210,000</h2>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 14px;\">OceanGate CEO and co-founder Stockton Rush speaks in front of a projected image of the wreckage of the ocean liner SS Andrea Doria during a presentation on their findings after an undersea exploration, on June 13, 2016, in Boston (AP Photo/Bill Sikes, File)(AP)</span></p>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">A Florida couple who sued OceanGate CEO Stockton Rush has announced that they are dropping the lawsuit after the Titan tragedy. A&nbsp;catastrophic implosion of the Titan submersible resulted in the deaths of five passengers. Stockton was killed in the along with British billionaire Hamish Harding, French diver Paul Henry Nargeolet, and Pakistani businessman Shahzada Dawood and his son, Suleman.</span></p>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: medium;\">Marc and Sharon Hagle filed the lawsuit in February after Stockton reportedly refused to refund them over $210,000. The couple said they spent the amount on an expedition that was set to take place in 2018, according to court records.</span></p>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	The Winter Park couple released a statement soon after the Titan tragedy, saying, &ldquo;Like most around the world, we have watched the coverage of the OceanGate Titan capsule with great concern and enormous amount of sadness and compassion for the families of those who lost their lives. We honor their zest for life, as well as their commitment to the exploration of our oceans.&rdquo;</p>', 1, '2023-06-27 03:50:21', '2023-06-27 03:50:21'),
(9, 1, 'blog-68876.png', 'Pakistan summons US envoy over Modi-Biden statement, gets firm response', '<h2 class=\"sortDec\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px 0px 16px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-weight: 400; font-family: Lato, sans-serif; font-size: 16px; line-height: 20px;\">\r\n	PM Modi and Biden had called on Pakistan to take immediate action to ensure that no territory under its control is used for launching terrorist attacks.</h2>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 14px;\">US President Joe Biden with Prime Minister Narendra Modi during a ceremonial welcome at the South Lawns of the White House in Washington DC,(President Biden / Twitter)</span></p>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">Pakistan&#39;s foreign ministry on Monday summoned the US embassy&#39;s deputy chief of mission to express concern and disappointment over a last week&#39;s&nbsp;</span><a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/india-news/india-united-states-pm-narendra-modi-joe-biden-pakistan-terrorism-money-laundering-101687580203651.html\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205); font-family: Lato, sans-serif; font-size: 16px;\" target=\"_blank\">joint statement</a><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">&nbsp;by Prime Minister Narendra Modi and US President Joe Biden that called on Islamabad to ensure its territory was not used as a base for terrorist attacks.</span></p>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: medium;\">Alleging that &ldquo;one-sided and misleading&rdquo; references were made in the joint statement, Pakistan&#39;s foreign office said, &ldquo;It was stressed that the United States should refrain from issuing statements that may be construed as an encouragement of India&#39;s baseless and politically motivated narrative against Pakistan.&rdquo;</span></p>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	&ldquo;It was also emphasized that counter-terrorism co-operation between Pakistan and the U.S. had been progressing well and that an enabling environment, centred around trust and understanding, was imperative to further solidifying Pakistan-U.S. ties,&rdquo; it added.</p>\r\n<h2 style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px 0px 10px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(47, 47, 47); font-family: Lato, sans-serif; font-size: 15px;\">\r\n	<a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/india-news/us-president-joe-biden-gifts-pm-modi-a-printed-t-shirt-with-special-message-at-white-house-america-india-us-state-visit-101687546370988.html\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205);\" target=\"_blank\">Biden&#39;s gift to PM Modi: &#39;Future is AI&#39; t-shirt. It&#39;s not what you think it is</a></h2>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	US State Department spokesperson Matt Miller told reporters in a daily news briefing that though Pakistan had taken important steps to counter terrorist groups, Washington advocated for more to be done.</p>', 1, '2023-06-27 03:51:15', '2023-06-27 03:51:15'),
(10, 1, 'blog-79008.png', 'Putin\'s message for Wagner fighters; meets top security officials | Top 10', '<h2 class=\"sortDec\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px 0px 16px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-weight: 400; font-family: Lato, sans-serif; font-size: 16px; line-height: 20px;\">\r\n	Putin addressed the nation in a short video message for the first time after the Wagner Group called off their armed rebellion.</h2>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">Days after the short-lived revolt march by the Wagner Group against Russia&#39;s military leadership that died down on the way to Moscow, President Vladimir Putin addressed the nation in a short speech with just as much vitriol as his last address.</span></p>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: medium;\">Reiterating his &lsquo;traitor&rsquo; remark for the organisers of the armed rebellion, Putin again vowed to bring them &lsquo;to justice&rsquo;. He said the organisers were being played into the hands of Ukraine&#39;s government and its allies.</span></p>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	The insurrection lasted for about 24 hours after mercenary chief Yevgeny Prigozhin on Friday called for an armed rebellion to oust the military leadership.</p>\r\n<h2 style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px 0px 10px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(47, 47, 47); font-family: Lato, sans-serif; font-size: 15px;\">\r\n	Here are the top 10 developments that unfolded in Russia</h2>\r\n<ol style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding-right: 0px; padding-left: 0px; margin: 10px 20px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	<li style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 5px 0px; margin: 0px; list-style: decimal; outline: none; overflow-wrap: break-word;\">\r\n		Despite vowing for bringing the rebel organisers to justice, President Putin called the regular Wagner troops &lsquo;patriots&rsquo;. He said these fighters would be allowed to either join the army, move to Belarus or return home.</li>\r\n	<li style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 5px 0px; margin: 0px; list-style: decimal; outline: none; overflow-wrap: break-word;\">\r\n		According to Kremlin, Putin held a meeting with the country&#39;s top security, law enforcement and military officials along with defence minister Sergei Shoigu. He thanked members of his team for their work over the weekend.</li>\r\n	<li style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 5px 0px; margin: 0px; list-style: decimal; outline: none; overflow-wrap: break-word;\">\r\n		He accused Ukraine and its western allies of wanting Russia to &lsquo;kill each other&rsquo; during the revolt.</li>\r\n	<li style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 5px 0px; margin: 0px; list-style: decimal; outline: none; overflow-wrap: break-word;\">\r\n		Putin also said he had issued order as the rebellion situation unfolded to avoid bloodshed. &quot;From the start of the events, on my orders steps were taken to avoid large-scale bloodshed,&quot; he said.</li>\r\n	<li style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 5px 0px; margin: 0px; list-style: decimal; outline: none; overflow-wrap: break-word;\">\r\n		Putin&#39;s address, which was billed as something that would &lsquo;define the fate of Russia&rsquo;, seem to have failed in yielding groundbreaking developments, according to experts.</li>\r\n	<li style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 5px 0px; margin: 0px; list-style: decimal; outline: none; overflow-wrap: break-word;\">\r\n		&ldquo;The fact that it took place indicates one thing: Putin is acutely dissatisfied with how he looked in this whole story and is trying to correct the situation,&rdquo; former Kremlin speechwriter and political analyst Abbas Gallyamov said in a Facebook post.</li>\r\n	<li style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 5px 0px; margin: 0px; list-style: decimal; outline: none; overflow-wrap: break-word;\">\r\n		In a short audio clip, Prigozhin spoke for the first time since the rebellion was aborted. He said his mercenary group did not march to overthrow the Russian leadership and the motive was to register a protest at the ineffectual conduct of the war in Ukraine.</li>\r\n	<li style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 5px 0px; margin: 0px; list-style: decimal; outline: none; overflow-wrap: break-word;\">\r\n		Senior Russian official briefed reporters in New Delhi about the current situation in his country after the rebellion and said that Putin had a firm grip on power. &ldquo;The current situation in Russia is stable and the contemporary position of President Putin is absolutely stable. You must know the Russian common psychology &ndash; we are united when a danger appears, and I think the situation now is stable,&rdquo; Mikhail Shvydkoy, Russia&rsquo;s special presidential representative for international cultural cooperation, said.</li>\r\n	<li style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 5px 0px; margin: 0px; list-style: decimal; outline: none; overflow-wrap: break-word;\">\r\n		The state-owned news agency Sputnik said the Russian Parliament will work on a bill to regulate the activities of private military companies in the wake of the coup attempt.</li>\r\n	<li style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 5px 0px; margin: 0px; list-style: decimal; outline: none; overflow-wrap: break-word;\">\r\n		After allegations from Russian side, US President Joe Biden clarified that his country and NATO had no involvement in the short-lived insurrection in Russia. &ldquo;We made clear that we were not involved. We had nothing to do with it&hellip;This was part of a struggle within Russian system,&rdquo; he said.</li>\r\n</ol>', 1, '2023-06-27 03:52:02', '2023-06-27 03:52:02'),
(12, 1, 'blog-89152.png', 'Dabboo Ratnani recalls meeting Shah Rukh Khan before his debut: I knew he was going to be a big star', '<h2 class=\"sortDec\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px 0px 16px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-weight: 400; font-family: Lato, sans-serif; font-size: 16px; line-height: 20px;\">\r\n	In an interview with Hindustan Times, ace celebrity photographer Dabboo Ratnani shared fun anecdotes with Shah Rukh Khan, Akshay Kumar and more.</h2>\r\n<p>\r\n	<span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">Having over two decades of experience in the film industry,&nbsp;</span><a href=\"https://www.hindustantimes.com/topic/dabboo-ratnani\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205); font-family: Lato, sans-serif; font-size: 16px;\" target=\"_blank\">Dabboo Ratnani</a><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">&nbsp;has paved the way for film photography. He is a firm believer in making the most out of his hard work and has become a known name for celebrities when it comes to capturing them with the right kind of aesthetics. From Amitabh Bachchan to&nbsp;</span><a href=\"https://www.hindustantimes.com/topic/shah-rukh-khan\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205); font-family: Lato, sans-serif; font-size: 16px;\" target=\"_blank\">Shah Rukh Khan</a><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">&nbsp;to Hrithik Roshan, Dabboo has worked with most A-listers. Talking about what goes behind the scenes, the ace celebrity photographer shared anecdotes with Hindustan Times.</span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<h2 style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px 0px 10px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(47, 47, 47); font-family: Lato, sans-serif; font-size: 15px;\">\r\n	Also read:&nbsp;<a href=\"https://www.hindustantimes.com/entertainment/bollywood/dabboo-ratnani-on-cops-arriving-during-varun-dhawan-shoot-101686677941164.html\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205);\" target=\"_blank\">Dabboo Ratnani interview: Photographer recalls cops arriving during shoot with Varun Dhawan</a></h2>\r\n<h2 style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px 0px 10px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(47, 47, 47); font-family: Lato, sans-serif; font-size: 15px;\">\r\n	How do you know Shah Rukh Khan?</h2>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	<strong style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; position: relative;\">Dabboo Ratnani:</strong>&nbsp;I knew SRK when he came from Delhi to become an actor. We had a common friend. This was even before his debut. I remember making him pose for an outdoor shoot, on the bonnet of my car. From the time I met him, I knew he was going to be a big star. From the kind of intelligence he has and his words, you can tell when the person has it in their eyes.</p>', 1, '2023-06-28 03:47:58', '2023-06-28 03:47:58');
INSERT INTO `blog_list_tbl` (`id`, `user_id`, `photo`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(13, 1, 'blog-65258.png', 'Kajol says female pleasure should be normalised like eating and drinking: ‘It is a very normal part of life’', '<h2 class=\"sortDec\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px 0px 16px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-weight: 400; font-family: Lato, sans-serif; font-size: 16px; line-height: 20px;\">\r\n	Kajol will be next seen in Lust Stories 2. In a new interview, the actor said that female pleasure is a very normal part of life and must be normalised.</h2>\r\n<p>\r\n	<a href=\"https://www.hindustantimes.com/topic/kajol\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205); font-family: Lato, sans-serif; font-size: 16px;\" target=\"_blank\">Kajol</a><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">&nbsp;will be next seen in Lust Stories 2. The actor said in a recent interview during the promotions of the Netflix anthology that the concept of female pleasure should be normalized in the the same way that the society has normalise eating and drinking. (Also read:&nbsp;</span><a href=\"https://www.hindustantimes.com/entertainment/bollywood/kajol-on-lust-stories-2-emoting-lust-101687496895028.html\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205); font-family: Lato, sans-serif; font-size: 16px;\" target=\"_blank\">Kajol says she has always struggled to emote lust on screen: &#39;There are two things I don&#39;t have - sexy and sharam&#39;</a><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">)</span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<h3 style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px 0px 10px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(47, 47, 47); font-family: Lato, sans-serif; font-size: 14px;\">\r\n	About Lust Stories 2</h3>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	In Lust Stories 2, Kajol stars in one of the segments directed by Badhaai Ho maker Amit R. Sharma. The segment also stars actor Kumud Mishra who plays her husband. Earlier the My Name is Khan actor had candidly revealed that she has always struggled with emoting lust on screen.</p>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	<span style=\"font-size: 16px;\">Now in a new interview with Filmfare, when Kajol was asked about the normalising the portrayal of female pleasure on screen, the actor said, &quot;At one point in time as a society, we were very open about it. It was part of our ancient texts and our education. We later closed ourselves off from it. But at the end of the day, it is a very normal part of life that we cannot do without. I think it needs to be normalised the same way that we&#39;ve normalised eating and drinking. It&#39;s really a question of making it a part of the conversation rather than closing it off. Trying not to talk about it gives it all the more attention and focus.&quot;</span></p>', 1, '2023-06-28 03:49:29', '2023-06-28 03:49:29'),
(14, 1, 'blog-47708.png', 'Suhana Khan, Khushi Kapoor, Agastya Nanda, Vedant Raina attend their The Archies co-star Mihir Ahuja birthday bash', '<h2 class=\"sortDec\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px 0px 16px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-weight: 400; font-family: Lato, sans-serif; font-size: 16px; line-height: 20px;\">\r\n	The Archies, directed by Zoya Akhtar, will stream on Netflix. The film is billed as a coming-of-age story that will introduce the teenagers of Riverdale.</h2>\r\n<p>\r\n	<a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/topic/suhana-khan\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205); font-family: Lato, sans-serif; font-size: 16px;\" target=\"_blank\">Suhana Khan</a><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">, Khushi Kapoor, Agastya Nanda and Vedant Raina attended the birthday party of their The Archies co-star Mihir Ahuja at a restaurant in Mumbai. Taking to Instagram, a paparazzo account on Tuesday night posted several clips in which they were seen making their way inside the restaurant in the evening. (Also Read |&nbsp;</span><a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/entertainment/bollywood/zoya-akhtar-advice-to-suhana-khan-on-nepotism-criticism-101687325090524.html\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205); font-family: Lato, sans-serif; font-size: 16px;\" target=\"_blank\">Zoya Akhtar reveals her advice to The Archies kids amid nepotism debate</a><span style=\"color: rgb(66, 66, 66); font-family: Lato, sans-serif; font-size: 16px;\">)</span></p>\r\n<p>\r\n	<span style=\"color: rgb(47, 47, 47); font-family: Lato, sans-serif; font-size: 15px;\">The Archies cast celebrate Mihir&#39;s birthday</span></p>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	Suhana Khan arrived at the restaurant in her car and was taken inside by Mihir. For the party, Suhana wore a striped blue dress and black heels. She also carried a blue bag. Mihir opted for a black shirt and matching pants. He also smiled and posed for the paparazzi stationed outside the venue.</p>\r\n<p style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 8px 0px; margin: 0px; list-style-type: none; outline: none; overflow-wrap: break-word; color: rgb(66, 66, 66); font-size: medium; line-height: 22px; font-family: Lato, sans-serif;\">\r\n	<span style=\"font-size: 16px;\">Vedant and&nbsp;</span><a class=\"manualbacklink\" href=\"https://www.hindustantimes.com/topic/khushi-kapoor\" style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; list-style-type: none; outline: none; text-decoration-line: none; overflow-wrap: break-word; color: rgb(0, 177, 205); font-size: 16px;\" target=\"_blank\">Khushi Kapoor</a><span style=\"font-size: 16px;\">&nbsp;arrived at the bash together. They smiled as they walked inside the venue. Khushi wore a printed floral green dress and flats while Vedang opted for a colourful shirt, denims and sneakers.</span></p>', 1, '2023-06-28 03:51:27', '2023-07-03 04:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles_table`
--

CREATE TABLE `roles_table` (
  `id` int(11) NOT NULL,
  `Type` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles_table`
--

INSERT INTO `roles_table` (`id`, `Type`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `email_verify` int(11) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT current_timestamp(),
  `phone` bigint(20) DEFAULT NULL,
  `phone_verify` int(11) NOT NULL DEFAULT 0,
  `phone_verified_at` timestamp NULL DEFAULT current_timestamp(),
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_role_id`, `photo`, `name`, `email`, `email_verify`, `email_verified_at`, `phone`, `phone_verify`, `phone_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 2, 'users-52588.png', 'Bidyut Mandal', 'mondalbidyut38@gmail.com', 0, '2023-06-23 12:19:27', 1234567892, 0, '2023-06-23 12:19:27', '$2y$10$HGEMGprZbqj9fCpWM3Nq9elpJLZxlEPGaOh0gyl.6l/aPEqBF5K5O', NULL, '2023-06-23 12:19:27', '2023-06-27 08:22:24'),
(2, 2, NULL, 'bidyut', 'dfsf@gmail.com', 0, '2023-06-25 01:54:41', 1234567891, 0, '2023-06-25 01:54:41', '123456789', NULL, '2023-06-25 01:54:41', '2023-06-25 01:54:41'),
(4, 2, NULL, 'Bidyut Mandal', 'mondalbidyut398@gmail.com', 0, '2023-06-25 02:00:19', 987654321, 0, '2023-06-25 02:00:19', '$2y$10$uuaBf.bfIhhqZ6PMR/2MGex/rbd2u8rmrkgjh44KicEzMd0KtMJWe', NULL, '2023-06-25 02:00:19', '2023-06-25 02:00:19'),
(37, 2, NULL, 'Bidyut Mandal', 'bidyutpolosoft38@gmail.com', 0, '2023-06-25 04:51:39', 1234567888, 0, '2023-06-25 04:51:39', '$2y$10$2EhmP45R0ikYxN1TVhHX1uvmmpNVsfaYmfHRCdHyNF4lfu.aIZvCG', NULL, '2023-06-25 04:51:39', '2023-06-25 04:51:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_list_tbl`
--
ALTER TABLE `blog_list_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles_table`
--
ALTER TABLE `roles_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Type` (`Type`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_list_tbl`
--
ALTER TABLE `blog_list_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles_table`
--
ALTER TABLE `roles_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
