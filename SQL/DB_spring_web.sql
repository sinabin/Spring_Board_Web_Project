CREATE DATABASE IF NOT EXISTS `spring_web` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `spring_web`;

CREATE TABLE IF NOT EXISTS `tbl_board` (
  `bno` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text DEFAULT '',
  `user_id` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL DEFAULT '자유게시판',
  `board_reg_date` timestamp NULL DEFAULT current_timestamp(),
  `view_cnt` int(11) DEFAULT 0,
  PRIMARY KEY (`bno`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tbl_board_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT IGNORE INTO `tbl_board` (`bno`, `title`, `content`, `user_id`, `category`, `board_reg_date`, `view_cnt`) VALUES
	(1, '공지사항', '<p style="user-select: auto;">사내 공지사항입니다.</p><p style="user-select: auto;">.....................</p>', 'userTester', '공지사항', '2022-02-20 01:14:01', 14),
	(2, '자유게시판', '<p style="user-select: auto;">자유게시판입니다.<br style="user-select: auto;"></p>', 'adminTester', '자유게시판', '2022-02-20 01:37:09', 3),
	(3, '제품 Q&A 게시판', '<p style="user-select: auto;">제품 Q&amp;A 게시판입니다.<br style="user-select: auto;"></p>', 'adminTester', '제품 Q&A', '2022-02-20 01:37:24', 2),
	(4, '개인정보보호 및 관리 토론 게시판', '<p style="user-select: auto;">개인정보보호 및 관리 토론 게시판입니다.<br style="user-select: auto;"></p>', 'adminTester', '개인정보보호 및 관리 토론', '2022-02-20 01:37:40', 4);

-- 테이블 spring_web.tbl_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `user_id` varchar(50) NOT NULL,
  `user_pw` varchar(50) NOT NULL,
  `user_nick` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_reg_date` timestamp NULL DEFAULT curdate(),
  `user_grade` varchar(50) DEFAULT '일반계정',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT IGNORE INTO `tbl_user` (`user_id`, `user_pw`, `user_nick`, `user_email`, `user_reg_date`, `user_grade`) VALUES
	('adminTester', '03d75d44cb444543d641283fb2adb5ce', 'admin', 'admin@naver.com', '2022-02-20 00:00:00', '관리자계정'),
	('userTester', '03d75d44cb444543d641283fb2adb5ce', '일반유저', 'user@naver.com', '2022-02-20 00:00:00', '일반계정'),
	('userTwo', '03d75d44cb444543d641283fb2adb5ce', 'qwer1234!', 'userTwo@naver.com', '2022-02-20 00:00:00', '일반계정');
