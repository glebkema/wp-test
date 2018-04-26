-- phpMyAdmin SQL Dump

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------

--
-- Table structure for table `wptest_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wptest_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wptest_comments`
--

CREATE TABLE IF NOT EXISTS `wptest_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wptest_comments`
--

INSERT INTO `wptest_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Автор комментария', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-04-24 07:16:11', '2018-04-24 07:16:11', 'Привет! Это комментарий.\nЧтобы начать модерировать, редактировать и удалять комментарии, перейдите на экран «Комментарии» в консоли.\nАватары авторов комментариев загружаются с сервиса <a href="https://ru.gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wptest_itsec_lockouts`
--

CREATE TABLE IF NOT EXISTS `wptest_itsec_lockouts` (
  `lockout_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lockout_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `lockout_start` datetime NOT NULL,
  `lockout_start_gmt` datetime NOT NULL,
  `lockout_expire` datetime NOT NULL,
  `lockout_expire_gmt` datetime NOT NULL,
  `lockout_host` varchar(40) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `lockout_user` bigint(20) unsigned DEFAULT NULL,
  `lockout_username` varchar(60) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `lockout_active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`lockout_id`),
  KEY `lockout_expire_gmt` (`lockout_expire_gmt`),
  KEY `lockout_host` (`lockout_host`),
  KEY `lockout_user` (`lockout_user`),
  KEY `lockout_username` (`lockout_username`),
  KEY `lockout_active` (`lockout_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wptest_itsec_logs`
--

CREATE TABLE IF NOT EXISTS `wptest_itsec_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `code` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'notice',
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `init_timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `memory_current` bigint(20) unsigned NOT NULL DEFAULT '0',
  `memory_peak` bigint(20) unsigned NOT NULL DEFAULT '0',
  `url` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `blog_id` bigint(20) NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `remote_ip` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `module` (`module`),
  KEY `code` (`code`),
  KEY `type` (`type`),
  KEY `timestamp` (`timestamp`),
  KEY `user_id` (`user_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wptest_itsec_temp`
--

CREATE TABLE IF NOT EXISTS `wptest_itsec_temp` (
  `temp_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `temp_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `temp_date` datetime NOT NULL,
  `temp_date_gmt` datetime NOT NULL,
  `temp_host` varchar(40) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `temp_user` bigint(20) unsigned DEFAULT NULL,
  `temp_username` varchar(60) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`temp_id`),
  KEY `temp_date_gmt` (`temp_date_gmt`),
  KEY `temp_host` (`temp_host`),
  KEY `temp_user` (`temp_user`),
  KEY `temp_username` (`temp_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wptest_links`
--

CREATE TABLE IF NOT EXISTS `wptest_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wptest_options`
--

CREATE TABLE IF NOT EXISTS `wptest_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=278 ;

--
-- Dumping data for table `wptest_options`
--

INSERT INTO `wptest_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://wp-test.glebkema.ru', 'yes'),
(2, 'home', 'http://wp-test.glebkema.ru', 'yes'),
(3, 'blogname', 'WP Test', 'yes'),
(4, 'blogdescription', 'Test task for the vacancy.', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'gleb.kemarsky@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'closed', 'yes'),
(20, 'default_ping_status', 'closed', 'yes'),
(21, 'default_pingback_flag', '', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'd.m.Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'd.m.Y H:i', 'yes'),
(26, 'comment_moderation', '', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:105:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:32:"news/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:42:"news/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:62:"news/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"news/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"news/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"news/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:21:"news/([^/]+)/embed/?$";s:37:"index.php?news=$matches[1]&embed=true";s:25:"news/([^/]+)/trackback/?$";s:31:"index.php?news=$matches[1]&tb=1";s:33:"news/([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?news=$matches[1]&paged=$matches[2]";s:40:"news/([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?news=$matches[1]&cpage=$matches[2]";s:29:"news/([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?news=$matches[1]&page=$matches[2]";s:21:"news/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:31:"news/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:51:"news/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:46:"news/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:46:"news/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:27:"news/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:38:"index.php?&page_id=2&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:4:{i:0;s:41:"better-wp-security/better-wp-security.php";i:1;s:43:"custom-post-type-ui/custom-post-type-ui.php";i:2;s:22:"cyr3lat/cyr-to-lat.php";i:3;s:33:"disable-emojis/disable-emojis.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '3', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'test', 'yes'),
(41, 'stylesheet', 'test-child', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'gravatar_default', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:2:{s:27:"wp-super-cache/wp-cache.php";s:22:"wpsupercache_uninstall";s:41:"better-wp-security/better-wp-security.php";a:2:{i:0;s:10:"ITSEC_Core";i:1;s:16:"handle_uninstall";}}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '20', 'yes'),
(84, 'page_on_front', '2', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '38590', 'yes'),
(92, 'wptest_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'fresh_site', '0', 'yes'),
(94, 'WPLANG', 'ru_RU', 'yes'),
(95, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'sidebars_widgets', 'a:9:{s:19:"wp_inactive_widgets";a:1:{i:0;s:13:"custom_html-3";}s:23:"header-sidebar-contacts";a:1:{i:0;s:13:"custom_html-2";}s:21:"header-sidebar-search";a:1:{i:0;s:8:"search-2";}s:19:"aside-sidebar-about";a:1:{i:0;s:13:"custom_html-4";}s:20:"aside-sidebar-bottom";a:0:{}s:18:"main-sidebar-aside";a:0:{}s:21:"footer-sidebar-center";a:1:{i:0;s:13:"custom_html-5";}s:20:"footer-sidebar-right";a:1:{i:0;s:13:"custom_html-6";}s:13:"array_version";i:3;}', 'yes'),
(101, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_custom_html', 'a:6:{i:2;a:2:{s:5:"title";s:0:"";s:7:"content";s:60:"[test_phone class="header-phone"]+380 689 89 90[/test_phone]";}i:3;a:2:{s:5:"title";s:9:"О нас";s:7:"content";s:399:"Отмечается, что туристы могли выбирать любой из&nbsp;20&nbsp;аэропортов, в&nbsp;которые летает авиакомпания. Другим условием стало&nbsp;то, что они должны были достигнуть согласия до&nbsp;того, как самолет приземлится в&nbsp;Финиксе.";}i:4;a:2:{s:5:"title";s:9:"О нас";s:7:"content";s:399:"Отмечается, что туристы могли выбирать любой из&nbsp;20&nbsp;аэропортов, в&nbsp;которые летает авиакомпания. Другим условием стало&nbsp;то, что они должны были достигнуть согласия до&nbsp;того, как самолет приземлится в&nbsp;Финиксе.";}i:5;a:2:{s:5:"title";s:0:"";s:7:"content";s:12:"[test_hello]";}i:6;a:2:{s:5:"title";s:0:"";s:7:"content";s:105:"[test_hello color="orange"]orange[/test_hello]\r\n[test_hello color="time"]any time of the day[/test_hello]";}s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'cron', 'a:9:{i:1524731614;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1524750698;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1524766615;a:1:{s:15:"itsec_cron_test";a:1:{s:32:"cada0dcd81cf9ab21b08b95880909738";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:1524766615;}}}}i:1524774825;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1524802755;a:1:{s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1524803914;a:1:{s:10:"itsec_cron";a:1:{s:32:"7a0fd5d064c59cf40c3df9ad0bb6e63d";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:1:{i:0;s:11:"clear-locks";}s:8:"interval";i:86400;}}}i:1524804514;a:1:{s:10:"itsec_cron";a:1:{s:32:"aa768a35ceed34e467f270ebdc5d82f4";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:1:{i:0;s:14:"purge-lockouts";}s:8:"interval";i:86400;}}}i:1524804934;a:1:{s:10:"itsec_cron";a:1:{s:32:"3ec3d6914daf50bcdb5e5b065213e29b";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:1:{i:0;s:17:"purge-log-entries";}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(110, 'theme_mods_twentyseventeen', 'a:2:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1524551154;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(143, 'can_compress_scripts', '1', 'no'),
(276, '_site_transient_timeout_theme_roots', '1524722217', 'no'),
(277, '_site_transient_theme_roots', 'a:5:{s:10:"test-child";s:7:"/themes";s:4:"test";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:15:"twentyseventeen";s:7:"/themes";s:13:"twentysixteen";s:7:"/themes";}', 'no'),
(163, '_transient_plugin_slugs', 'a:6:{i:0;s:19:"akismet/akismet.php";i:1;s:43:"custom-post-type-ui/custom-post-type-ui.php";i:2;s:22:"cyr3lat/cyr-to-lat.php";i:3;s:33:"disable-emojis/disable-emojis.php";i:4;s:41:"better-wp-security/better-wp-security.php";i:5;s:27:"wp-super-cache/wp-cache.php";}', 'no'),
(129, 'recently_activated', 'a:1:{s:27:"wp-super-cache/wp-cache.php";i:1524543651;}', 'yes'),
(130, 'ossdl_off_cdn_url', 'http://wp-test.glebkema.ru', 'yes'),
(131, 'ossdl_off_blog_url', 'http://wp-test.glebkema.ru', 'yes'),
(132, 'ossdl_off_include_dirs', 'wp-content,wp-includes', 'yes'),
(133, 'ossdl_off_exclude', '.php', 'yes'),
(134, 'ossdl_cname', '', 'yes'),
(135, 'wpsupercache_start', '1509568430', 'yes'),
(136, 'wpsupercache_count', '0', 'yes'),
(162, '_transient_timeout_plugin_slugs', '1524807044', 'no'),
(138, 'wpsupercache_gc_time', '1524543586', 'yes'),
(172, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/ru_RU/wordpress-4.9.5.zip";s:6:"locale";s:5:"ru_RU";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/ru_RU/wordpress-4.9.5.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.9.5";s:7:"version";s:5:"4.9.5";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.7";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1524720416;s:15:"version_checked";s:5:"4.9.5";s:12:"translations";a:0:{}}', 'no'),
(213, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1524720418;s:7:"checked";a:5:{s:10:"test-child";s:5:"0.0.1";s:4:"test";s:5:"0.5.0";s:13:"twentyfifteen";s:3:"1.9";s:15:"twentyseventeen";s:3:"1.5";s:13:"twentysixteen";s:3:"1.4";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'no'),
(215, 'current_theme', 'Test Child Theme', 'yes'),
(216, 'theme_mods_wp-test-child', 'a:4:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1524560436;s:4:"data";a:5:{s:19:"wp_inactive_widgets";a:0:{}s:23:"header-sidebar-contacts";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:19:"footer-sidebar-left";a:0:{}s:21:"footer-sidebar-center";a:0:{}s:20:"footer-sidebar-right";a:0:{}}}}', 'yes'),
(217, 'theme_switched', '', 'yes'),
(141, '_site_transient_timeout_browser_efc56fe28520bcd166ef136f44025003', '1525148333', 'no'),
(142, '_site_transient_browser_efc56fe28520bcd166ef136f44025003', 'a:10:{s:4:"name";s:6:"Chrome";s:7:"version";s:13:"65.0.3325.181";s:8:"platform";s:7:"Windows";s:10:"update_url";s:29:"https://www.google.com/chrome";s:7:"img_src";s:43:"http://s.w.org/images/browsers/chrome.png?1";s:11:"img_src_ssl";s:44:"https://s.w.org/images/browsers/chrome.png?1";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}', 'no'),
(262, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1524720418;s:7:"checked";a:6:{s:19:"akismet/akismet.php";s:5:"4.0.3";s:43:"custom-post-type-ui/custom-post-type-ui.php";s:5:"1.5.8";s:22:"cyr3lat/cyr-to-lat.php";s:3:"3.5";s:33:"disable-emojis/disable-emojis.php";s:3:"1.7";s:41:"better-wp-security/better-wp-security.php";s:5:"6.9.2";s:27:"wp-super-cache/wp-cache.php";s:5:"1.5.9";}s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:6:{s:19:"akismet/akismet.php";O:8:"stdClass":9:{s:2:"id";s:21:"w.org/plugins/akismet";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"4.0.3";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.4.0.3.zip";s:5:"icons";a:2:{s:2:"2x";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";s:2:"1x";s:59:"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272";}s:7:"banners";a:1:{s:2:"1x";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";}s:11:"banners_rtl";a:0:{}}s:43:"custom-post-type-ui/custom-post-type-ui.php";O:8:"stdClass":9:{s:2:"id";s:33:"w.org/plugins/custom-post-type-ui";s:4:"slug";s:19:"custom-post-type-ui";s:6:"plugin";s:43:"custom-post-type-ui/custom-post-type-ui.php";s:11:"new_version";s:5:"1.5.8";s:3:"url";s:50:"https://wordpress.org/plugins/custom-post-type-ui/";s:7:"package";s:68:"https://downloads.wordpress.org/plugin/custom-post-type-ui.1.5.8.zip";s:5:"icons";a:2:{s:2:"2x";s:72:"https://ps.w.org/custom-post-type-ui/assets/icon-256x256.png?rev=1069557";s:2:"1x";s:72:"https://ps.w.org/custom-post-type-ui/assets/icon-128x128.png?rev=1069557";}s:7:"banners";a:2:{s:2:"2x";s:75:"https://ps.w.org/custom-post-type-ui/assets/banner-1544x500.png?rev=1069557";s:2:"1x";s:74:"https://ps.w.org/custom-post-type-ui/assets/banner-772x250.png?rev=1069557";}s:11:"banners_rtl";a:0:{}}s:22:"cyr3lat/cyr-to-lat.php";O:8:"stdClass":9:{s:2:"id";s:21:"w.org/plugins/cyr3lat";s:4:"slug";s:7:"cyr3lat";s:6:"plugin";s:22:"cyr3lat/cyr-to-lat.php";s:11:"new_version";s:3:"3.5";s:3:"url";s:38:"https://wordpress.org/plugins/cyr3lat/";s:7:"package";s:54:"https://downloads.wordpress.org/plugin/cyr3lat.3.5.zip";s:5:"icons";a:1:{s:7:"default";s:51:"https://s.w.org/plugins/geopattern-icon/cyr3lat.svg";}s:7:"banners";a:0:{}s:11:"banners_rtl";a:0:{}}s:33:"disable-emojis/disable-emojis.php";O:8:"stdClass":9:{s:2:"id";s:28:"w.org/plugins/disable-emojis";s:4:"slug";s:14:"disable-emojis";s:6:"plugin";s:33:"disable-emojis/disable-emojis.php";s:11:"new_version";s:3:"1.7";s:3:"url";s:45:"https://wordpress.org/plugins/disable-emojis/";s:7:"package";s:61:"https://downloads.wordpress.org/plugin/disable-emojis.1.7.zip";s:5:"icons";a:1:{s:7:"default";s:65:"https://s.w.org/plugins/geopattern-icon/disable-emojis_d3c7d6.svg";}s:7:"banners";a:2:{s:2:"2x";s:70:"https://ps.w.org/disable-emojis/assets/banner-1544x500.png?rev=1145188";s:2:"1x";s:69:"https://ps.w.org/disable-emojis/assets/banner-772x250.png?rev=1145188";}s:11:"banners_rtl";a:0:{}}s:41:"better-wp-security/better-wp-security.php";O:8:"stdClass":9:{s:2:"id";s:32:"w.org/plugins/better-wp-security";s:4:"slug";s:18:"better-wp-security";s:6:"plugin";s:41:"better-wp-security/better-wp-security.php";s:11:"new_version";s:5:"6.9.2";s:3:"url";s:49:"https://wordpress.org/plugins/better-wp-security/";s:7:"package";s:67:"https://downloads.wordpress.org/plugin/better-wp-security.6.9.2.zip";s:5:"icons";a:3:{s:2:"2x";s:70:"https://ps.w.org/better-wp-security/assets/icon-256x256.jpg?rev=969999";s:2:"1x";s:62:"https://ps.w.org/better-wp-security/assets/icon.svg?rev=970042";s:3:"svg";s:62:"https://ps.w.org/better-wp-security/assets/icon.svg?rev=970042";}s:7:"banners";a:1:{s:2:"1x";s:72:"https://ps.w.org/better-wp-security/assets/banner-772x250.png?rev=881897";}s:11:"banners_rtl";a:0:{}}s:27:"wp-super-cache/wp-cache.php";O:8:"stdClass":9:{s:2:"id";s:28:"w.org/plugins/wp-super-cache";s:4:"slug";s:14:"wp-super-cache";s:6:"plugin";s:27:"wp-super-cache/wp-cache.php";s:11:"new_version";s:5:"1.5.9";s:3:"url";s:45:"https://wordpress.org/plugins/wp-super-cache/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/wp-super-cache.1.5.9.zip";s:5:"icons";a:2:{s:2:"2x";s:67:"https://ps.w.org/wp-super-cache/assets/icon-256x256.png?rev=1095422";s:2:"1x";s:67:"https://ps.w.org/wp-super-cache/assets/icon-128x128.png?rev=1095422";}s:7:"banners";a:2:{s:2:"2x";s:70:"https://ps.w.org/wp-super-cache/assets/banner-1544x500.png?rev=1082414";s:2:"1x";s:69:"https://ps.w.org/wp-super-cache/assets/banner-772x250.png?rev=1082414";}s:11:"banners_rtl";a:0:{}}}}', 'no'),
(265, 'cptui_new_install', 'false', 'yes'),
(266, 'cptui_post_types', 'a:1:{s:4:"news";a:28:{s:4:"name";s:4:"news";s:5:"label";s:14:"Новости";s:14:"singular_label";s:14:"Новость";s:11:"description";s:0:"";s:6:"public";s:4:"true";s:18:"publicly_queryable";s:4:"true";s:7:"show_ui";s:4:"true";s:17:"show_in_nav_menus";s:4:"true";s:12:"show_in_rest";s:5:"false";s:9:"rest_base";s:0:"";s:11:"has_archive";s:5:"false";s:18:"has_archive_string";s:0:"";s:19:"exclude_from_search";s:5:"false";s:15:"capability_type";s:4:"post";s:12:"hierarchical";s:5:"false";s:7:"rewrite";s:4:"true";s:12:"rewrite_slug";s:0:"";s:17:"rewrite_withfront";s:4:"true";s:9:"query_var";s:4:"true";s:14:"query_var_slug";s:0:"";s:13:"menu_position";s:1:"5";s:12:"show_in_menu";s:4:"true";s:19:"show_in_menu_string";s:0:"";s:9:"menu_icon";s:19:"dashicons-megaphone";s:8:"supports";a:4:{i:0;s:5:"title";i:1;s:6:"editor";i:2;s:9:"thumbnail";i:3;s:7:"excerpt";}s:10:"taxonomies";a:0:{}s:6:"labels";a:23:{s:9:"menu_name";s:14:"Новости";s:9:"all_items";s:21:"Все новости";s:7:"add_new";s:31:"Добавить новость";s:12:"add_new_item";s:27:"Свежая новость";s:9:"edit_item";s:41:"Редактировать новость";s:9:"not_found";s:32:"Ничего не найдено";s:14:"featured_image";s:22:"Иллюстрация";s:8:"new_item";s:0:"";s:9:"view_item";s:0:"";s:10:"view_items";s:0:"";s:12:"search_items";s:0:"";s:18:"not_found_in_trash";s:0:"";s:17:"parent_item_colon";s:0:"";s:18:"set_featured_image";s:0:"";s:21:"remove_featured_image";s:0:"";s:18:"use_featured_image";s:0:"";s:8:"archives";s:0:"";s:16:"insert_into_item";s:0:"";s:21:"uploaded_to_this_item";s:0:"";s:17:"filter_items_list";s:0:"";s:21:"items_list_navigation";s:0:"";s:10:"items_list";s:0:"";s:10:"attributes";s:0:"";}s:15:"custom_supports";s:0:"";}}', 'yes'),
(157, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(271, '_site_transient_timeout_itsec_wp_upload_dir', '1524806687', 'no'),
(272, '_site_transient_itsec_wp_upload_dir', 'a:6:{s:4:"path";s:63:"/home/u17621/wp-test.glebkema.ru/www/wp-content/uploads/2018/04";s:3:"url";s:53:"http://wp-test.glebkema.ru/wp-content/uploads/2018/04";s:6:"subdir";s:8:"/2018/04";s:7:"basedir";s:55:"/home/u17621/wp-test.glebkema.ru/www/wp-content/uploads";s:7:"baseurl";s:45:"http://wp-test.glebkema.ru/wp-content/uploads";s:5:"error";b:0;}', 'no'),
(192, 'itsec-storage', 'a:6:{s:6:"global";a:28:{s:15:"lockout_message";s:12:"ошибка";s:20:"user_lockout_message";s:142:"Вы были заблокированы из-за слишком многих неудачных попыток входа в систему.";s:25:"community_lockout_message";s:93:"Ваш IP-адрес был помечен, как угроза, сетью iThemes Security.";s:9:"blacklist";b:1;s:15:"blacklist_count";i:3;s:16:"blacklist_period";i:7;s:14:"lockout_period";i:15;s:18:"lockout_white_list";a:0:{}s:12:"log_rotation";i:60;s:8:"log_type";s:8:"database";s:12:"log_location";s:77:"/home/u17621/wp-test.glebkema.ru/www/wp-content/uploads/ithemes-security/logs";s:8:"log_info";s:0:"";s:14:"allow_tracking";b:0;s:11:"write_files";b:1;s:10:"nginx_file";s:47:"/home/u17621/wp-test.glebkema.ru/www/nginx.conf";s:24:"infinitewp_compatibility";b:0;s:11:"did_upgrade";b:0;s:9:"lock_file";b:0;s:14:"proxy_override";b:0;s:14:"hide_admin_bar";b:0;s:16:"show_error_codes";b:0;s:25:"show_new_dashboard_notice";b:0;s:19:"show_security_check";b:0;s:5:"build";i:4087;s:20:"activation_timestamp";i:1524544114;s:11:"cron_status";i:1;s:8:"use_cron";b:1;s:14:"cron_test_time";i:1524766615;}s:19:"network-brute-force";a:5:{s:7:"api_key";s:32:"XPs9aAwahfXVyt43Juh1GB7eeBMsxCL5";s:10:"api_secret";s:128:"uX9Iq28jE70bJ5Mjl25D9Hi139H07car68pdu0JY59NKo5h3Hi59FkI6v0vMzBl34YIzX9iQYYM2W7HLzq096i7LXnAf6m418kwK78d8dTLLzsu5Tf3SJLVPOBj9m569";s:10:"enable_ban";b:1;s:13:"updates_optin";b:0;s:7:"api_nag";b:0;}s:11:"brute-force";a:4:{s:17:"max_attempts_host";i:5;s:17:"max_attempts_user";i:10;s:12:"check_period";i:5;s:14:"auto_ban_admin";b:0;}s:15:"wordpress-salts";a:1:{s:14:"last_generated";i:1524544187;}s:10:"admin-user";a:2:{s:9:"change_id";b:1;s:12:"new_username";N;}s:19:"notification-center";a:6:{s:9:"last_sent";a:1:{s:6:"digest";i:1524720287;}s:9:"resend_at";a:0:{}s:4:"data";a:1:{s:6:"digest";a:0:{}}s:11:"mail_errors";a:0:{}s:13:"notifications";a:3:{s:6:"digest";a:5:{s:8:"schedule";s:5:"daily";s:7:"enabled";b:1;s:9:"user_list";a:1:{i:0;s:18:"role:administrator";}s:15:"previous_emails";a:0:{}s:7:"subject";N;}s:7:"lockout";a:4:{s:7:"enabled";b:1;s:9:"user_list";a:1:{i:0;s:18:"role:administrator";}s:15:"previous_emails";a:0:{}s:7:"subject";N;}s:6:"backup";a:2:{s:10:"email_list";a:1:{i:0;s:23:"gleb.kemarsky@gmail.com";}s:7:"subject";N;}}s:12:"admin_emails";a:0:{}}}', 'yes'),
(183, 'itsec_cron', 'a:2:{s:6:"single";a:0:{}s:9:"recurring";a:3:{s:17:"purge-log-entries";a:1:{s:4:"data";a:0:{}}s:14:"purge-lockouts";a:1:{s:4:"data";a:0:{}}s:11:"clear-locks";a:1:{s:4:"data";a:0:{}}}}', 'no'),
(193, 'itsec_temp_whitelist_ip', 'a:1:{s:11:"95.73.7.125";i:1524806687;}', 'no'),
(194, 'itsec_active_modules', 'a:6:{s:9:"ban-users";b:1;s:6:"backup";b:1;s:11:"brute-force";b:1;s:19:"network-brute-force";b:1;s:16:"strong-passwords";b:1;s:16:"wordpress-tweaks";b:1;}', 'yes'),
(198, 'new_admin_email', 'gleb.kemarsky@gmail.com', 'yes'),
(228, 'theme_mods_test-child', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:7:"primary";i:2;}s:18:"custom_css_post_id";i:-1;}', 'yes'),
(229, 'category_children', 'a:0:{}', 'yes'),
(233, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wptest_postmeta`
--

CREATE TABLE IF NOT EXISTS `wptest_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=93 ;

--
-- Dumping data for table `wptest_postmeta`
--

INSERT INTO `wptest_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 1, '_wp_old_slug', '%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80'),
(3, 2, '_edit_lock', '1524663970:2'),
(4, 2, '_edit_last', '2'),
(5, 6, '_edit_last', '2'),
(6, 6, '_edit_lock', '1524577936:2'),
(7, 8, '_edit_last', '2'),
(8, 8, '_edit_lock', '1524577979:2'),
(9, 10, '_edit_last', '2'),
(10, 10, '_edit_lock', '1524578017:2'),
(11, 12, '_edit_last', '2'),
(12, 12, '_edit_lock', '1524578116:2'),
(13, 14, '_menu_item_type', 'custom'),
(14, 14, '_menu_item_menu_item_parent', '0'),
(15, 14, '_menu_item_object_id', '14'),
(16, 14, '_menu_item_object', 'custom'),
(17, 14, '_menu_item_target', ''),
(18, 14, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(19, 14, '_menu_item_xfn', ''),
(20, 14, '_menu_item_url', 'http://wp-test.glebkema.ru/'),
(21, 14, '_menu_item_orphaned', '1524578262'),
(22, 15, '_menu_item_type', 'post_type'),
(23, 15, '_menu_item_menu_item_parent', '0'),
(24, 15, '_menu_item_object_id', '2'),
(25, 15, '_menu_item_object', 'page'),
(26, 15, '_menu_item_target', ''),
(27, 15, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(28, 15, '_menu_item_xfn', ''),
(29, 15, '_menu_item_url', ''),
(82, 25, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:119;s:6:"height";i:68;s:4:"file";s:20:"2018/04/news-001.jpg";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(31, 16, '_menu_item_type', 'post_type'),
(32, 16, '_menu_item_menu_item_parent', '0'),
(33, 16, '_menu_item_object_id', '12'),
(34, 16, '_menu_item_object', 'page'),
(35, 16, '_menu_item_target', ''),
(36, 16, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(37, 16, '_menu_item_xfn', ''),
(38, 16, '_menu_item_url', ''),
(67, 20, '_edit_last', '2'),
(40, 17, '_menu_item_type', 'post_type'),
(41, 17, '_menu_item_menu_item_parent', '0'),
(42, 17, '_menu_item_object_id', '6'),
(43, 17, '_menu_item_object', 'page'),
(44, 17, '_menu_item_target', ''),
(45, 17, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(46, 17, '_menu_item_xfn', ''),
(47, 17, '_menu_item_url', ''),
(49, 18, '_menu_item_type', 'post_type'),
(50, 18, '_menu_item_menu_item_parent', '0'),
(51, 18, '_menu_item_object_id', '10'),
(52, 18, '_menu_item_object', 'page'),
(53, 18, '_menu_item_target', ''),
(54, 18, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(55, 18, '_menu_item_xfn', ''),
(56, 18, '_menu_item_url', ''),
(81, 25, '_wp_attached_file', '2018/04/news-001.jpg'),
(58, 19, '_menu_item_type', 'post_type'),
(59, 19, '_menu_item_menu_item_parent', '0'),
(60, 19, '_menu_item_object_id', '8'),
(61, 19, '_menu_item_object', 'page'),
(62, 19, '_menu_item_target', ''),
(63, 19, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(64, 19, '_menu_item_xfn', ''),
(65, 19, '_menu_item_url', ''),
(80, 24, '_edit_lock', '1524677190:2'),
(79, 24, '_edit_last', '2'),
(78, 23, '_edit_lock', '1524677196:2'),
(77, 23, '_edit_last', '2'),
(76, 20, '_edit_lock', '1524649268:2'),
(83, 26, '_wp_attached_file', '2018/04/news-002.jpg'),
(84, 26, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:119;s:6:"height";i:68;s:4:"file";s:20:"2018/04/news-002.jpg";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(85, 27, '_edit_last', '2'),
(86, 27, '_edit_lock', '1524677181:2'),
(87, 28, '_wp_attached_file', '2018/04/news-003.jpg'),
(88, 28, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:119;s:6:"height";i:68;s:4:"file";s:20:"2018/04/news-003.jpg";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(89, 23, '_wp_old_slug', '23'),
(90, 23, '_thumbnail_id', '25'),
(91, 27, '_thumbnail_id', '28'),
(92, 24, '_thumbnail_id', '26');

-- --------------------------------------------------------

--
-- Table structure for table `wptest_posts`
--

CREATE TABLE IF NOT EXISTS `wptest_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `wptest_posts`
--

INSERT INTO `wptest_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 2, '2018-04-24 07:16:11', '2018-04-24 07:16:11', 'Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите её, затем пишите!', 'Привет, мир!', '', 'publish', 'open', 'open', '', 'privet-mir', '', '', '2018-04-24 07:16:11', '2018-04-24 07:16:11', '', 0, 'http://wp-test.glebkema.ru/?p=1', 0, 'post', '', 1),
(4, 2, '2018-04-24 07:36:58', '2018-04-24 04:36:58', '', 'Главная', '', 'inherit', 'closed', 'closed', '', '2-autosave-v1', '', '', '2018-04-24 07:36:58', '2018-04-24 04:36:58', '', 2, 'http://wp-test.glebkema.ru/2018/04/24/2-autosave-v1/', 0, 'revision', '', 0),
(2, 2, '2018-04-24 07:16:11', '2018-04-24 07:16:11', '[test_news]', 'Главная', '', 'publish', 'closed', 'open', '', 'mainpage', '', '', '2018-04-25 16:44:15', '2018-04-25 13:44:15', '', 0, 'http://wp-test.glebkema.ru/?page_id=2', 0, 'page', '', 0),
(5, 2, '2018-04-24 07:37:52', '2018-04-24 04:37:52', 'Текст страницы ...', 'Главная', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2018-04-24 07:37:52', '2018-04-24 04:37:52', '', 2, 'http://wp-test.glebkema.ru/2018/04/24/2-revision-v1/', 0, 'revision', '', 0),
(6, 2, '2018-04-24 16:53:34', '2018-04-24 13:53:34', '<p>Отмечается, что туристы могли выбирать любой из&nbsp;20&nbsp;аэропортов, в&nbsp;которые летает авиакомпания. Другим условием стало&nbsp;то, что они должны были достигнуть согласия до&nbsp;того, как самолет приземлится в&nbsp;Финиксе.</p>', 'О нас', '', 'publish', 'closed', 'closed', '', 'o-nas', '', '', '2018-04-24 16:54:35', '2018-04-24 13:54:35', '', 0, 'http://wp-test.glebkema.ru/?page_id=6', 0, 'page', '', 0),
(7, 2, '2018-04-24 16:53:34', '2018-04-24 13:53:34', '<p>Отмечается, что туристы могли выбирать любой из&nbsp;20&nbsp;аэропортов, в&nbsp;которые летает авиакомпания. Другим условием стало&nbsp;то, что они должны были достигнуть согласия до&nbsp;того, как самолет приземлится в&nbsp;Финиксе.</p>', 'О нас', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2018-04-24 16:53:34', '2018-04-24 13:53:34', '', 6, 'http://wp-test.glebkema.ru/6-revision-v1/', 0, 'revision', '', 0),
(3, 2, '2018-04-24 07:18:53', '0000-00-00 00:00:00', '', 'Черновик', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-04-24 07:18:53', '0000-00-00 00:00:00', '', 0, 'http://wp-test.glebkema.ru/?p=3', 0, 'post', '', 0),
(8, 2, '2018-04-24 16:55:18', '2018-04-24 13:55:18', '<p?Текст об услугах</p>', 'Услуги', '', 'publish', 'closed', 'closed', '', 'uslugi', '', '', '2018-04-24 16:55:18', '2018-04-24 13:55:18', '', 0, 'http://wp-test.glebkema.ru/?page_id=8', 0, 'page', '', 0),
(9, 2, '2018-04-24 16:55:18', '2018-04-24 13:55:18', '<p?Текст об услугах</p>', 'Услуги', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2018-04-24 16:55:18', '2018-04-24 13:55:18', '', 8, 'http://wp-test.glebkema.ru/8-revision-v1/', 0, 'revision', '', 0),
(10, 2, '2018-04-24 16:55:58', '2018-04-24 13:55:58', '<p>Наши работы</p>', 'Портфолио', '', 'publish', 'closed', 'closed', '', 'portfolio', '', '', '2018-04-24 16:55:58', '2018-04-24 13:55:58', '', 0, 'http://wp-test.glebkema.ru/?page_id=10', 0, 'page', '', 0),
(11, 2, '2018-04-24 16:55:58', '2018-04-24 13:55:58', '<p>Наши работы</p>', 'Портфолио', '', 'inherit', 'closed', 'closed', '', '10-revision-v1', '', '', '2018-04-24 16:55:58', '2018-04-24 13:55:58', '', 10, 'http://wp-test.glebkema.ru/10-revision-v1/', 0, 'revision', '', 0),
(12, 2, '2018-04-24 16:57:32', '2018-04-24 13:57:32', '[test_phone class="contacts-phone"]+380 689 89 90[/test_phone]', 'Контакты', '', 'publish', 'closed', 'closed', '', 'contacts', '', '', '2018-04-24 16:57:32', '2018-04-24 13:57:32', '', 0, 'http://wp-test.glebkema.ru/?page_id=12', 0, 'page', '', 0),
(13, 2, '2018-04-24 16:57:32', '2018-04-24 13:57:32', '[test_phone class="contacts-phone"]+380 689 89 90[/test_phone]', 'Контакты', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2018-04-24 16:57:32', '2018-04-24 13:57:32', '', 12, 'http://wp-test.glebkema.ru/12-revision-v1/', 0, 'revision', '', 0),
(14, 2, '2018-04-24 16:57:42', '0000-00-00 00:00:00', '', 'Главная', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-04-24 16:57:42', '0000-00-00 00:00:00', '', 0, 'http://wp-test.glebkema.ru/?p=14', 1, 'nav_menu_item', '', 0),
(15, 2, '2018-04-24 16:58:46', '2018-04-24 13:58:46', ' ', '', '', 'publish', 'closed', 'closed', '', '15', '', '', '2018-04-25 12:43:43', '2018-04-25 09:43:43', '', 0, 'http://wp-test.glebkema.ru/?p=15', 1, 'nav_menu_item', '', 0),
(16, 2, '2018-04-24 16:58:46', '2018-04-24 13:58:46', ' ', '', '', 'publish', 'closed', 'closed', '', '16', '', '', '2018-04-25 12:43:43', '2018-04-25 09:43:43', '', 0, 'http://wp-test.glebkema.ru/?p=16', 5, 'nav_menu_item', '', 0),
(17, 2, '2018-04-24 16:58:46', '2018-04-24 13:58:46', ' ', '', '', 'publish', 'closed', 'closed', '', '17', '', '', '2018-04-25 12:43:43', '2018-04-25 09:43:43', '', 0, 'http://wp-test.glebkema.ru/?p=17', 2, 'nav_menu_item', '', 0),
(18, 2, '2018-04-24 16:58:46', '2018-04-24 13:58:46', ' ', '', '', 'publish', 'closed', 'closed', '', '18', '', '', '2018-04-25 12:43:43', '2018-04-25 09:43:43', '', 0, 'http://wp-test.glebkema.ru/?p=18', 4, 'nav_menu_item', '', 0),
(19, 2, '2018-04-24 16:58:46', '2018-04-24 13:58:46', ' ', '', '', 'publish', 'closed', 'closed', '', '19', '', '', '2018-04-25 12:43:43', '2018-04-25 09:43:43', '', 0, 'http://wp-test.glebkema.ru/?p=19', 3, 'nav_menu_item', '', 0),
(20, 2, '2018-04-25 12:43:21', '2018-04-25 09:43:21', '', 'Блог', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2018-04-25 12:43:21', '2018-04-25 09:43:21', '', 0, 'http://wp-test.glebkema.ru/?page_id=20', 0, 'page', '', 0),
(23, 2, '2018-04-25 15:46:29', '2018-04-25 12:46:29', 'Реакция босса на&nbsp;милую объяснительную сотрудницы растрогало пользователей сети. Реакция босса на&nbsp;милую объяснительную сотрудницы растрогало пользователей сети. Реакция босса на&nbsp;милую объяснительную сотрудницы растрогало пользователей сети.', '28 декабря, 2018', 'Реакция босса на&nbsp;милую объяснительную сотрудницы растрогало пользователей сети', 'publish', 'closed', 'closed', '', '28-dekabrya-2018', '', '', '2018-04-25 16:12:18', '2018-04-25 13:12:18', '', 0, 'http://wp-test.glebkema.ru/?post_type=news&#038;p=23', 0, 'news', '', 0),
(22, 2, '2018-04-25 12:43:21', '2018-04-25 09:43:21', '', 'Блог', '', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2018-04-25 12:43:21', '2018-04-25 09:43:21', '', 20, 'http://wp-test.glebkema.ru/20-revision-v1/', 0, 'revision', '', 0),
(24, 2, '2018-04-25 15:49:03', '2018-04-25 12:49:03', 'Сотрудница фирмы по&nbsp;имени Дженн, которая за&nbsp;несколько лет работы ни&nbsp;разу не&nbsp;опаздывала. Сотрудница фирмы по&nbsp;имени Дженн, которая за&nbsp;несколько лет работы ни&nbsp;разу не&nbsp;опаздывала. Сотрудница фирмы по&nbsp;имени Дженн, которая за&nbsp;несколько лет работы ни&nbsp;разу не&nbsp;опаздывала.', '12 марта, 2018', 'Сотрудница фирмы по&nbsp;имени Дженн, которая за&nbsp;несколько лет работы ни&nbsp;разу не&nbsp;опаздывала', 'publish', 'closed', 'closed', '', '12-marta-2018', '', '', '2018-04-25 16:13:04', '2018-04-25 13:13:04', '', 0, 'http://wp-test.glebkema.ru/?post_type=news&#038;p=24', 0, 'news', '', 0),
(25, 2, '2018-04-25 15:48:38', '2018-04-25 12:48:38', '', 'news-001', '', 'inherit', 'closed', 'closed', '', 'news-001', '', '', '2018-04-25 15:48:38', '2018-04-25 12:48:38', '', 23, 'http://wp-test.glebkema.ru/wp-content/uploads/2018/04/news-001.jpg', 0, 'attachment', 'image/jpeg', 0),
(26, 2, '2018-04-25 15:48:59', '2018-04-25 12:48:59', '', 'news-002', '', 'inherit', 'closed', 'closed', '', 'news-002', '', '', '2018-04-25 15:48:59', '2018-04-25 12:48:59', '', 24, 'http://wp-test.glebkema.ru/wp-content/uploads/2018/04/news-002.jpg', 0, 'attachment', 'image/jpeg', 0),
(30, 2, '2018-04-25 16:44:15', '2018-04-25 13:44:15', '[test_news]', 'Главная', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2018-04-25 16:44:15', '2018-04-25 13:44:15', '', 2, 'http://wp-test.glebkema.ru/2-revision-v1/', 0, 'revision', '', 0),
(27, 2, '2018-04-25 15:50:43', '2018-04-25 12:50:43', 'Oбъяснительная показалась боссу настолько милой, что он решил премировать работницу и&nbsp;выложить переписку с&nbsp;подчиненной. Oбъяснительная показалась боссу настолько милой, что он решил премировать работницу и&nbsp;выложить переписку с&nbsp;подчиненной. Oбъяснительная показалась боссу настолько милой, что он решил премировать работницу и&nbsp;выложить переписку с&nbsp;подчиненной.', '6 января, 2018', 'Oбъяснительная показалась боссу настолько милой, что он решил премировать работницу и&nbsp;выложить переписку с&nbsp;подчиненной', 'publish', 'closed', 'closed', '', '6-yanvarya-2018', '', '', '2018-04-25 16:12:44', '2018-04-25 13:12:44', '', 0, 'http://wp-test.glebkema.ru/?post_type=news&#038;p=27', 0, 'news', '', 0),
(28, 2, '2018-04-25 15:50:20', '2018-04-25 12:50:20', '', 'news-003', '', 'inherit', 'closed', 'closed', '', 'news-003', '', '', '2018-04-25 15:50:20', '2018-04-25 12:50:20', '', 27, 'http://wp-test.glebkema.ru/wp-content/uploads/2018/04/news-003.jpg', 0, 'attachment', 'image/jpeg', 0),
(29, 2, '2018-04-25 15:52:37', '2018-04-25 12:52:37', 'Реакция босса на&nbsp;милую объяснительную сотрудницы растрогало пользователей сети. Реакция босса на&nbsp;милую объяснительную сотрудницы растрогало пользователей сети. Реакция босса на&nbsp;милую объяснительную сотрудницы растрогало пользователей сети.', '28 декабря, 2018', 'Реакция босса на&nbsp;милую объяснительную сотрудницы растрогало пользователей сети', 'inherit', 'closed', 'closed', '', '23-autosave-v1', '', '', '2018-04-25 15:52:37', '2018-04-25 12:52:37', '', 23, 'http://wp-test.glebkema.ru/23-autosave-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wptest_termmeta`
--

CREATE TABLE IF NOT EXISTS `wptest_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wptest_terms`
--

CREATE TABLE IF NOT EXISTS `wptest_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wptest_terms`
--

INSERT INTO `wptest_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Без рубрики', 'bez-rubriki', 0),
(2, 'Главное меню', 'glavnoe-menyu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wptest_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wptest_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wptest_term_relationships`
--

INSERT INTO `wptest_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(15, 2, 0),
(17, 2, 0),
(19, 2, 0),
(18, 2, 0),
(16, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wptest_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wptest_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wptest_term_taxonomy`
--

INSERT INTO `wptest_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `wptest_usermeta`
--

CREATE TABLE IF NOT EXISTS `wptest_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `wptest_usermeta` HAS BEEN REMOVED
--

-- --------------------------------------------------------

--
-- Table structure for table `wptest_users`
--

CREATE TABLE IF NOT EXISTS `wptest_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wptest_users` HAS BEEN REMOVED
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
