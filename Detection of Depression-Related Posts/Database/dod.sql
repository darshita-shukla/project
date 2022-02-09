-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 19, 2019 at 07:42 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dod`
--
CREATE DATABASE IF NOT EXISTS `dod` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dod`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add user register_ model', 7, 'add_userregister_model'),
(20, 'Can change user register_ model', 7, 'change_userregister_model'),
(21, 'Can delete user register_ model', 7, 'delete_userregister_model'),
(22, 'Can add upload message_ model', 8, 'add_uploadmessage_model'),
(23, 'Can change upload message_ model', 8, 'change_uploadmessage_model'),
(24, 'Can delete upload message_ model', 8, 'delete_uploadmessage_model'),
(25, 'Can add user feedback_ model', 9, 'add_userfeedback_model'),
(26, 'Can change user feedback_ model', 9, 'change_userfeedback_model'),
(27, 'Can delete user feedback_ model', 9, 'delete_userfeedback_model');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(8, 'user', 'uploadmessage_model'),
(9, 'user', 'userfeedback_model'),
(7, 'user', 'userregister_model');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-04-10 06:51:44.568203'),
(2, 'auth', '0001_initial', '2019-04-10 06:51:56.034023'),
(3, 'admin', '0001_initial', '2019-04-10 06:51:58.454921'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-04-10 06:51:58.487148'),
(5, 'contenttypes', '0002_remove_content_type_name', '2019-04-10 06:51:59.347500'),
(6, 'auth', '0002_alter_permission_name_max_length', '2019-04-10 06:51:59.795742'),
(7, 'auth', '0003_alter_user_email_max_length', '2019-04-10 06:52:00.509609'),
(8, 'auth', '0004_alter_user_username_opts', '2019-04-10 06:52:00.542812'),
(9, 'auth', '0005_alter_user_last_login_null', '2019-04-10 06:52:01.279140'),
(10, 'auth', '0006_require_contenttypes_0002', '2019-04-10 06:52:01.300625'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2019-04-10 06:52:01.333828'),
(12, 'auth', '0008_alter_user_username_max_length', '2019-04-10 06:52:01.878750'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2019-04-10 06:52:02.408046'),
(14, 'sessions', '0001_initial', '2019-04-10 06:52:03.569179'),
(15, 'user', '0001_initial', '2019-04-10 06:59:45.601406'),
(16, 'user', '0002_remove_userregister_model_confirmpassword', '2019-04-10 07:26:04.491054'),
(17, 'user', '0003_uploadmessage_model', '2019-04-12 09:27:27.140625'),
(18, 'user', '0004_userfeedback_model', '2019-04-19 05:22:40.906250');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('284fq8x9j9l6hdipjifgkw814iekfk2k', 'ZDk0NzFjNTNlZGRkYjI0OWFlNTRiNzY4ZDNiZTU5NTNiNjJjMmVjZTp7Im5hbWUiOjF9', '2019-04-27 09:31:53.169921'),
('8ojpchq0smnnpmc3ih7x6xyuosopg14k', 'ZDk0NzFjNTNlZGRkYjI0OWFlNTRiNzY4ZDNiZTU5NTNiNjJjMmVjZTp7Im5hbWUiOjF9', '2019-04-29 05:05:31.135742'),
('8uh7kpdiemb1n5ecobq7oeq5g7q3qvdp', 'ZDk0NzFjNTNlZGRkYjI0OWFlNTRiNzY4ZDNiZTU5NTNiNjJjMmVjZTp7Im5hbWUiOjF9', '2019-04-29 10:13:51.511718'),
('h5aq7f6241xfnb10h0e36sym7mic87ms', 'ZDk0NzFjNTNlZGRkYjI0OWFlNTRiNzY4ZDNiZTU5NTNiNjJjMmVjZTp7Im5hbWUiOjF9', '2019-05-03 06:01:40.000976'),
('kf8ief4aipd0r6pnfcbnirooxi81tt63', 'ZDk0NzFjNTNlZGRkYjI0OWFlNTRiNzY4ZDNiZTU5NTNiNjJjMmVjZTp7Im5hbWUiOjF9', '2019-04-29 07:28:55.674804'),
('mnwbzige7hqlifm5pxe9av56v7e4vosz', 'ZDk0NzFjNTNlZGRkYjI0OWFlNTRiNzY4ZDNiZTU5NTNiNjJjMmVjZTp7Im5hbWUiOjF9', '2019-04-26 05:41:47.542687'),
('ozbyybqkuar0fhbetcevou6a5znytw93', 'ZDk0NzFjNTNlZGRkYjI0OWFlNTRiNzY4ZDNiZTU5NTNiNjJjMmVjZTp7Im5hbWUiOjF9', '2019-04-25 06:39:38.438296'),
('p3wf8fo4wyt98efb2zbmkxxqy2v4sogs', 'MmNmNmM3NWQ0NjlmOGRlYTljOTM1M2ZmYjQ1NDI4ZTBkZjczZGFjZjp7Im5hbWUiOjV9', '2019-05-03 07:29:28.005859'),
('qzlbvvm4z0866q1ogdjele45l0o3fsnt', 'ZDk0NzFjNTNlZGRkYjI0OWFlNTRiNzY4ZDNiZTU5NTNiNjJjMmVjZTp7Im5hbWUiOjF9', '2019-04-25 12:05:24.036132'),
('sdwn1waklt2hzbqmma4u09k88eokmlcb', 'ZDk0NzFjNTNlZGRkYjI0OWFlNTRiNzY4ZDNiZTU5NTNiNjJjMmVjZTp7Im5hbWUiOjF9', '2019-05-03 06:11:04.908203');

-- --------------------------------------------------------

--
-- Table structure for table `user_uploadmessage_model`
--

CREATE TABLE IF NOT EXISTS `user_uploadmessage_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(500) NOT NULL,
  `topics` varchar(300) NOT NULL,
  `sentiment` varchar(300) NOT NULL,
  `userId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_uploadmessage_m_userId_id_3e1d5f5f_fk_user_user` (`userId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `user_uploadmessage_model`
--

INSERT INTO `user_uploadmessage_model` (`id`, `message`, `topics`, `sentiment`, `userId_id`) VALUES
(1, 'depress', 'indicative Posts', 'default', 1),
(2, 'my boss is super, but my mine unhappy', 'Job', 'default', 1),
(3, 'my boss is super, but my mine unhappy', 'Job', 'default', 1),
(4, ' i know  i was listenin to bad habit earlier and i started freakin at his part', 'Tired', 'default', 1),
(5, 'Layin n bed with a headache  ughhhh...waitin on your call...', 'indicative Posts', 'default', 1),
(6, 'Funeral ceremony...gloomy friday...', 'indicative Posts', 'default', 1),
(7, 'wants to hang out with friends SOON!', 'indicative Posts', 'default', 1),
(8, 'dannycastillo We want to trade with someone who has Houston tickets, but no one will.', 'Job', 'default', 1),
(9, 'Re-pinging ghostridah14: why didn''t you go to prom? BC my bf didn''t like my friends', 'indicative Posts', 'default', 1),
(10, 'I should be sleep, but im not! thinking about an old friend who I want. but he''s married now. damn, ', 'indicative Posts', 'default', 1),
(11, 'he wants me 2! scandalous!', 'indicative Posts', 'default', 1),
(12, 'charviray Charlene my love. I miss you', 'Broke', 'default', 1),
(13, 'kelcouch I''m sorry  at least it''s Friday?', 'indicative Posts', 'default', 1),
(14, 'cant fall asleep', 'Tired', 'default', 1),
(15, 'Choked on her retainers', 'indicative Posts', 'default', 1),
(16, 'Ugh! I have to beat this stupid song to get to the next  rude!', 'Free', 'default', 1),
(17, 'BrodyJenner if u watch the hills in london u will realise what tourture it is because were weeks and ', 'indicative Posts', 'default', 1),
(18, 'weeks late  i just watch itonlinelol', 'indicative Posts', 'default', 1),
(19, 'The storm is here and the electricity is gone', 'indicative Posts', 'default', 1),
(20, 'annarosekerr agreed', 'indicative Posts', 'default', 1),
(21, 'So sleepy again and it''s not even that late. I fail once again.', 'indicative Posts', 'default', 1),
(22, 'PerezHilton lady gaga tweeted about not being impressed by her video leaking just so you know', 'indicative Posts', 'default', 1),
(23, ' i know  i was listenin to bad habit earlier and i started freakin at his part', 'Tired', 'default', 1),
(24, 'How are YOU convinced that I have always wanted you? What signals did I give off...damn I think I just lost another friend', 'Tired', 'default', 1),
(25, 'Wondering why I''m awake at 7am,writing a new song,plotting my evil secret plots muahahaha...oh damn it,not secret anymore', 'Free', 'default', 1),
(26, 'I ate Something I don''t know what it is... Why do I keep Telling things about food', 'indicative Posts', 'default', 1),
(27, 'so tired and i think i''m definitely going to get an ear infection.  going to bed &quot;early&quot; for once.', 'Tired', 'default', 1),
(28, 'IsaacMascote  i''m sorry people are so rude to you, isaac, they should get some manners and know better than to be so lewd!', 'Depression', 'default', 1),
(29, 'Fudge.... Just BS''d that whole paper.... So tired.... Ugh I hate school.....  time to sleep!!!!!!!!!!!', 'indicative Posts', 'default', 1),
(30, 'I HATE CANCER. I HATE IT I HATE IT I HATE IT.', 'indicative Posts', 'default', 1),
(31, 'It is so annoying when she starts typing on her computer in the middle of the night!', 'indicative Posts', 'default', 1),
(32, 'cynthia_123 i cant sleep', 'Tired', 'default', 1),
(33, 'I missed the bl***y bus!!!!!!!!', 'indicative Posts', 'default', 1),
(34, 'feels strong contractions but wants to go out.  http://plurk.com/p/wxidk', 'indicative Posts', 'default', 1),
(35, 'SoCal!  stoked. or maybe not.. tomorrow', 'indicative Posts', 'default', 1),
(36, 'It is so annoying when she starts typing on her computer in the middle of the night!', 'indicative Posts', 'default', 1),
(37, 'cynthia_123 i cant sleep', 'Tired', 'default', 1),
(38, 'I missed the bl***y bus!!!!!!!!', 'indicative Posts', 'default', 1),
(39, 'feels strong contractions but wants to go out.', 'indicative Posts', 'default', 1),
(40, 'SoCal!  stoked. or maybe not.. tomorrow', 'indicative Posts', 'default', 1),
(41, 'Screw you davidbrussee! I only have 3 weeks...', 'indicative Posts', 'default', 1),
(42, 'ether_radio yeah :S i feel all funny cause i haven''t slept enough  i woke my mum up cause i was singing she''s not impressed :S you?', 'Standard Posts', 'default', 1),
(43, 'I need skott right now', 'Standard Posts', 'default', 1),
(44, 'has work this afternoon', 'Job', 'default', 1),
(45, 'GABBYiSACTiVE Aw you would not unfollow me would you? Then I would cry', 'indicative Posts', 'default', 1),
(46, 'mmm much better day... so far! it''s still quite early. last day of uds', 'Depression', 'default', 1),
(47, 'DavidArchie &lt;3 your gonna be the first  twitter ;) cause your amazing lol. come to canada  would do anything to see you perform', 'indicative Posts', 'default', 1),
(48, 'Why do I have the feeling I should be packing and hitting for SFO around this time of the year? I think I''m missing something...', 'indicative Posts', 'default', 1),
(49, 'Bed!!!!!... its time,..... hope i go to school tomorrow, all though i don''t feel very well right now', 'indicative Posts', 'default', 1),
(50, 'onscrn Ahh.  ... Well, I was hoping that I could learn some stuff on the way. ... Why not you and I work on separate things but also', 'Job', 'default', 1),
(51, 'I''m having a problem with my photo here in twitter amf!!!...can''t see my face!', 'indicative Posts', 'default', 1),
(52, 'jakeboyd, oh noooo!  if i blow a tire you''re reaaaally going to have to send up some batman smoke.', 'indicative Posts', 'default', 1),
(53, 'wnna take a bath!!!!', 'indicative Posts', 'default', 1),
(54, 'Chocolate milk is so much better through a straw. I lack said straw', 'Depression', 'default', 1),
(56, 'I am a logical person', 'Standard Posts', 'default', 1),
(57, 'why am i so tired?', 'Standard Posts', 'default', 1),
(58, 'djmic damn hey yu lil fucker i text d yu', 'Free', 'default', 1),
(59, 'Mennard time diff and i''ve just been wrapped up in day to day stuff so i havent been tweeting. talk soon,must sleep...up in 6hrs', 'indicative Posts', 'default', 1),
(60, 'benballer  no way! damn that sucks B!  are you ok?', 'Depression-Indicative Posts', 'default', 1),
(61, 'sucks not being able to take days off of work or have the money to take the trip  so sad', 'Job', 'default', 1),
(62, 'they told me, i will prob get it to', 'indicative Posts', 'default', 1),
(63, 'ramtops the recession. her hotel are restructuring how the accounts are done. adds a bit more pressure in the short term but we''ll cope', 'indicative Posts', 'default', 1),
(64, 'maternitytees Aww  Onward and upwards now, yay! Still sad to leave I bet.', 'indicative Posts', 'default', 1),
(65, 'itsgabbith at once haha.  poor aby still gets sore!', 'indicative Posts', 'default', 1),
(66, 'diesel yaris... 70mpg  so sad its not available in the US. That''d be awesome.', 'Standard Posts', 'default', 1),
(67, 'I want to buy this great album but unfortunately i dont hav enuff funds  its &quot;long time noisy&quot;', 'Job', 'default', 1),
(68, 'Pokinatcha  in all honesty...pain   blech.', 'Depression', 'default', 1),
(69, 'Ok ... the passengers ... no one is alive ... they''re all dead ... you just don''t know it til the end ... then you cry ...', 'indicative Posts', 'default', 1),
(70, 'At home alone with not much to do', 'indicative Posts', 'default', 1),
(71, 'DavidCookLove ia so much! i haven''t really been happy with any of cooks choices for singles.', 'indicative Posts', 'default', 1),
(72, 'vincew stefanyngo  i fell asleep on the beach and didn''t put on enough sunscreen  lol', 'Standard Posts', 'default', 1),
(73, 'So i think my son might have the flu cause I def. just cleaned up a stanky puke mess  Poor pumkpin', 'indicative Posts', 'default', 1),
(74, 'So great to see Oin &amp; Cynthia.  So happy.  Dinner was great, cute little place.  Too bad Oin got sick afterwards.', 'indicative Posts', 'default', 1),
(75, 'I cant give jertronic any bday nudges.', 'Tired', 'default', 1),
(76, 'and all woman who transfer their first impressions (sexual/maternal) onto a less ''threatening'' man ', 'indicative Posts', 'default', 1),
(77, '', 'indicative Posts', 'default', 1),
(78, '', 'indicative Posts', 'default', 1),
(79, 'My children have promised me birthday brekkie in bed. There''s a problem with that in that there''s bugger all food in the house', 'Free', 'default', 5),
(80, 'Omg going to die of swine flu when I go to Melbourne', 'Depression', 'default', 5),
(81, 'iam very tried, im so depressed, im going to sleep', 'indicative Posts', 'default', 5),
(82, 'this is best date, i have ever seen just chill, so care from , full of support behind friends\r\n', 'Friends', 'default', 5);

-- --------------------------------------------------------

--
-- Table structure for table `user_userfeedback_model`
--

CREATE TABLE IF NOT EXISTS `user_userfeedback_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `mobilenumber` varchar(100) NOT NULL,
  `feedback` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user_userfeedback_model`
--

INSERT INTO `user_userfeedback_model` (`id`, `name`, `mobilenumber`, `feedback`) VALUES
(1, 'venkat', '8566554545', 'its nicce\r\n'),
(2, 'mohit', '98786756767', 'its nice to user \r\n');

-- --------------------------------------------------------

--
-- Table structure for table `user_userregister_model`
--

CREATE TABLE IF NOT EXISTS `user_userregister_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Phone` int(11) NOT NULL,
  `question` varchar(1) NOT NULL,
  `answer` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user_userregister_model`
--

INSERT INTO `user_userregister_model` (`id`, `firstname`, `lastname`, `password`, `gender`, `email`, `Phone`, `question`, `answer`) VALUES
(1, 'Venkat', 'sabari', 'sunmusic', 'm', 'venkat@gmail.com', 2147483647, 'W', 'jonny'),
(5, 'mohit', 'kumar', 'detect12345', 'm', 'mohit@gmail.com', 2147483647, 'W', 'jonny');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `user_uploadmessage_model`
--
ALTER TABLE `user_uploadmessage_model`
  ADD CONSTRAINT `user_uploadmessage_m_userId_id_3e1d5f5f_fk_user_user` FOREIGN KEY (`userId_id`) REFERENCES `user_userregister_model` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
