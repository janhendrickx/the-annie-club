-- Adminer 4.8.1 MySQL 8.4.3 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_qctijladwijwkpnrwuwgfytreksbgrdwsqnz` (`primaryOwnerId`),
  CONSTRAINT `fk_kkintyxjvetnnxnxakeytjqmcteakatsasjc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qctijladwijwkpnrwuwgfytreksbgrdwsqnz` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `announcements`;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_asnyefopnqmlranzevtjhqqxsqtuwzmvntri` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_hxwqtlztxxfdkesiaqmkgtesehhhcllcbddz` (`dateRead`),
  KEY `fk_uxkbtwjsjdnhgapwcrbxunqkhshizsbcpmpi` (`pluginId`),
  CONSTRAINT `fk_qvabdkvcyqxgdluffnmhhyhylxkkxgsjmqny` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uxkbtwjsjdnhgapwcrbxunqkhshizsbcpmpi` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `assetindexdata`;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qopcaumqmyexahpwevyxxpdmlewzzqczuvne` (`sessionId`,`volumeId`),
  KEY `idx_cuvalxlfcwsztmiagxbaxhphaygvvlapniwj` (`volumeId`),
  CONSTRAINT `fk_gairepvaxermlffnymsrwtppklxezvzfekpx` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hkljzfufulxejqjujfxgoqssetvkzydpyplc` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `assetindexingsessions`;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_scexmhaiwvvkotisxnifncqapbjpaeuofvah` (`filename`,`folderId`),
  KEY `idx_khyzzwpdxumrgkmqgrwxxewhfilbkfxahsvl` (`folderId`),
  KEY `idx_wvctdnktzrrpzfwoljusyxdehwwwjxpuxyph` (`volumeId`),
  KEY `fk_xjrojgnjbnjdwniydoqyojzhzuvowrdjbnlr` (`uploaderId`),
  CONSTRAINT `fk_fusnkiwrcbjxwabpqdbcojtaeufrgkjxqaje` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qfklonyudmhctewdqpvoheqbhqappawtuqgq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xjrojgnjbnjdwniydoqyojzhzuvowrdjbnlr` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xkwjjviuirupobcevxcxgfbhobpffwsoouml` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES
(5,	1,	1,	1,	'E0A2832.jpg',	'image',	NULL,	3543,	2362,	3037974,	NULL,	NULL,	NULL,	'2025-05-29 12:50:03',	'2025-05-29 12:50:03',	'2025-05-29 12:50:03'),
(6,	1,	1,	1,	'E0A3764.jpg',	'image',	NULL,	1281,	2048,	504911,	NULL,	NULL,	NULL,	'2025-05-29 12:50:03',	'2025-05-29 12:50:03',	'2025-05-29 12:50:03'),
(7,	1,	1,	1,	'E0A5671-Luxor-Rotterdam-Ruben.jpg',	'image',	NULL,	5556,	1602,	6011278,	NULL,	NULL,	NULL,	'2025-05-29 12:50:04',	'2025-05-29 12:50:04',	'2025-05-29 12:50:04'),
(8,	1,	1,	1,	'E0A5777Tilburg.jpg',	'image',	NULL,	8200,	2362,	10710343,	NULL,	NULL,	NULL,	'2025-05-29 12:50:05',	'2025-05-29 12:50:05',	'2025-05-29 12:50:05'),
(12,	1,	1,	1,	'E0A8758.jpg',	'image',	NULL,	3150,	4725,	7941502,	NULL,	NULL,	NULL,	'2025-05-29 12:50:10',	'2025-05-29 12:50:10',	'2025-05-29 12:50:10'),
(13,	1,	1,	1,	'E0A8920.jpg',	'image',	NULL,	3149,	4724,	6833125,	NULL,	NULL,	NULL,	'2025-05-29 12:50:14',	'2025-05-29 12:50:14',	'2025-05-29 12:50:14'),
(14,	1,	1,	1,	'E0A9004.jpg',	'image',	NULL,	3150,	4724,	7906152,	NULL,	NULL,	NULL,	'2025-05-29 12:50:18',	'2025-05-29 12:50:18',	'2025-05-29 12:50:18'),
(16,	1,	1,	1,	'E0A9151.jpg',	'image',	NULL,	3150,	4724,	7501573,	NULL,	NULL,	NULL,	'2025-05-29 12:50:22',	'2025-05-29 12:50:22',	'2025-05-29 12:50:22'),
(18,	1,	1,	1,	'E0A9641.jpg',	'image',	NULL,	3543,	2362,	7863548,	NULL,	NULL,	NULL,	'2025-05-29 12:50:23',	'2025-05-29 12:50:23',	'2025-05-29 12:50:23'),
(19,	1,	1,	1,	'E0A9682-Jenne-Stroobants-kat-Leuven-B.jpg',	'image',	NULL,	1051,	1577,	825669,	NULL,	NULL,	NULL,	'2025-05-29 12:50:23',	'2025-05-29 12:50:23',	'2025-05-29 12:50:23'),
(20,	1,	1,	1,	'MG_0719.jpg',	'image',	NULL,	5616,	3744,	12589430,	NULL,	NULL,	NULL,	'2025-05-29 12:50:25',	'2025-05-29 12:50:25',	'2025-05-29 12:50:25'),
(21,	1,	1,	1,	'MG_0833.jpg',	'image',	NULL,	5511,	3674,	6670796,	NULL,	NULL,	NULL,	'2025-05-29 12:50:26',	'2025-05-29 12:50:26',	'2025-05-29 12:50:26'),
(22,	1,	1,	1,	'MG_0889.jpg',	'image',	NULL,	5616,	3744,	7572018,	NULL,	NULL,	NULL,	'2025-05-29 12:50:28',	'2025-05-29 12:50:28',	'2025-05-29 12:50:28'),
(23,	1,	1,	1,	'MG_1804.jpg',	'image',	NULL,	3744,	5616,	13845322,	NULL,	NULL,	NULL,	'2025-05-29 12:50:29',	'2025-05-29 12:50:30',	'2025-05-29 12:50:30'),
(24,	1,	1,	1,	'MG_2960.jpg',	'image',	NULL,	1200,	1800,	475404,	NULL,	NULL,	NULL,	'2025-05-29 12:50:30',	'2025-05-29 12:50:30',	'2025-05-29 12:50:30'),
(25,	1,	1,	1,	'MG_4136.jpg',	'image',	NULL,	3744,	5616,	14123026,	NULL,	NULL,	NULL,	'2025-05-29 12:50:31',	'2025-05-29 12:50:32',	'2025-05-29 12:50:32'),
(26,	1,	1,	1,	'1.jpg',	'image',	NULL,	4072,	2712,	7511937,	NULL,	NULL,	NULL,	'2025-05-29 12:50:35',	'2025-05-29 12:50:35',	'2025-05-29 12:50:35'),
(28,	1,	1,	1,	'6.jpg',	'image',	NULL,	2495,	3746,	6397896,	NULL,	NULL,	NULL,	'2025-05-29 12:50:38',	'2025-05-29 12:50:38',	'2025-05-29 12:50:38'),
(30,	1,	1,	1,	'10.jpg',	'image',	NULL,	2495,	3746,	6540841,	NULL,	NULL,	NULL,	'2025-05-29 12:50:41',	'2025-05-29 12:50:41',	'2025-05-29 12:50:41'),
(31,	1,	1,	1,	'11.jpg',	'image',	NULL,	4072,	2712,	6114890,	NULL,	NULL,	NULL,	'2025-05-29 12:50:44',	'2025-05-29 12:50:44',	'2025-05-29 12:50:44'),
(32,	1,	1,	1,	'12.jpg',	'image',	NULL,	5336,	1996,	9199781,	NULL,	NULL,	NULL,	'2025-05-29 12:50:54',	'2025-05-29 12:50:54',	'2025-05-29 12:50:54'),
(34,	1,	1,	1,	'18.jpg',	'image',	NULL,	6000,	2410,	4653261,	NULL,	NULL,	NULL,	'2025-05-29 12:50:56',	'2025-05-29 12:50:56',	'2025-05-29 12:50:56'),
(35,	1,	1,	1,	'21.jpg',	'image',	NULL,	2126,	1454,	3238452,	NULL,	NULL,	NULL,	'2025-05-29 12:50:57',	'2025-05-29 12:50:57',	'2025-05-29 12:50:57'),
(36,	1,	1,	1,	'27.jpg',	'image',	NULL,	4880,	3324,	13792504,	NULL,	NULL,	NULL,	'2025-05-29 12:51:02',	'2025-05-29 12:51:02',	'2025-05-29 12:51:02'),
(37,	1,	1,	1,	'28.jpg',	'image',	NULL,	3900,	2844,	6492234,	NULL,	NULL,	NULL,	'2025-05-29 12:51:05',	'2025-05-29 12:51:05',	'2025-05-29 12:51:05'),
(38,	1,	1,	1,	'30.jpg',	'image',	NULL,	3543,	2224,	7289483,	NULL,	NULL,	NULL,	'2025-05-29 12:51:06',	'2025-05-29 12:51:06',	'2025-05-29 12:51:06'),
(39,	1,	1,	1,	'34.jpg',	'image',	NULL,	1701,	1134,	1192396,	NULL,	NULL,	NULL,	'2025-05-29 12:51:06',	'2025-05-29 12:51:06',	'2025-05-29 12:51:06'),
(40,	1,	1,	1,	'Albert-Heijn.jpg',	'image',	NULL,	2048,	1032,	1736148,	NULL,	NULL,	NULL,	'2025-05-29 12:51:07',	'2025-05-29 12:51:07',	'2025-05-29 12:51:07'),
(41,	1,	1,	1,	'B80V2391.jpg',	'image',	NULL,	1356,	2036,	1083712,	NULL,	NULL,	NULL,	'2025-05-29 12:51:08',	'2025-05-29 12:51:08',	'2025-05-29 12:51:08'),
(42,	1,	1,	1,	'Bodystyling.jpg',	'image',	NULL,	3543,	1348,	2237506,	NULL,	NULL,	NULL,	'2025-05-29 12:51:08',	'2025-05-29 12:51:08',	'2025-05-29 12:51:08'),
(46,	1,	1,	1,	'Jean-Vermaelen_MG_9554.jpg',	'image',	NULL,	2362,	3543,	2553653,	NULL,	NULL,	NULL,	'2025-05-29 12:51:09',	'2025-05-29 12:51:10',	'2025-05-29 12:51:10'),
(47,	1,	1,	1,	'Luvanium.jpg',	'image',	NULL,	3544,	4429,	4717060,	NULL,	NULL,	NULL,	'2025-05-29 12:51:12',	'2025-05-29 12:51:12',	'2025-05-29 12:51:12'),
(49,	1,	1,	1,	'Primus-schuin-Definitief.jpg',	'image',	NULL,	1253,	1701,	745108,	NULL,	NULL,	NULL,	'2025-05-29 12:51:12',	'2025-05-29 12:51:12',	'2025-05-29 12:51:12'),
(50,	1,	1,	1,	'Sint-Gillis-Waas-Dullaert-Nancy_MG_9568.jpg',	'image',	NULL,	2362,	3543,	2784576,	NULL,	NULL,	NULL,	'2025-05-29 12:51:13',	'2025-05-29 12:51:14',	'2025-05-29 12:51:14'),
(51,	1,	1,	1,	'Tongerlo.jpg',	'image',	NULL,	2898,	4233,	5173510,	NULL,	NULL,	NULL,	'2025-05-29 12:51:14',	'2025-05-29 12:51:14',	'2025-05-29 12:51:14');

DROP TABLE IF EXISTS `assets_sites`;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_akquhezkakuutqirwbanhnlkbsmcungikuwu` (`siteId`),
  CONSTRAINT `fk_akquhezkakuutqirwbanhnlkbsmcungikuwu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cqvfcufuudorlhthggylkwcxjmpzaogoecnh` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `assets_sites` (`assetId`, `siteId`, `alt`) VALUES
(5,	1,	NULL),
(6,	1,	NULL),
(7,	1,	NULL),
(8,	1,	NULL),
(12,	1,	NULL),
(13,	1,	NULL),
(14,	1,	NULL),
(16,	1,	NULL),
(18,	1,	NULL),
(19,	1,	NULL),
(20,	1,	NULL),
(21,	1,	NULL),
(22,	1,	NULL),
(23,	1,	NULL),
(24,	1,	NULL),
(25,	1,	NULL),
(26,	1,	NULL),
(28,	1,	NULL),
(30,	1,	NULL),
(31,	1,	NULL),
(32,	1,	NULL),
(34,	1,	NULL),
(35,	1,	NULL),
(36,	1,	NULL),
(37,	1,	NULL),
(38,	1,	NULL),
(39,	1,	NULL),
(40,	1,	NULL),
(41,	1,	NULL),
(42,	1,	NULL),
(46,	1,	NULL),
(47,	1,	NULL),
(49,	1,	NULL),
(50,	1,	NULL),
(51,	1,	NULL);

DROP TABLE IF EXISTS `authenticator`;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_qsjttywbqlzpboophqdlbkkoajnnqegjvcaw` (`userId`),
  CONSTRAINT `fk_qsjttywbqlzpboophqdlbkkoajnnqegjvcaw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `bulkopevents`;
CREATE TABLE `bulkopevents` (
  `key` char(10) NOT NULL,
  `senderClass` varchar(255) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `idx_dzybvidnpgguvovkajjedjkobbeevhttrimx` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fzqucwxmmyobmflagylfqbznupdfnjeqxoxc` (`groupId`),
  KEY `fk_fomtganyrtnhgvwiitfqsdghgkyfrorhcchv` (`parentId`),
  CONSTRAINT `fk_fomtganyrtnhgvwiitfqsdghgkyfrorhcchv` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jugudwnjyayclcvudeasqxdonobtcfdqzucz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_otmrixujpmpepspsujpqhrphqkzbntfkurtl` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `categories` (`id`, `groupId`, `parentId`, `deletedWithGroup`, `dateCreated`, `dateUpdated`) VALUES
(54,	1,	NULL,	NULL,	'2025-05-29 12:52:12',	'2025-05-29 12:52:12'),
(55,	1,	NULL,	NULL,	'2025-05-29 12:52:26',	'2025-05-29 12:52:26'),
(56,	1,	NULL,	NULL,	'2025-05-29 12:52:30',	'2025-05-29 12:52:30'),
(57,	1,	NULL,	NULL,	'2025-05-29 12:52:34',	'2025-05-29 12:52:34');

DROP TABLE IF EXISTS `categorygroups`;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zpebedfsgsrkuqldndahhuyiouqjhohhwbdc` (`name`),
  KEY `idx_cpssjbbzuiwbspcacdtlljqwmzvnaazmgoqm` (`handle`),
  KEY `idx_jewmimbsqbaygzenubiqerzuicwyrrruykee` (`structureId`),
  KEY `idx_pegusltdncqpnvvujnmppbtijltomsjklhmg` (`fieldLayoutId`),
  KEY `idx_edzjntxmkxhdzsszzgwqknoakozjljhripjp` (`dateDeleted`),
  CONSTRAINT `fk_gdhgfqgqvcjduvikqclzbenqfyhpgcplqgfz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mnlcmbkzmhevdzzaauvjoevobaxrawbqbjlk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `categorygroups` (`id`, `structureId`, `fieldLayoutId`, `name`, `handle`, `defaultPlacement`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1,	1,	2,	'Categoriëen',	'fotocategorieen',	'end',	'2025-05-29 12:48:19',	'2025-05-29 12:48:19',	NULL,	'090fa9d9-5044-4ffd-8db1-3476adc09b0e');

DROP TABLE IF EXISTS `categorygroups_sites`;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rgbswpqoyvjmvelnfamoftsdqvlmcugkvkbv` (`groupId`,`siteId`),
  KEY `idx_rlaijcusehiftqxkpsftcuopknoomtrqbzxl` (`siteId`),
  CONSTRAINT `fk_acbjhskkilvqapdgiuyqqdhrnbusirmoddey` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_alaqoqlvzkcyfmbtcndvfcunopehsmjbrieo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `categorygroups_sites` (`id`, `groupId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1,	1,	1,	0,	NULL,	NULL,	'2025-05-29 12:48:19',	'2025-05-29 12:48:19',	'9cea3191-4e7d-4158-9d5e-22edd575712e');

DROP TABLE IF EXISTS `changedattributes`;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_btsabmdryhxrvpwxrfndgzizxyngtsisduih` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_ukedlsmfqiguaewltsmkrlzsafykohgouuyt` (`siteId`),
  KEY `fk_tvxmvdemtfqbqbacjjqsnbmcbfyexuhbtdds` (`userId`),
  CONSTRAINT `fk_spxstqhbldtsdfbsdqnuafyqxqtnouryrxdz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tvxmvdemtfqbqbacjjqsnbmcbfyexuhbtdds` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ukedlsmfqiguaewltsmkrlzsafykohgouuyt` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(54,	1,	'slug',	'2025-05-29 12:52:21',	0,	1),
(54,	1,	'title',	'2025-05-29 12:52:21',	0,	1),
(55,	1,	'slug',	'2025-05-29 12:52:28',	0,	1),
(55,	1,	'title',	'2025-05-29 12:52:28',	0,	1),
(56,	1,	'slug',	'2025-05-29 12:52:33',	0,	1),
(56,	1,	'title',	'2025-05-29 12:52:33',	0,	1),
(57,	1,	'slug',	'2025-05-29 12:52:37',	0,	1),
(57,	1,	'title',	'2025-05-29 12:52:37',	0,	1);

DROP TABLE IF EXISTS `changedfields`;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_tsybhznwfeirzhidlezdkzdazorkgxmqkpgk` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_jabfeoapupuyguovhdurietsehlfyxogpugi` (`siteId`),
  KEY `fk_xfujtjsczxbqcsarcwxdlxacvijqlzasrmat` (`fieldId`),
  KEY `fk_pmmdsfdwhjdyhcixcsovyjsekyfckidglobu` (`userId`),
  CONSTRAINT `fk_jabfeoapupuyguovhdurietsehlfyxogpugi` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pmmdsfdwhjdyhcixcsovyjsekyfckidglobu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_xfujtjsczxbqcsarcwxdlxacvijqlzasrmat` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xgpjoamppyamexixrkwwurscymwbukoxbckt` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `layoutElementUid`, `dateUpdated`, `propagated`, `userId`) VALUES
(2,	1,	1,	'4e694147-7371-49a1-af05-8dfcea69a572',	'2025-05-29 13:01:04',	0,	1);

DROP TABLE IF EXISTS `craftidtokens`;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_toarxcyicvmnkukwmqocsrxpbykyebhwmphg` (`userId`),
  CONSTRAINT `fk_toarxcyicvmnkukwmqocsrxpbykyebhwmphg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `deprecationerrors`;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vpvosdtmslthyyukqcwyvpmvpxyqsmruthdz` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `drafts`;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_vdlrnrfjwjpdixrnpwahazxucrlnxjbswcqj` (`creatorId`,`provisional`),
  KEY `idx_vlvmkhnayrwmrcxcpjygnkvmekjuffbtwesn` (`saved`),
  KEY `fk_odpjvfpivdhqcjoviknzhtefntufijeozpgf` (`canonicalId`),
  CONSTRAINT `fk_mqawvzyevqayeycfqhymklzvqopivtpgdbgg` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_odpjvfpivdhqcjoviknzhtefntufijeozpgf` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `elementactivity`;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_ljlysnciusnpuugbusuccsqvydprtodzaisd` (`elementId`,`timestamp`,`userId`),
  KEY `fk_qjwzxlwslhtwjgcwgxngfyuzgskzxbcniwip` (`userId`),
  KEY `fk_onruogxuykimuygfooezptvcwbarinpfuwbj` (`siteId`),
  KEY `fk_gcpklxcrwbawznjgghumeoiuxaghhtpwfmnv` (`draftId`),
  CONSTRAINT `fk_gcpklxcrwbawznjgghumeoiuxaghhtpwfmnv` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_onruogxuykimuygfooezptvcwbarinpfuwbj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qjwzxlwslhtwjgcwgxngfyuzgskzxbcniwip` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ydcbspuvnnimawpxefxawgwnkzqgplnnggil` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `elementactivity` (`elementId`, `userId`, `siteId`, `draftId`, `type`, `timestamp`) VALUES
(2,	1,	1,	NULL,	'edit',	'2025-05-29 13:01:03'),
(2,	1,	1,	NULL,	'save',	'2025-05-29 13:01:04'),
(54,	1,	1,	NULL,	'save',	'2025-05-29 12:52:21'),
(55,	1,	1,	NULL,	'save',	'2025-05-29 12:52:28'),
(56,	1,	1,	NULL,	'save',	'2025-05-29 12:52:33'),
(57,	1,	1,	NULL,	'save',	'2025-05-29 12:52:37');

DROP TABLE IF EXISTS `elements`;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sadxnokpxousycbpvxtvyszuwyimhuxtjqcy` (`dateDeleted`),
  KEY `idx_ibwlnerjzsdalbaisdjtjdjibikbmdztvxaf` (`fieldLayoutId`),
  KEY `idx_vwiougfoqcsqnatboeijdocrvecxtoxeycck` (`type`),
  KEY `idx_nkurwdvejwximjgktxujnrqlnlzrockbwqzy` (`enabled`),
  KEY `idx_hgjzxnnvvewyydxeyyzcdvsftziqtbmojqyj` (`canonicalId`),
  KEY `idx_dicrovuyghazoqnymhnkcbvodutiymqdihjd` (`archived`,`dateCreated`),
  KEY `idx_ermlahwlbxgtnqsgmlviopcwctudxocapuvg` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_mmkxrtvcfuovhlnhxxkjwgbpbrbtdtucupxm` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_fxmoafzhmjnlnwgoioxtyzpytdkcnndhahnb` (`draftId`),
  KEY `fk_ejqxhqnlcxqfrljwscolcrwwjzlvdhmhxlnn` (`revisionId`),
  CONSTRAINT `fk_ejqxhqnlcxqfrljwscolcrwwjzlvdhmhxlnn` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fxmoafzhmjnlnwgoioxtyzpytdkcnndhahnb` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mifdmreijkkcyzcgjpwvatfnjrnixcxnwrsh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wkpmqqoafodqrluwqtbmfuzmqbzgkbiujmqu` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `deletedWithOwner`, `uid`) VALUES
(1,	NULL,	NULL,	NULL,	NULL,	'craft\\elements\\User',	1,	0,	'2025-05-29 10:18:35',	'2025-05-29 10:18:35',	NULL,	NULL,	NULL,	'05c6742b-b794-4824-bacc-ba58952ef43e'),
(2,	NULL,	NULL,	NULL,	3,	'craft\\elements\\Entry',	1,	0,	'2025-05-29 12:49:16',	'2025-05-29 13:01:04',	NULL,	NULL,	NULL,	'bbd25788-25ca-4936-8909-4aab10cacaa1'),
(3,	2,	NULL,	1,	3,	'craft\\elements\\Entry',	1,	0,	'2025-05-29 12:49:16',	'2025-05-29 12:49:16',	NULL,	NULL,	NULL,	'5c60ee1b-0d85-4535-be98-789b63d58fa6'),
(5,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:02',	'2025-05-29 12:50:02',	NULL,	NULL,	NULL,	'523b40ca-b8ba-4b35-84bf-a802f3dfe989'),
(6,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:03',	'2025-05-29 12:50:03',	NULL,	NULL,	NULL,	'ecbe8626-a4b8-4477-84ff-4ddf6cca723b'),
(7,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:03',	'2025-05-29 12:50:03',	NULL,	NULL,	NULL,	'2860f4cf-25ec-4710-8907-b5c11629f17a'),
(8,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:04',	'2025-05-29 12:50:04',	NULL,	NULL,	NULL,	'27243770-4436-40a6-9a89-f2c73eacb258'),
(12,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:06',	'2025-05-29 12:50:06',	NULL,	NULL,	NULL,	'afbeba3e-4b21-4c70-b9f8-bbc580250469'),
(13,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:10',	'2025-05-29 12:50:10',	NULL,	NULL,	NULL,	'6edf366c-915e-4112-8907-b2a980337938'),
(14,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:14',	'2025-05-29 12:50:14',	NULL,	NULL,	NULL,	'b4490a6e-391a-415a-9628-7bc876c2cc05'),
(16,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:18',	'2025-05-29 12:50:18',	NULL,	NULL,	NULL,	'6dc69597-1cef-49ec-898d-04d7b48d2dc6'),
(18,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:22',	'2025-05-29 12:50:22',	NULL,	NULL,	NULL,	'6bee0706-45a3-4fe7-a2de-1ba78370c6e1'),
(19,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:23',	'2025-05-29 12:50:23',	NULL,	NULL,	NULL,	'32c2f890-4e43-440a-954a-f90adf894eaa'),
(20,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:23',	'2025-05-29 12:50:23',	NULL,	NULL,	NULL,	'bc1b8e24-18ed-423e-b91d-734665f55666'),
(21,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:25',	'2025-05-29 12:50:25',	NULL,	NULL,	NULL,	'845deee8-c635-4f6e-9457-2ce5cecddc64'),
(22,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:26',	'2025-05-29 12:50:26',	NULL,	NULL,	NULL,	'a7551336-d2ff-4ab6-9438-152da9d0a583'),
(23,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:28',	'2025-05-29 12:50:28',	NULL,	NULL,	NULL,	'1e6e8715-ffed-47e0-861f-dd1c96785bfc'),
(24,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:30',	'2025-05-29 12:50:30',	NULL,	NULL,	NULL,	'a90b65c1-86b8-4b44-8bad-c3152755483d'),
(25,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:30',	'2025-05-29 12:50:30',	NULL,	NULL,	NULL,	'4beb605f-183b-4815-b403-884c464ce7d0'),
(26,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:32',	'2025-05-29 12:50:32',	NULL,	NULL,	NULL,	'95a50059-4c01-4deb-b464-f0eae58b4e19'),
(28,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:35',	'2025-05-29 12:50:35',	NULL,	NULL,	NULL,	'99ff2211-4db8-439c-8965-d76ee5c8b4ef'),
(30,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:38',	'2025-05-29 12:50:38',	NULL,	NULL,	NULL,	'd96133b8-279f-4b7b-b0c4-75179029c9ed'),
(31,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:41',	'2025-05-29 12:50:41',	NULL,	NULL,	NULL,	'c0fa1691-dc2f-402d-a41b-904ed36bec63'),
(32,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:51',	'2025-05-29 12:50:51',	NULL,	NULL,	NULL,	'8f38d723-9ff8-4f14-9ac2-9a063e769694'),
(34,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:55',	'2025-05-29 12:50:55',	NULL,	NULL,	NULL,	'1d0d1f4a-8f8a-4013-821f-95550e16365d'),
(35,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:56',	'2025-05-29 12:50:56',	NULL,	NULL,	NULL,	'35dd19f1-0547-47fa-ac77-f25df04fd277'),
(36,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:50:58',	'2025-05-29 12:50:58',	NULL,	NULL,	NULL,	'5c133ae5-9720-4269-a371-ca46d83b9afd'),
(37,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:51:03',	'2025-05-29 12:51:03',	NULL,	NULL,	NULL,	'ea3d1b6c-34fd-4e78-b99e-72ab0ad543c7'),
(38,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:51:05',	'2025-05-29 12:51:05',	NULL,	NULL,	NULL,	'5b542676-295c-4133-a057-31b3c8e49a22'),
(39,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:51:06',	'2025-05-29 12:51:06',	NULL,	NULL,	NULL,	'7b1ba376-ad36-4cf9-852a-019b8fa2dbaf'),
(40,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:51:06',	'2025-05-29 12:51:06',	NULL,	NULL,	NULL,	'ac7694ee-9624-47df-9300-ff33dec9d2bb'),
(41,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:51:07',	'2025-05-29 12:51:07',	NULL,	NULL,	NULL,	'cb59fb12-a0da-48c3-bb78-130b969684a3'),
(42,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:51:08',	'2025-05-29 12:51:08',	NULL,	NULL,	NULL,	'ad48da21-32be-414a-b1e0-d5fdfdaa125e'),
(46,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:51:09',	'2025-05-29 12:51:09',	NULL,	NULL,	NULL,	'aa1a0c3d-1ab2-4c54-8079-7affcdaa5580'),
(47,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:51:10',	'2025-05-29 12:51:10',	NULL,	NULL,	NULL,	'fdd16ff5-3b3e-40a0-b33c-e0d3395ca94d'),
(49,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:51:12',	'2025-05-29 12:51:12',	NULL,	NULL,	NULL,	'8a341417-084d-49ff-a7bc-7702f5106f00'),
(50,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:51:13',	'2025-05-29 12:51:13',	NULL,	NULL,	NULL,	'4cc95910-58a3-4183-ad16-bc5211257ddd'),
(51,	NULL,	NULL,	NULL,	1,	'craft\\elements\\Asset',	1,	0,	'2025-05-29 12:51:14',	'2025-05-29 12:51:14',	NULL,	NULL,	NULL,	'aea35ecf-afcd-44ae-878b-e81e29953f1b'),
(53,	2,	NULL,	2,	3,	'craft\\elements\\Entry',	1,	0,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	NULL,	NULL,	NULL,	'3e49dfbf-e4f1-41fb-a1b7-d80e90252b8c'),
(54,	NULL,	NULL,	NULL,	2,	'craft\\elements\\Category',	1,	0,	'2025-05-29 12:52:12',	'2025-05-29 12:52:21',	NULL,	NULL,	NULL,	'7559da73-2496-4f3e-b66b-a67cecab71a3'),
(55,	NULL,	NULL,	NULL,	2,	'craft\\elements\\Category',	1,	0,	'2025-05-29 12:52:26',	'2025-05-29 12:52:28',	NULL,	NULL,	NULL,	'a9afc724-62f1-4114-9371-e386cde6bc15'),
(56,	NULL,	NULL,	NULL,	2,	'craft\\elements\\Category',	1,	0,	'2025-05-29 12:52:30',	'2025-05-29 12:52:33',	NULL,	NULL,	NULL,	'bde6659d-d52f-4c0b-8b09-834b95fca756'),
(57,	NULL,	NULL,	NULL,	2,	'craft\\elements\\Category',	1,	0,	'2025-05-29 12:52:34',	'2025-05-29 12:52:37',	NULL,	NULL,	NULL,	'aa94c12b-8766-4337-bf47-1274dd7f8dea'),
(59,	2,	NULL,	3,	3,	'craft\\elements\\Entry',	1,	0,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	NULL,	NULL,	NULL,	'294efbb6-1bfd-4873-9afb-19dd8737b9d7');

DROP TABLE IF EXISTS `elements_bulkops`;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_hgxkilzjufvubtjmvwgypokfsfukepkaxbfw` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `elements_owners`;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_qeqhwuqumhwuxykbkpmufogfjeubtndrrylv` (`ownerId`),
  CONSTRAINT `fk_ofxgzuctxzlfqmceacvmsjqqppxpflkkrctk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qeqhwuqumhwuxykbkpmufogfjeubtndrrylv` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `elements_sites`;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uvjpcgwuiqewdwmgluuencshsomsflqvwxrr` (`elementId`,`siteId`),
  KEY `idx_zyacwhvvcyokydvpwwsoqndckccyyhwyyqqx` (`siteId`),
  KEY `idx_hdbboytyskgktcbglviujebsmzjafzzochzf` (`title`,`siteId`),
  KEY `idx_xazqphfrshfobbewymlbsdrqddqbjkmrajvx` (`slug`,`siteId`),
  KEY `idx_tuptymkcfvsuroihjjnhygnuqbwwmaacllnk` (`enabled`),
  KEY `idx_lfnsayekgjbucvufamovqnihbvkxfhfihlbw` (`uri`,`siteId`),
  CONSTRAINT `fk_duyhiwkjryzfoilmuzwsiwwrdipzcatzsmep` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hsulsxpxzkhckdudlvbjycquxivltsczprif` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `title`, `slug`, `uri`, `content`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1,	1,	1,	NULL,	NULL,	NULL,	NULL,	1,	'2025-05-29 10:18:35',	'2025-05-29 10:18:35',	'd1a08302-5abd-4f11-903f-e63ea463546b'),
(2,	2,	1,	'Home',	'home',	'__home__',	'{\"4e694147-7371-49a1-af05-8dfcea69a572\": [51, 50, 49, 47, 46, 42, 41, 40, 39, 38, 37, 36, 35, 34, 32, 31, 30, 28, 26, 25, 24, 23, 22, 21, 20, 19, 18, 16, 14, 13, 12, 8, 7, 6, 5]}',	1,	'2025-05-29 12:49:16',	'2025-05-29 13:01:04',	'a62a434c-d136-4935-bad6-573203c2c707'),
(3,	3,	1,	'Home',	'home',	'__home__',	NULL,	1,	'2025-05-29 12:49:16',	'2025-05-29 12:49:16',	'debc71da-65b4-40f0-a81a-2be40b5590db'),
(5,	5,	1,	'E0 A2832',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:02',	'2025-05-29 12:50:02',	'6c1747f5-708a-4cbc-b833-2893a680134b'),
(6,	6,	1,	'E0 A3764',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:03',	'2025-05-29 12:50:03',	'ffe5af3b-1e64-40fe-92af-4aadb65ad436'),
(7,	7,	1,	'E0 A5671 Luxor Rotterdam Ruben',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:03',	'2025-05-29 12:50:03',	'3051ae39-43b6-4f29-9f78-db9a84f3e8aa'),
(8,	8,	1,	'E0 A5777 Tilburg',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:04',	'2025-05-29 12:50:04',	'aee0c738-74a9-47f3-a1ee-6d7315c61ce8'),
(12,	12,	1,	'E0 A8758',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:06',	'2025-05-29 12:50:06',	'fdc0ebd9-8f7d-494c-948a-bace844e10eb'),
(13,	13,	1,	'E0 A8920',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:10',	'2025-05-29 12:50:10',	'91a50a26-a53d-4ef0-9b9e-a8f7c49d2df5'),
(14,	14,	1,	'E0 A9004',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:14',	'2025-05-29 12:50:14',	'70e904e6-64c0-40ac-9ee3-084e34812e30'),
(16,	16,	1,	'E0 A9151',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:18',	'2025-05-29 12:50:18',	'0e5198b3-7a53-43f7-ae19-0accfa1ad7ef'),
(18,	18,	1,	'E0 A9641',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:22',	'2025-05-29 12:50:22',	'5b573e26-3c97-44cb-9f35-92b21ba2c68b'),
(19,	19,	1,	'E0 A9682 Jenne Stroobants kat Leuven B',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:23',	'2025-05-29 12:50:23',	'908e7d66-417d-4f65-97dc-2f01b5463c63'),
(20,	20,	1,	'MG 0719',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:23',	'2025-05-29 12:50:23',	'a1be8843-7ad2-447e-b6ab-2284ca352d14'),
(21,	21,	1,	'MG 0833',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:25',	'2025-05-29 12:50:25',	'ae872b9f-93b3-416d-bbf4-a62defd0b467'),
(22,	22,	1,	'MG 0889',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:26',	'2025-05-29 12:50:26',	'aada0f4b-7a09-49a0-97ab-4a57a16c1f1d'),
(23,	23,	1,	'MG 1804',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:28',	'2025-05-29 12:50:28',	'856e9f64-3912-442e-9bc5-d12d38761c7c'),
(24,	24,	1,	'MG 2960',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:30',	'2025-05-29 12:50:30',	'1d03ad3b-592f-427c-a5ca-9b1a73bae576'),
(25,	25,	1,	'MG 4136',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:30',	'2025-05-29 12:50:30',	'd539b85c-ad18-447c-b21e-5f185aa32830'),
(26,	26,	1,	'1',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:32',	'2025-05-29 12:50:32',	'6574b5e7-eeed-46e0-88fa-8b46cbfb42e8'),
(28,	28,	1,	'6',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:35',	'2025-05-29 12:50:35',	'368dfe3b-3c88-4366-8851-8fcfbaf67ea5'),
(30,	30,	1,	'10',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:38',	'2025-05-29 12:50:38',	'd96948d7-6fb9-4952-8331-63efd80b5814'),
(31,	31,	1,	'11',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:41',	'2025-05-29 12:50:41',	'cc2accf2-a62c-42e7-a338-042533439e4e'),
(32,	32,	1,	'12',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:51',	'2025-05-29 12:50:51',	'461f668e-3d23-4977-80be-928fb655b79c'),
(34,	34,	1,	'18',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:55',	'2025-05-29 12:50:55',	'237a83cc-de30-4bba-b36b-4094f2604fe9'),
(35,	35,	1,	'21',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:56',	'2025-05-29 12:50:56',	'ec237dee-5359-4794-82ce-da9e27339924'),
(36,	36,	1,	'27',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:50:58',	'2025-05-29 12:50:58',	'e79a0b60-4861-4595-81a5-3069e6bb1413'),
(37,	37,	1,	'28',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:51:03',	'2025-05-29 12:51:03',	'd2aef206-ccb0-4707-96a3-d5ca21018e45'),
(38,	38,	1,	'30',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:51:05',	'2025-05-29 12:51:05',	'cb663e24-dfd3-4b87-97c2-f2de93f286c1'),
(39,	39,	1,	'34',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:51:06',	'2025-05-29 12:51:06',	'f03ad503-eedf-45b2-b8e4-c6bd5232f1f8'),
(40,	40,	1,	'Albert Heijn',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:51:06',	'2025-05-29 12:51:06',	'969e6229-0df6-4eca-92a6-91bab34fc7c8'),
(41,	41,	1,	'B80 V2391',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:51:07',	'2025-05-29 12:51:07',	'ce5fce50-1bcb-48d3-97c1-058c306eedcc'),
(42,	42,	1,	'Bodystyling',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:51:08',	'2025-05-29 12:51:08',	'caf047e3-73cf-4d76-b240-8eba3c0f5959'),
(46,	46,	1,	'Jean Vermaelen MG 9554',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:51:09',	'2025-05-29 12:51:09',	'f992582f-cdb7-43b2-8cd5-f837422eca2a'),
(47,	47,	1,	'Luvanium',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:51:10',	'2025-05-29 12:51:10',	'd456627b-246e-4b3f-82de-604b294504ba'),
(49,	49,	1,	'Primus schuin Definitief',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:51:12',	'2025-05-29 12:51:12',	'5a0b3925-735b-4a3f-9178-21731acb17b0'),
(50,	50,	1,	'Sint Gillis Waas Dullaert Nancy MG 9568',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:51:13',	'2025-05-29 12:51:13',	'361772ad-44c5-4a0f-b923-44dd1bec78d4'),
(51,	51,	1,	'Tongerlo',	NULL,	NULL,	NULL,	1,	'2025-05-29 12:51:14',	'2025-05-29 12:51:14',	'a1d9dc75-404e-4f95-badf-ae6e8f88a658'),
(53,	53,	1,	'Home',	'home',	'__home__',	'{\"4e694147-7371-49a1-af05-8dfcea69a572\": [51, 50, 49, 47, 46, 42, 41, 40]}',	1,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'05bc20dd-37c6-4f1b-ae10-e3e6fc782af8'),
(54,	54,	1,	'Editorial',	'editorial',	NULL,	NULL,	1,	'2025-05-29 12:52:12',	'2025-05-29 12:52:21',	'1adeb639-346f-4be4-9adf-d0f3b1ee16f6'),
(55,	55,	1,	'Food',	'food',	NULL,	NULL,	1,	'2025-05-29 12:52:26',	'2025-05-29 12:52:28',	'67569003-8b79-4878-8dec-6cdb69b3002c'),
(56,	56,	1,	'Portrait',	'portrait',	NULL,	NULL,	1,	'2025-05-29 12:52:30',	'2025-05-29 12:52:33',	'2f5a40cf-74a9-4543-a8a1-83b68be18806'),
(57,	57,	1,	'Travel',	'travel',	NULL,	NULL,	1,	'2025-05-29 12:52:34',	'2025-05-29 12:52:37',	'b044d119-d7de-42c4-a4c7-1791b7a25554'),
(59,	59,	1,	'Home',	'home',	'__home__',	'{\"4e694147-7371-49a1-af05-8dfcea69a572\": [51, 50, 49, 47, 46, 42, 41, 40, 39, 38, 37, 36, 35, 34, 32, 31, 30, 28, 26, 25, 24, 23, 22, 21, 20, 19, 18, 16, 14, 13, 12, 8, 7, 6, 5]}',	1,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'06a76201-071f-4e2b-8a9d-188a93cdd6af');

DROP TABLE IF EXISTS `entries`;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `status` enum('live','pending','expired') NOT NULL DEFAULT 'live',
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pjbomliosqbnaerhconbganvwbihhkzvbpgf` (`postDate`),
  KEY `idx_akcseftsupeeoysmdwbbrrwoyzspssnexema` (`expiryDate`),
  KEY `idx_yewtxieazkloepfalzszgowfrfsgiuoytugw` (`status`),
  KEY `idx_vftmhuwodxumgxqwtjzdfjbbaravjjwivhxu` (`sectionId`),
  KEY `idx_xipfwjndrzbfgyfeqfmydwwsyfgfutdnckfb` (`typeId`),
  KEY `idx_atbeztdmhiuvvxparcdmphpksvvgctzizaxr` (`primaryOwnerId`),
  KEY `idx_pvnjtrqjygpwaxmtautcsjcfnizsujiuhvoz` (`fieldId`),
  KEY `fk_efuspeoczcprzclottjhbqtpcvroweuazipc` (`parentId`),
  CONSTRAINT `fk_dxbklrwarjxnninuddsejppjskfmwkqzmevz` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_efuspeoczcprzclottjhbqtpcvroweuazipc` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gpitsiuenchuztzcsraeyueqnzhcsqwilquh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_napbiplawmpmqkbzxlmgstqdnzsptdsvlvfu` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xxymyoqknzueqlxowayactewuohwixowufob` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_znbtbzpabnsfpfuqiwergmdvsimzrdwguudt` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `primaryOwnerId`, `fieldId`, `typeId`, `postDate`, `expiryDate`, `status`, `deletedWithEntryType`, `deletedWithSection`, `dateCreated`, `dateUpdated`) VALUES
(2,	1,	NULL,	NULL,	NULL,	1,	'2025-05-29 12:49:00',	NULL,	'live',	NULL,	NULL,	'2025-05-29 12:49:16',	'2025-05-29 12:49:16'),
(3,	1,	NULL,	NULL,	NULL,	1,	'2025-05-29 12:49:00',	NULL,	'live',	NULL,	NULL,	'2025-05-29 12:49:16',	'2025-05-29 12:49:16'),
(53,	1,	NULL,	NULL,	NULL,	1,	'2025-05-29 12:49:00',	NULL,	'live',	NULL,	NULL,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27'),
(59,	1,	NULL,	NULL,	NULL,	1,	'2025-05-29 12:49:00',	NULL,	'live',	NULL,	NULL,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04');

DROP TABLE IF EXISTS `entries_authors`;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_bbjesjgxewoqfqgwwlwnwvevtttnxwunddiv` (`authorId`),
  KEY `idx_qkrhkrgczeiyflikptymmqnimmhhtiyjgvjs` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_sycpzywylikmftlcaomfodylmdtdsfmgvfgm` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zofwsnopbbxrlwqjkavbsdrieragatdgucmn` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `entrytypes`;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zigknenhwbyksvphzijdjdvvvmerosqjrcnx` (`fieldLayoutId`),
  KEY `idx_hkwrqztdjxjwjxzuglwlehbuzlyosxwxudml` (`dateDeleted`),
  CONSTRAINT `fk_ufwghvuqikekbpbeqrzgzybpwivqhomjudpi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `entrytypes` (`id`, `fieldLayoutId`, `name`, `handle`, `icon`, `color`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `showSlugField`, `slugTranslationMethod`, `slugTranslationKeyFormat`, `showStatusField`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1,	3,	'Pagina',	'pagina',	NULL,	NULL,	1,	'site',	NULL,	NULL,	1,	'site',	NULL,	1,	'2025-05-29 12:49:14',	'2025-05-29 12:49:14',	NULL,	'96da3f18-1b13-4c2c-8aff-47ceb2649faa');

DROP TABLE IF EXISTS `fieldlayouts`;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wyppoukjbnkhshpxuawsbttkuelmtjwlbjxm` (`dateDeleted`),
  KEY `idx_shiexnjhjrsqwooonmirkoiyqjurzcqiudud` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `fieldlayouts` (`id`, `type`, `config`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1,	'craft\\elements\\Asset',	'{\"tabs\": [{\"uid\": \"f3a448a4-4756-41db-abd9-2a51c2001c31\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"cabdfd58-f25d-438f-a7d7-d85cd199bb69\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2025-05-29T12:44:32+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}',	'2025-05-29 12:46:38',	'2025-05-29 12:46:38',	NULL,	'253cb58d-042b-4daf-9f62-c3529129178c'),
(2,	'craft\\elements\\Category',	'{\"tabs\": [{\"uid\": \"fa68df4b-37fa-47e4-9daf-da0da5f4aa32\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"c7f81365-3fdd-4577-a30c-f96f0bfee72a\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\TitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2025-05-29T12:46:51+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}',	'2025-05-29 12:48:19',	'2025-05-29 12:48:19',	NULL,	'4f37b290-0185-4989-aa9b-44ada4ebc148'),
(3,	'craft\\elements\\Entry',	'{\"tabs\": [{\"uid\": \"8af656aa-fd76-44df-bf70-3cfd90e351a3\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"acd5acc0-0247-42b1-bcb2-a3ee3005c71a\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-05-29T12:47:54+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"4e694147-7371-49a1-af05-8dfcea69a572\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"6ce5706b-7cce-45e2-b3d7-ebbf369ed760\", \"required\": false, \"dateAdded\": \"2025-05-29T12:49:14+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": []}',	'2025-05-29 12:49:14',	'2025-05-29 12:49:14',	NULL,	'14901adf-eaef-4019-835b-c7b2ebc929a4');

DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jutdwyfrpeejvunxybenhnpsymyudkpsggry` (`handle`,`context`),
  KEY `idx_fbtztmhfaoytftdjaffaytkfaerpilbcochr` (`context`),
  KEY `idx_sckahgadsgucjcclzxcmbdbnhpgecddugqau` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `fields` (`id`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1,	'Fotogalerij',	'fotogalerij',	'global',	NULL,	NULL,	0,	'none',	NULL,	'craft\\fields\\Assets',	'{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}',	'2025-05-29 12:47:35',	'2025-05-29 12:47:35',	NULL,	'6ce5706b-7cce-45e2-b3d7-ebbf369ed760');

DROP TABLE IF EXISTS `globalsets`;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zdkqyzlnedfpjzvyfowgszqihnwvqyiethrh` (`name`),
  KEY `idx_khmoyobajcqcwtdvjhkidxlmxriphvdfwsrn` (`handle`),
  KEY `idx_iyuwcpppiewvjxryvqxnbiqaizntpxbgjylx` (`fieldLayoutId`),
  KEY `idx_fgsnubczussfixjljnikbykwigfwjfwkepqk` (`sortOrder`),
  CONSTRAINT `fk_kyylinyjamdhpitflrshcqygjahlqnavpllp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qhxsvodmrxhdlobcxserfdqsowcdjfoshngt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `gqlschemas`;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `gqltokens`;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cqvbngxitvyafexibowtcbwaussippwbcepx` (`accessToken`),
  UNIQUE KEY `idx_ssqozswkjviumkupffffdfqjscgpmyirjtba` (`name`),
  KEY `fk_ecencdcmrujakuwbmmedkpwtpxmbghtepbfw` (`schemaId`),
  CONSTRAINT `fk_ecencdcmrujakuwbmmedkpwtpxmbghtepbfw` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `imagetransformindex`;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qrxqnmcukkrswlnnsrbcsflbzzpuexullwap` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1,	51,	'craft\\imagetransforms\\ImageTransformer',	'Tongerlo.jpg',	NULL,	'_20x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:55',	'2a31dc49-f9c9-4178-ab4e-0f4356f4aa96'),
(2,	51,	'craft\\imagetransforms\\ImageTransformer',	'Tongerlo.jpg',	NULL,	'_41x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:56',	'4ba55a59-33c8-4f13-a2c0-ca3ea969367a'),
(3,	50,	'craft\\imagetransforms\\ImageTransformer',	'Sint-Gillis-Waas-Dullaert-Nancy_MG_9568.jpg',	NULL,	'_20x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:55',	'647d8936-5410-4e1e-903d-bbcb682fffdd'),
(4,	50,	'craft\\imagetransforms\\ImageTransformer',	'Sint-Gillis-Waas-Dullaert-Nancy_MG_9568.jpg',	NULL,	'_40x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:56',	'dfdad2bf-4cd5-4830-b571-2b74fc4475ce'),
(5,	49,	'craft\\imagetransforms\\ImageTransformer',	'Primus-schuin-Definitief.jpg',	NULL,	'_22x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:55',	'3e849f64-48d9-4d5d-a252-0a7c0363f301'),
(6,	49,	'craft\\imagetransforms\\ImageTransformer',	'Primus-schuin-Definitief.jpg',	NULL,	'_44x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:56',	'1f1b4569-9452-485c-a5cd-f88761636394'),
(7,	47,	'craft\\imagetransforms\\ImageTransformer',	'Luvanium.jpg',	NULL,	'_24x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:55',	'9859e948-e630-4baf-8dc8-3da3b5ba323a'),
(8,	47,	'craft\\imagetransforms\\ImageTransformer',	'Luvanium.jpg',	NULL,	'_48x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:56',	'307d2758-21df-4562-b07c-35650504b573'),
(9,	46,	'craft\\imagetransforms\\ImageTransformer',	'Jean-Vermaelen_MG_9554.jpg',	NULL,	'_20x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:55',	'585ab89a-b581-46ac-96f2-f69ba256786c'),
(10,	46,	'craft\\imagetransforms\\ImageTransformer',	'Jean-Vermaelen_MG_9554.jpg',	NULL,	'_40x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:56',	'5108e1da-c5ce-4a8b-b580-fc7b927feca7'),
(11,	42,	'craft\\imagetransforms\\ImageTransformer',	'Bodystyling.jpg',	NULL,	'_30x11_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:56',	'5acfa77c-c0c8-407e-a515-07c863336963'),
(12,	42,	'craft\\imagetransforms\\ImageTransformer',	'Bodystyling.jpg',	NULL,	'_60x22_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:56',	'1a9d8d19-cd5a-4730-ba73-7953805f6ca2'),
(13,	41,	'craft\\imagetransforms\\ImageTransformer',	'B80V2391.jpg',	NULL,	'_19x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:56',	'14d9f747-56af-4856-a031-f0af64d54af1'),
(14,	41,	'craft\\imagetransforms\\ImageTransformer',	'B80V2391.jpg',	NULL,	'_39x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:56',	'fa0f5adf-4193-49ff-b5d2-fdd27ebaf528'),
(15,	40,	'craft\\imagetransforms\\ImageTransformer',	'Albert-Heijn.jpg',	NULL,	'_30x15_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:56',	'069b4473-d909-40e7-8a30-f78cddd6b8e8'),
(16,	40,	'craft\\imagetransforms\\ImageTransformer',	'Albert-Heijn.jpg',	NULL,	'_60x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:54',	'2025-05-29 13:00:54',	'2025-05-29 13:00:56',	'460c066e-2f7a-4ebf-a83a-cb2267e78068'),
(17,	39,	'craft\\imagetransforms\\ImageTransformer',	'34.jpg',	NULL,	'_30x20_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:00:58',	'63613178-017c-4e49-b37b-a777fdd6c21e'),
(18,	39,	'craft\\imagetransforms\\ImageTransformer',	'34.jpg',	NULL,	'_60x40_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:05',	'205af4ec-996e-4a2b-b769-7c74297bc36b'),
(19,	38,	'craft\\imagetransforms\\ImageTransformer',	'30.jpg',	NULL,	'_30x18_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:00:58',	'e2d0473b-970e-4790-8b42-bb1d8b271e0b'),
(20,	38,	'craft\\imagetransforms\\ImageTransformer',	'30.jpg',	NULL,	'_60x37_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:05',	'b3dc9dde-3674-4e22-b478-24f6fbba49b7'),
(21,	37,	'craft\\imagetransforms\\ImageTransformer',	'28.jpg',	NULL,	'_30x21_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:00:58',	'654bcea2-da42-4451-9381-a3223ea03773'),
(22,	37,	'craft\\imagetransforms\\ImageTransformer',	'28.jpg',	NULL,	'_60x43_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:05',	'9e040df3-2987-4687-a9db-528bf3c3cd3b'),
(23,	36,	'craft\\imagetransforms\\ImageTransformer',	'27.jpg',	NULL,	'_30x20_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:00:58',	'e8154b1d-fada-41e9-802c-962a3ea237c0'),
(24,	36,	'craft\\imagetransforms\\ImageTransformer',	'27.jpg',	NULL,	'_60x40_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:05',	'3ce0c7e9-2000-48ce-84c3-3e7c8a4acaca'),
(25,	35,	'craft\\imagetransforms\\ImageTransformer',	'21.jpg',	NULL,	'_30x20_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:00:58',	'85b64485-5665-4af3-a7fb-789f29003898'),
(26,	35,	'craft\\imagetransforms\\ImageTransformer',	'21.jpg',	NULL,	'_60x41_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:05',	'1b5be4b6-0651-45f8-8a71-e3220951a8a5'),
(27,	34,	'craft\\imagetransforms\\ImageTransformer',	'18.jpg',	NULL,	'_30x12_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:00:59',	'5979f99b-0b84-4c8a-ae60-6a4cc7216b70'),
(28,	34,	'craft\\imagetransforms\\ImageTransformer',	'18.jpg',	NULL,	'_60x24_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:05',	'79f2affc-4584-454c-8344-7614f476382f'),
(29,	32,	'craft\\imagetransforms\\ImageTransformer',	'12.jpg',	NULL,	'_30x11_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:00:59',	'e8c86528-13ac-447b-b851-239efccb8f08'),
(30,	32,	'craft\\imagetransforms\\ImageTransformer',	'12.jpg',	NULL,	'_60x22_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:06',	'bd216946-2dec-41b5-8493-a57879b91955'),
(31,	31,	'craft\\imagetransforms\\ImageTransformer',	'11.jpg',	NULL,	'_30x19_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:00:59',	'2a1017ab-6e02-457e-956f-26138b9bf06b'),
(32,	31,	'craft\\imagetransforms\\ImageTransformer',	'11.jpg',	NULL,	'_60x39_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:06',	'39dfa8d8-f700-4d8c-a494-ea073d53bba7'),
(33,	30,	'craft\\imagetransforms\\ImageTransformer',	'10.jpg',	NULL,	'_19x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:00:59',	'22ab61e0-d59b-4cd6-bb9f-70ca4d54a57f'),
(34,	30,	'craft\\imagetransforms\\ImageTransformer',	'10.jpg',	NULL,	'_39x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:06',	'ca5b15a3-593f-487c-8a9f-5762253987df'),
(35,	28,	'craft\\imagetransforms\\ImageTransformer',	'6.jpg',	NULL,	'_19x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:00:59',	'3e94236c-6ffe-4f14-b5c1-4f588754299f'),
(36,	28,	'craft\\imagetransforms\\ImageTransformer',	'6.jpg',	NULL,	'_39x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:06',	'28ec13af-c4ab-4034-8d94-f7bbfaba3fbc'),
(37,	26,	'craft\\imagetransforms\\ImageTransformer',	'1.jpg',	NULL,	'_30x19_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:00',	'cdaa7bdc-8b67-418c-8f90-111c6ff250ed'),
(38,	26,	'craft\\imagetransforms\\ImageTransformer',	'1.jpg',	NULL,	'_60x39_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:07',	'340d5b71-98e8-4852-b0bc-856083b3364b'),
(39,	25,	'craft\\imagetransforms\\ImageTransformer',	'MG_4136.jpg',	NULL,	'_20x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:00',	'c3a7255e-cc54-4bb4-839d-c9e89c2afd02'),
(40,	25,	'craft\\imagetransforms\\ImageTransformer',	'MG_4136.jpg',	NULL,	'_40x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:07',	'a84d4b06-4285-47f2-80aa-5c08b8a9ac8b'),
(41,	24,	'craft\\imagetransforms\\ImageTransformer',	'MG_2960.jpg',	NULL,	'_20x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:00',	'adb0ace4-fbe9-419b-9917-eadc18f4b45e'),
(42,	24,	'craft\\imagetransforms\\ImageTransformer',	'MG_2960.jpg',	NULL,	'_40x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:07',	'8a8328a7-193e-41a4-b5e6-319045b1c207'),
(43,	23,	'craft\\imagetransforms\\ImageTransformer',	'MG_1804.jpg',	NULL,	'_20x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:01',	'd2332d70-0781-4272-bc56-7ea358f95f30'),
(44,	23,	'craft\\imagetransforms\\ImageTransformer',	'MG_1804.jpg',	NULL,	'_40x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:07',	'1fcaf2c8-cd2f-435d-9881-2a1008f1c9d4'),
(45,	22,	'craft\\imagetransforms\\ImageTransformer',	'MG_0889.jpg',	NULL,	'_30x20_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:01',	'f97209fd-819d-48f9-a4da-3c8d36207380'),
(46,	22,	'craft\\imagetransforms\\ImageTransformer',	'MG_0889.jpg',	NULL,	'_60x40_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:08',	'11e894b4-7b63-4f6b-89e2-aefb1e4070bb'),
(47,	21,	'craft\\imagetransforms\\ImageTransformer',	'MG_0833.jpg',	NULL,	'_30x20_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:01',	'f5bc2514-5e6d-4712-911d-fe1237c40017'),
(48,	21,	'craft\\imagetransforms\\ImageTransformer',	'MG_0833.jpg',	NULL,	'_60x40_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:08',	'209d48ee-92b3-4a59-8e89-b65e1b47f3bd'),
(49,	20,	'craft\\imagetransforms\\ImageTransformer',	'MG_0719.jpg',	NULL,	'_30x20_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:02',	'91e668cb-4a10-49e8-b82c-66e0c7927002'),
(50,	20,	'craft\\imagetransforms\\ImageTransformer',	'MG_0719.jpg',	NULL,	'_60x40_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:08',	'0d945387-b312-46a0-8f0a-880d5ad9ac04'),
(51,	19,	'craft\\imagetransforms\\ImageTransformer',	'E0A9682-Jenne-Stroobants-kat-Leuven-B.jpg',	NULL,	'_19x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:02',	'4fc93dd1-3aed-4d29-acd8-677acb120588'),
(52,	19,	'craft\\imagetransforms\\ImageTransformer',	'E0A9682-Jenne-Stroobants-kat-Leuven-B.jpg',	NULL,	'_39x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:08',	'806fdfe4-bff5-4415-8777-25a7ac2907a9'),
(53,	18,	'craft\\imagetransforms\\ImageTransformer',	'E0A9641.jpg',	NULL,	'_30x20_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:02',	'7625afd2-ae14-45fd-a213-5ebe32d7e465'),
(54,	18,	'craft\\imagetransforms\\ImageTransformer',	'E0A9641.jpg',	NULL,	'_60x40_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:09',	'c30c24a4-e422-4091-9764-e0b6bc2fce2c'),
(55,	16,	'craft\\imagetransforms\\ImageTransformer',	'E0A9151.jpg',	NULL,	'_20x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:02',	'2dc1b6fd-21c3-47f2-a8e1-177ae819abfd'),
(56,	16,	'craft\\imagetransforms\\ImageTransformer',	'E0A9151.jpg',	NULL,	'_40x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:09',	'44979218-3633-483c-8b34-9a16a59c1b70'),
(57,	14,	'craft\\imagetransforms\\ImageTransformer',	'E0A9004.jpg',	NULL,	'_20x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:02',	'29974074-a1ac-4d6e-bd4d-38c68ebd4080'),
(58,	14,	'craft\\imagetransforms\\ImageTransformer',	'E0A9004.jpg',	NULL,	'_40x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:09',	'c99da189-a9d8-4710-98c5-18ae646cab4b'),
(59,	13,	'craft\\imagetransforms\\ImageTransformer',	'E0A8920.jpg',	NULL,	'_19x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:03',	'3ee1c358-202d-4a68-a2a0-872829315686'),
(60,	13,	'craft\\imagetransforms\\ImageTransformer',	'E0A8920.jpg',	NULL,	'_39x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:09',	'7796052b-e5c0-419c-98d3-1c5a1c05cdd8'),
(61,	12,	'craft\\imagetransforms\\ImageTransformer',	'E0A8758.jpg',	NULL,	'_20x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:03',	'd41bb635-0ab6-4331-88e1-8fadf9ed00b8'),
(62,	12,	'craft\\imagetransforms\\ImageTransformer',	'E0A8758.jpg',	NULL,	'_40x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:10',	'8cd28859-ef1e-4fe6-93e3-5986e5b6092c'),
(63,	8,	'craft\\imagetransforms\\ImageTransformer',	'E0A5777Tilburg.jpg',	NULL,	'_30x8_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:04',	'81a9be97-741e-4e68-8d23-b4e73fc2ef5b'),
(64,	8,	'craft\\imagetransforms\\ImageTransformer',	'E0A5777Tilburg.jpg',	NULL,	'_60x17_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:10',	'74f17d64-550b-4cf6-93ce-76ab063bd55b'),
(65,	7,	'craft\\imagetransforms\\ImageTransformer',	'E0A5671-Luxor-Rotterdam-Ruben.jpg',	NULL,	'_30x8_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:04',	'298e1832-bfa4-4a66-b67d-b92f983fafb5'),
(66,	7,	'craft\\imagetransforms\\ImageTransformer',	'E0A5671-Luxor-Rotterdam-Ruben.jpg',	NULL,	'_60x17_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:10',	'c478bc00-ee58-4529-b206-c402424057f2'),
(67,	6,	'craft\\imagetransforms\\ImageTransformer',	'E0A3764.jpg',	NULL,	'_18x30_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:04',	'68493f46-df2a-4dfe-94fd-2e52042f6323'),
(68,	6,	'craft\\imagetransforms\\ImageTransformer',	'E0A3764.jpg',	NULL,	'_37x60_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:10',	'e466f714-694a-4958-a65e-5ba58392b31f'),
(69,	5,	'craft\\imagetransforms\\ImageTransformer',	'E0A2832.jpg',	NULL,	'_30x20_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:04',	'0fd519c7-1533-4746-a54d-f4ec39104c7e'),
(70,	5,	'craft\\imagetransforms\\ImageTransformer',	'E0A2832.jpg',	NULL,	'_60x40_crop_center-center_none',	1,	0,	0,	'2025-05-29 13:00:57',	'2025-05-29 13:00:57',	'2025-05-29 13:01:10',	'c7315e36-20fb-49ed-bd56-27ecf0d2f0fb');

DROP TABLE IF EXISTS `imagetransforms`;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vcdzrqmqmuukievynitljicozsyxpqfaijse` (`name`),
  KEY `idx_nqojldmcwrodpzhnnktvliwluqhmhknwxqvz` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1,	'5.7.8',	'5.7.0.3',	0,	'nqzuzlzpaycs',	'3@kbuefznmiw',	'2025-05-29 10:18:35',	'2025-05-29 13:00:24',	'69e27fce-042e-4e26-ac28-46abbb3ff56b');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nwalkubeeplkkzsujeoodkcyoigvchqfacie` (`track`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1,	'craft',	'Install',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'16cf4bec-6bad-4f86-ac4a-1120e9200be6'),
(2,	'craft',	'm221101_115859_create_entries_authors_table',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'84e75b12-d5b5-4f9c-9110-7bb281e6242e'),
(3,	'craft',	'm221107_112121_add_max_authors_to_sections',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'3969b08f-a52f-4078-a6ca-7f05819ecb58'),
(4,	'craft',	'm221205_082005_translatable_asset_alt_text',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'e3c1602d-f608-46df-95f5-6b463f252ff8'),
(5,	'craft',	'm230314_110309_add_authenticator_table',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'06fd6741-2a80-471b-9bbb-cd96e5bcc2e9'),
(6,	'craft',	'm230314_111234_add_webauthn_table',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'050c9dd1-66d6-46ee-ac64-dd33975e6c44'),
(7,	'craft',	'm230503_120303_add_recoverycodes_table',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'f4b88e34-e642-4c4c-a2fa-42d1fe6a9c12'),
(8,	'craft',	'm230511_000000_field_layout_configs',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'5da539bf-05ae-4d7c-806e-a4019a9d6ba7'),
(9,	'craft',	'm230511_215903_content_refactor',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'18572b1c-1f67-4aa0-b00b-a525697bf86f'),
(10,	'craft',	'm230524_000000_add_entry_type_show_slug_field',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2631df96-7446-4b74-b24a-2490d88e43ed'),
(11,	'craft',	'm230524_000001_entry_type_icons',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'bc5baddf-6da7-44b3-bd48-fc385b708bc5'),
(12,	'craft',	'm230524_000002_entry_type_colors',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'bc19385d-b3b5-4106-bf70-5223e931d6e7'),
(13,	'craft',	'm230524_220029_global_entry_types',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'707d0bb3-430e-4f2b-af66-c388e53d7ec7'),
(14,	'craft',	'm230531_123004_add_entry_type_show_status_field',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'eef5050e-808d-42d8-afae-0eb84883f6fc'),
(15,	'craft',	'm230607_102049_add_entrytype_slug_translation_columns',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'ee23c0ac-dc44-4197-94d1-cbc75794ff5f'),
(16,	'craft',	'm230616_173810_kill_field_groups',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'09303d1c-542d-467e-a588-a6c7d04dc5eb'),
(17,	'craft',	'm230616_183820_remove_field_name_limit',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'7cc81d3d-3283-4c4f-8cdb-9a20d51e32f2'),
(18,	'craft',	'm230617_070415_entrify_matrix_blocks',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'd3075c59-7e38-4659-9bb9-39cfc7dce870'),
(19,	'craft',	'm230710_162700_element_activity',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2f620d5f-b3b4-499f-9c85-96eaf87a3bd3'),
(20,	'craft',	'm230820_162023_fix_cache_id_type',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'd3e3dfe4-f945-419a-bba0-bb7ba6cb8e0a'),
(21,	'craft',	'm230826_094050_fix_session_id_type',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'85d714e8-0d3b-4266-875a-11a63ab5887b'),
(22,	'craft',	'm230904_190356_address_fields',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'1bfecefb-064d-4141-94fc-69ab9b472443'),
(23,	'craft',	'm230928_144045_add_subpath_to_volumes',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'ab3f79f9-abbf-45bd-8f1a-67c42b00b3cc'),
(24,	'craft',	'm231013_185640_changedfields_amend_primary_key',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'cca9a6cd-2be5-4974-9fda-b4539ed81865'),
(25,	'craft',	'm231213_030600_element_bulk_ops',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'bbaec2dd-d66a-4ffe-b864-8f76c50d2362'),
(26,	'craft',	'm240129_150719_sites_language_amend_length',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'12a099a6-77ad-42d7-8d49-8b8962bcb3cf'),
(27,	'craft',	'm240206_035135_convert_json_columns',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'fa78fd57-35d7-47f9-ae4c-a143b496c4c0'),
(28,	'craft',	'm240207_182452_address_line_3',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'c4a22ac4-a2b0-4fac-a1a9-48df00b18a82'),
(29,	'craft',	'm240302_212719_solo_preview_targets',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'443a7a16-69f1-4b75-819e-6bef0252ed86'),
(30,	'craft',	'm240619_091352_add_auth_2fa_timestamp',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'5ec8700c-8e90-44ef-8146-a87cc6aff84d'),
(31,	'craft',	'm240723_214330_drop_bulkop_fk',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'bae45c15-3fb0-4bf2-a0b6-be35562bd154'),
(32,	'craft',	'm240731_053543_soft_delete_fields',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2492f37c-f136-4e8b-8215-48403f4e884b'),
(33,	'craft',	'm240805_154041_sso_identities',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'e0653a60-bd4b-441c-8756-d347cf07f1eb'),
(34,	'craft',	'm240926_202248_track_entries_deleted_with_section',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'4d696708-3d8c-40fc-9830-bd105ba1a29a'),
(35,	'craft',	'm241120_190905_user_affiliated_sites',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'd1ad4b98-95dd-46db-8237-bc22092e13e7'),
(36,	'craft',	'm241125_122914_add_viewUsers_permission',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'67d7d7bd-2176-4c5f-9ff4-38817a3fdb3c'),
(37,	'craft',	'm250119_135304_entry_type_overrides',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'9cc10e3e-4d04-4445-a64c-c6cb8a5a1b57'),
(38,	'craft',	'm250206_135036_search_index_queue',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'a3b7e549-4591-4296-8b4c-574b1fe241d9'),
(39,	'craft',	'm250207_172349_bulkop_events',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'686db788-90e0-41e2-9244-2f0c158c4f8b'),
(40,	'craft',	'm250315_131608_unlimited_authors',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'6ca46523-e582-498d-973a-552b1d3b89e8'),
(41,	'craft',	'm250403_171253_static_statuses',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'bfa3a793-0534-4c31-8095-13b2c93b7bb6');

DROP TABLE IF EXISTS `plugins`;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rnjpreuxgjgtppnkdrozmwkcsdqlwibcqrgq` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `projectconfig`;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.defaultPlacement',	'\"end\"'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elementCondition',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.autocapitalize',	'true'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.autocomplete',	'false'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.autocorrect',	'true'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.class',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.dateAdded',	'\"2025-05-29T12:46:51+00:00\"'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.disabled',	'false'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.elementCondition',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.id',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.includeInCards',	'false'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.inputType',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.instructions',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.label',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.max',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.min',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.name',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.orientation',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.placeholder',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.providesThumbs',	'false'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.readonly',	'false'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.requirable',	'false'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.size',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.step',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.tip',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.title',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.type',	'\"craft\\\\fieldlayoutelements\\\\TitleField\"'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.uid',	'\"c7f81365-3fdd-4577-a30c-f96f0bfee72a\"'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.userCondition',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.warning',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.elements.0.width',	'100'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.name',	'\"Content\"'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.uid',	'\"fa68df4b-37fa-47e4-9daf-da0da5f4aa32\"'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.fieldLayouts.4f37b290-0185-4989-aa9b-44ada4ebc148.tabs.0.userCondition',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.handle',	'\"fotocategorieen\"'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.name',	'\"Categoriëen\"'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.siteSettings.dd6e4919-ff41-4207-af9c-630665454e96.hasUrls',	'false'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.siteSettings.dd6e4919-ff41-4207-af9c-630665454e96.template',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.siteSettings.dd6e4919-ff41-4207-af9c-630665454e96.uriFormat',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.structure.maxLevels',	'null'),
('categoryGroups.090fa9d9-5044-4ffd-8db1-3476adc09b0e.structure.uid',	'\"83cb782f-9b4d-4704-ba09-34044903534d\"'),
('dateModified',	'1748523624'),
('email.fromEmail',	'\"admin@janhendrickx.be\"'),
('email.fromName',	'\"The Annie Club\"'),
('email.transportType',	'\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.color',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elementCondition',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.autocapitalize',	'true'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.autocomplete',	'false'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.autocorrect',	'true'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.class',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.dateAdded',	'\"2025-05-29T12:47:54+00:00\"'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.disabled',	'false'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.elementCondition',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.id',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.includeInCards',	'false'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.inputType',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.instructions',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.label',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.max',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.min',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.name',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.orientation',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.placeholder',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.providesThumbs',	'false'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.readonly',	'false'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.required',	'true'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.size',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.step',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.tip',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.title',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.type',	'\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.uid',	'\"acd5acc0-0247-42b1-bcb2-a3ee3005c71a\"'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.userCondition',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.warning',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.0.width',	'100'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.dateAdded',	'\"2025-05-29T12:49:14+00:00\"'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.editCondition',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.elementCondition',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.fieldUid',	'\"6ce5706b-7cce-45e2-b3d7-ebbf369ed760\"'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.handle',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.includeInCards',	'false'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.instructions',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.label',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.providesThumbs',	'false'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.required',	'false'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.tip',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.type',	'\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.uid',	'\"4e694147-7371-49a1-af05-8dfcea69a572\"'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.userCondition',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.warning',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.elements.1.width',	'100'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.name',	'\"Content\"'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.uid',	'\"8af656aa-fd76-44df-bf70-3cfd90e351a3\"'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.fieldLayouts.14901adf-eaef-4019-835b-c7b2ebc929a4.tabs.0.userCondition',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.handle',	'\"pagina\"'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.hasTitleField',	'true'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.icon',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.name',	'\"Pagina\"'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.showSlugField',	'true'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.showStatusField',	'true'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.slugTranslationKeyFormat',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.slugTranslationMethod',	'\"site\"'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.titleFormat',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.titleTranslationKeyFormat',	'null'),
('entryTypes.96da3f18-1b13-4c2c-8aff-47ceb2649faa.titleTranslationMethod',	'\"site\"'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.columnSuffix',	'null'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.handle',	'\"fotogalerij\"'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.instructions',	'null'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.name',	'\"Fotogalerij\"'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.searchable',	'false'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.allowedKinds',	'null'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.allowSelfRelations',	'false'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.allowSubfolders',	'false'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.allowUploads',	'true'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.branchLimit',	'null'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.defaultPlacement',	'\"end\"'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.defaultUploadLocationSource',	'\"volume:6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8\"'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.defaultUploadLocationSubpath',	'null'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.maintainHierarchy',	'false'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.maxRelations',	'null'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.minRelations',	'null'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.previewMode',	'\"full\"'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.restrictedDefaultUploadSubpath',	'null'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.restrictedLocationSource',	'\"volume:6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8\"'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.restrictedLocationSubpath',	'null'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.restrictFiles',	'false'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.restrictLocation',	'true'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.selectionLabel',	'null'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.showCardsInGrid',	'false'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.showSiteMenu',	'false'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.showUnpermittedFiles',	'false'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.showUnpermittedVolumes',	'false'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.sources',	'\"*\"'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.targetSiteId',	'null'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.validateRelatedElements',	'false'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.settings.viewMode',	'\"list\"'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.translationKeyFormat',	'null'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.translationMethod',	'\"none\"'),
('fields.6ce5706b-7cce-45e2-b3d7-ebbf369ed760.type',	'\"craft\\\\fields\\\\Assets\"'),
('fs.bestanden.hasUrls',	'true'),
('fs.bestanden.name',	'\"Bestanden\"'),
('fs.bestanden.settings.path',	'\"@webroot/uploads/fotos\"'),
('fs.bestanden.type',	'\"craft\\\\fs\\\\Local\"'),
('fs.bestanden.url',	'\"@web/uploads/fotos\"'),
('graphql.publicToken.enabled',	'false'),
('graphql.publicToken.expiryDate',	'null'),
('meta.__names__.090fa9d9-5044-4ffd-8db1-3476adc09b0e',	'\"Categoriëen\"'),
('meta.__names__.460ec1d4-502a-4553-82f2-23c3f41054a7',	'\"Home\"'),
('meta.__names__.6ce5706b-7cce-45e2-b3d7-ebbf369ed760',	'\"Fotogalerij\"'),
('meta.__names__.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8',	'\"Foto\'s\"'),
('meta.__names__.702fb49c-145b-4804-9326-248b64c7d98c',	'\"The Annie Club\"'),
('meta.__names__.96da3f18-1b13-4c2c-8aff-47ceb2649faa',	'\"Pagina\"'),
('meta.__names__.dd6e4919-ff41-4207-af9c-630665454e96',	'\"The Annie Club\"'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.defaultPlacement',	'\"end\"'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.enableVersioning',	'true'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.entryTypes.0.uid',	'\"96da3f18-1b13-4c2c-8aff-47ceb2649faa\"'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.handle',	'\"homepage\"'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.maxAuthors',	'1'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.name',	'\"Home\"'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.previewTargets.0.__assoc__.0.0',	'\"label\"'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.previewTargets.0.__assoc__.0.1',	'\"Primary entry page\"'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.previewTargets.0.__assoc__.1.0',	'\"urlFormat\"'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.previewTargets.0.__assoc__.1.1',	'\"{url}\"'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.previewTargets.0.__assoc__.2.0',	'\"refresh\"'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.previewTargets.0.__assoc__.2.1',	'\"1\"'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.propagationMethod',	'\"all\"'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.siteSettings.dd6e4919-ff41-4207-af9c-630665454e96.enabledByDefault',	'true'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.siteSettings.dd6e4919-ff41-4207-af9c-630665454e96.hasUrls',	'true'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.siteSettings.dd6e4919-ff41-4207-af9c-630665454e96.template',	'\"index.twig\"'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.siteSettings.dd6e4919-ff41-4207-af9c-630665454e96.uriFormat',	'\"__home__\"'),
('sections.460ec1d4-502a-4553-82f2-23c3f41054a7.type',	'\"single\"'),
('siteGroups.702fb49c-145b-4804-9326-248b64c7d98c.name',	'\"The Annie Club\"'),
('sites.dd6e4919-ff41-4207-af9c-630665454e96.baseUrl',	'\"http://the-annie-club.local/\"'),
('sites.dd6e4919-ff41-4207-af9c-630665454e96.enabled',	'true'),
('sites.dd6e4919-ff41-4207-af9c-630665454e96.handle',	'\"default\"'),
('sites.dd6e4919-ff41-4207-af9c-630665454e96.hasUrls',	'true'),
('sites.dd6e4919-ff41-4207-af9c-630665454e96.language',	'\"nl\"'),
('sites.dd6e4919-ff41-4207-af9c-630665454e96.name',	'\"The Annie Club\"'),
('sites.dd6e4919-ff41-4207-af9c-630665454e96.primary',	'true'),
('sites.dd6e4919-ff41-4207-af9c-630665454e96.siteGroup',	'\"702fb49c-145b-4804-9326-248b64c7d98c\"'),
('sites.dd6e4919-ff41-4207-af9c-630665454e96.sortOrder',	'1'),
('system.edition',	'\"solo\"'),
('system.live',	'true'),
('system.name',	'\"The Annie Club\"'),
('system.retryDuration',	'null'),
('system.schemaVersion',	'\"5.7.0.3\"'),
('system.timeZone',	'\"Europe/Brussels\"'),
('users.allowPublicRegistration',	'false'),
('users.defaultGroup',	'null'),
('users.photoSubpath',	'null'),
('users.photoVolumeUid',	'null'),
('users.require2fa',	'false'),
('users.requireEmailVerification',	'true'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.altTranslationKeyFormat',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.altTranslationMethod',	'\"none\"'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elementCondition',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.autocapitalize',	'true'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.autocomplete',	'false'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.autocorrect',	'true'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.class',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.dateAdded',	'\"2025-05-29T12:44:32+00:00\"'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.disabled',	'false'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.elementCondition',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.id',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.includeInCards',	'false'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.inputType',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.instructions',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.label',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.max',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.min',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.name',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.orientation',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.placeholder',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.providesThumbs',	'false'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.readonly',	'false'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.requirable',	'false'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.size',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.step',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.tip',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.title',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.type',	'\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.uid',	'\"cabdfd58-f25d-438f-a7d7-d85cd199bb69\"'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.userCondition',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.warning',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.elements.0.width',	'100'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.name',	'\"Content\"'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.uid',	'\"f3a448a4-4756-41db-abd9-2a51c2001c31\"'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fieldLayouts.253cb58d-042b-4daf-9f62-c3529129178c.tabs.0.userCondition',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.fs',	'\"bestanden\"'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.handle',	'\"fotos\"'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.name',	'\"Foto\'s\"'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.sortOrder',	'1'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.subpath',	'\"\"'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.titleTranslationKeyFormat',	'null'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.titleTranslationMethod',	'\"site\"'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.transformFs',	'\"\"'),
('volumes.6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8.transformSubpath',	'\"\"');

DROP TABLE IF EXISTS `queue`;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_mjnxglusyqgbgxzjkrgtkmrfigvsmufomabr` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_lfzevptxcjdrhsfvfvglvcsaanpkeqwdvnus` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `recoverycodes`;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `relations`;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fdhgimmdimhybrhxcgdzsuglanrotbrswqoz` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_spwbekjtxuffemnngqgwakwkwnfezgmondop` (`sourceId`),
  KEY `idx_zvnlokdaweesllcjqzfjjsfvckuqqnbanfeu` (`targetId`),
  KEY `idx_iodrcvwkxatxhwvaljghkfxewgsymiirkzhf` (`sourceSiteId`),
  CONSTRAINT `fk_aqejkckksjqwvchcnuynzzjfqbeurecaatbm` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mjpfgxrbldtbljqrcecjclzayaashkzkblcq` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mrhpukpgftamamtfrbusaacvvkebbhgujdme` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(9,	1,	2,	NULL,	51,	1,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'fe170289-aa6e-4f8c-ae5e-d74a482a4c1c'),
(10,	1,	2,	NULL,	50,	2,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'3738e21a-99db-4e25-a0af-7cf256015541'),
(11,	1,	2,	NULL,	49,	3,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'efb5d287-0b1d-404b-86d1-ebc681eb4571'),
(12,	1,	2,	NULL,	47,	4,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'bf8d6ac0-7c4e-41d8-a92a-aced54eb20f7'),
(13,	1,	2,	NULL,	46,	5,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'6c6dfa1b-3b44-416b-b462-b6645ee169dd'),
(14,	1,	2,	NULL,	42,	6,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'f43e53c5-bc7d-4d64-be2e-036e630ca27d'),
(15,	1,	2,	NULL,	41,	7,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'7892f476-ecb9-47bb-9df9-8190e019f0d9'),
(16,	1,	2,	NULL,	40,	8,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'6f0a2a6a-7f0c-4a5f-a63d-2b371b641c28'),
(17,	1,	53,	NULL,	51,	1,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'bd03e39e-2f61-408a-b095-8a382826e289'),
(18,	1,	53,	NULL,	50,	2,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'aacb9c61-b396-4460-bdbe-dbd0ce3987f8'),
(19,	1,	53,	NULL,	49,	3,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'701f61f3-a859-4ca4-a460-b160b3d650ad'),
(20,	1,	53,	NULL,	47,	4,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'42869f79-8167-4c56-9884-c2780aa8b5f6'),
(21,	1,	53,	NULL,	46,	5,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'dc536e0a-db7d-453a-a971-cc803b36e1c1'),
(22,	1,	53,	NULL,	42,	6,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'f8e97851-d002-4811-8671-da3aecb868b7'),
(23,	1,	53,	NULL,	41,	7,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'aa406c58-d753-4f96-a103-8b03396a131b'),
(24,	1,	53,	NULL,	40,	8,	'2025-05-29 12:51:27',	'2025-05-29 12:51:27',	'5165fd2b-d689-4a62-855b-5cd82afb8813'),
(60,	1,	2,	NULL,	39,	9,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'86fea725-6ca4-4e1c-92e1-39c5230f6d0a'),
(61,	1,	2,	NULL,	38,	10,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'92db9085-da2b-456c-96cb-49387359f0bd'),
(62,	1,	2,	NULL,	37,	11,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'14eca1fa-c2c2-491c-870a-29a28b13c80e'),
(63,	1,	2,	NULL,	36,	12,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'd21496b8-cc15-472f-93a0-c38a44dcdcb1'),
(64,	1,	2,	NULL,	35,	13,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'934df1a8-39f5-4d8a-9250-1e9258803896'),
(65,	1,	2,	NULL,	34,	14,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'3955228f-588e-4258-ad79-d7bcd046c0e3'),
(66,	1,	2,	NULL,	32,	15,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'41d367cd-4f76-4bcb-8633-1c52cd7fcd26'),
(67,	1,	2,	NULL,	31,	16,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'a1801cd5-4759-4422-bf7e-b0d7abb56cb6'),
(68,	1,	2,	NULL,	30,	17,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'85f53ec6-ccdb-4a71-a834-2aebef3ae621'),
(69,	1,	2,	NULL,	28,	18,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'27d3658a-5721-40d2-824f-8859f3357742'),
(70,	1,	2,	NULL,	26,	19,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'20bf6a59-a48a-4111-86a7-82b3c415edb9'),
(71,	1,	2,	NULL,	25,	20,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'9c392481-8000-493c-8674-0301e17bb55a'),
(72,	1,	2,	NULL,	24,	21,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'9266e076-4709-4828-86d0-10666fb6d253'),
(73,	1,	2,	NULL,	23,	22,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'8ea02ea8-1fc6-48b2-9d71-5d002454f816'),
(74,	1,	2,	NULL,	22,	23,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'f08caa9e-3500-4151-9d53-6cb0c93fb4d5'),
(75,	1,	2,	NULL,	21,	24,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'1f551837-7533-4d93-bd57-e625a177d649'),
(76,	1,	2,	NULL,	20,	25,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'659521fc-0d45-4956-83fb-c393380d9169'),
(77,	1,	2,	NULL,	19,	26,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'e5274a37-8a8b-436e-bfea-e6172c186700'),
(78,	1,	2,	NULL,	18,	27,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'8a70d081-42d9-48a3-8e70-d6d7c0141e92'),
(79,	1,	2,	NULL,	16,	28,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'07a695b1-1715-42a6-9e28-1dfecf24b306'),
(80,	1,	2,	NULL,	14,	29,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'99399137-5a63-409a-a3c3-54642099407a'),
(81,	1,	2,	NULL,	13,	30,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'0b7d17bc-4d68-4ee9-8c32-cc4bde06812a'),
(82,	1,	2,	NULL,	12,	31,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'df8b075a-220a-41f7-ac31-fc4670463df7'),
(83,	1,	2,	NULL,	8,	32,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'1c1d0fc4-f9c4-4e43-8159-fbea6e300d3f'),
(84,	1,	2,	NULL,	7,	33,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'9d70e015-1fdb-4735-bd20-283c52c47a95'),
(85,	1,	2,	NULL,	6,	34,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'88feff07-1c51-4bf1-9a7a-99f3f078b048'),
(86,	1,	2,	NULL,	5,	35,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'27bfa8b6-455a-4281-b20c-15721fba8203'),
(87,	1,	59,	NULL,	51,	1,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'111d4a76-fb02-4b27-87e3-4d59ce8705c5'),
(88,	1,	59,	NULL,	50,	2,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'83345fc1-7c21-45a2-8e7f-9efa904d5b62'),
(89,	1,	59,	NULL,	49,	3,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'533b4f28-4626-4c92-9932-c1dbb2eabf73'),
(90,	1,	59,	NULL,	47,	4,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'dc987278-ca17-49d4-a657-afdd5edd2c1e'),
(91,	1,	59,	NULL,	46,	5,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'a87aa55a-2261-48ad-befe-d4131f18b742'),
(92,	1,	59,	NULL,	42,	6,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'99bbd264-a166-452d-ba9d-ef9f2a0d2269'),
(93,	1,	59,	NULL,	41,	7,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'56657e74-98ce-4434-a9e5-84218d337d92'),
(94,	1,	59,	NULL,	40,	8,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'59e1115a-65e8-4448-add6-8516d4fed929'),
(95,	1,	59,	NULL,	39,	9,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'aeeea66a-8ff3-47cc-885a-43acd5b92999'),
(96,	1,	59,	NULL,	38,	10,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'9b57afc9-3b37-4126-b3ef-724185365ef9'),
(97,	1,	59,	NULL,	37,	11,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'6fb69087-4a42-4d3f-8082-0f723d08f05c'),
(98,	1,	59,	NULL,	36,	12,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'4da0b5d0-3190-4c89-804a-96cfe2b78c20'),
(99,	1,	59,	NULL,	35,	13,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'b650df7f-d4b1-4ff4-836f-c4cdf964549b'),
(100,	1,	59,	NULL,	34,	14,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'b20703da-8ab5-49a5-9ffc-2fc239b54374'),
(101,	1,	59,	NULL,	32,	15,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'42e0cccd-2537-467a-9705-4e4410434be6'),
(102,	1,	59,	NULL,	31,	16,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'5cfb8f1b-8c94-4559-9315-edd9cbc67aed'),
(103,	1,	59,	NULL,	30,	17,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'4461cf64-276b-4f38-b290-4f029453f306'),
(104,	1,	59,	NULL,	28,	18,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'69ad29ad-4153-4b96-9813-6c637bdcfda6'),
(105,	1,	59,	NULL,	26,	19,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'58f642b8-f208-4da8-8985-79a8eb77e586'),
(106,	1,	59,	NULL,	25,	20,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'ad33b15c-3a85-49ee-9e67-aa3339afc3fb'),
(107,	1,	59,	NULL,	24,	21,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'f2297980-6fa0-49f1-92ab-4bb70c71cfb2'),
(108,	1,	59,	NULL,	23,	22,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'560fb5d7-6234-4ff5-9117-d3b69669fae9'),
(109,	1,	59,	NULL,	22,	23,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'fb7a53cd-dafa-47ec-9e86-6d414382e949'),
(110,	1,	59,	NULL,	21,	24,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'6441f5fa-5591-4b56-938b-4634c2a2485e'),
(111,	1,	59,	NULL,	20,	25,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'0992841d-d438-4af7-874f-4198be4d5df1'),
(112,	1,	59,	NULL,	19,	26,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'48e60b94-d9d2-4221-beb5-676379f52470'),
(113,	1,	59,	NULL,	18,	27,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'd381a13d-17ab-4da9-9b7d-a4e38a384c8b'),
(114,	1,	59,	NULL,	16,	28,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'aa380f76-dfe9-4b19-8ead-5f7be81cc7ea'),
(115,	1,	59,	NULL,	14,	29,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'a3c4c97b-6001-457e-aed5-caf3058745a7'),
(116,	1,	59,	NULL,	13,	30,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'6bccc354-e3ff-4c12-85d9-1a4ac0195645'),
(117,	1,	59,	NULL,	12,	31,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'19779598-5fd3-4d05-9b31-d68af42a9f69'),
(118,	1,	59,	NULL,	8,	32,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'5c6ca8e9-c1a4-4437-9ad5-b9144eae8b1d'),
(119,	1,	59,	NULL,	7,	33,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'25ce8f8c-874d-4fb6-ae19-ce2a245f6be6'),
(120,	1,	59,	NULL,	6,	34,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'fdedfc44-3002-460f-81e8-c27f075128ed'),
(121,	1,	59,	NULL,	5,	35,	'2025-05-29 13:01:04',	'2025-05-29 13:01:04',	'099b406c-bb58-4d76-8e6a-661182cf5e6c');

DROP TABLE IF EXISTS `resourcepaths`;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('106319ec',	'@craft/web/assets/selectize/dist'),
('1776a3ce',	'@craft/web/assets/tailwindreset/dist'),
('1c2bbba4',	'@craft/web/assets/cp/dist'),
('201ab502',	'@craft/web/assets/axios/dist'),
('312c6604',	'@craft/web/assets/updater/dist'),
('38ef205b',	'@craft/web/assets/recententries/dist'),
('3b68480f',	'@craft/web/assets/conditionbuilder/dist'),
('46d9836e',	'@craft/web/assets/utilities/dist'),
('56f31550',	'@craft/web/assets/fabric/dist'),
('61e9ded',	'@craft/web/assets/d3/dist'),
('6556235',	'@craft/web/assets/updateswidget/dist'),
('6fcf61b8',	'@craft/web/assets/admintable/dist'),
('7e412247',	'@craft/web/assets/garnish/dist'),
('85910e95',	'@craft/web/assets/editsection/dist'),
('85c9feca',	'@craft/web/assets/vue/dist'),
('91e92691',	'@craft/web/assets/velocity/dist'),
('942dfb44',	'@craft/web/assets/jquerytouchevents/dist'),
('947e2426',	'@craft/web/assets/jquerypayment/dist'),
('9a75ade1',	'@craft/web/assets/datepickeri18n/dist'),
('a1f9943c',	'@craft/web/assets/craftsupport/dist'),
('a39d43f8',	'@craft/web/assets/xregexp/dist'),
('a825fef8',	'@craft/web/assets/picturefill/dist'),
('b16416c',	'@craft/web/assets/fieldsettings/dist'),
('c2d08fee',	'@bower/jquery/dist'),
('c8371ff8',	'@craft/web/assets/jqueryui/dist'),
('d64cc953',	'@craft/web/assets/fileupload/dist'),
('d7f945a',	'@craft/web/assets/iframeresizer/dist'),
('ddc4ea3a',	'@craft/web/assets/prismjs/dist'),
('e7af8fb3',	'@craft/web/assets/dashboard/dist'),
('eddc1e8',	'@craft/web/assets/theme/dist'),
('f3790d3c',	'@craft/web/assets/htmx/dist'),
('f7a366e',	'@craft/web/assets/generalsettings/dist'),
('fde944ee',	'@craft/web/assets/animationblocker/dist');

DROP TABLE IF EXISTS `revisions`;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ojnlqeltsgvmzwnzscyotvnqmdfzeyyjvebv` (`canonicalId`,`num`),
  KEY `fk_tmvulubonmsyipcowotdrvldhpawftsqazcn` (`creatorId`),
  CONSTRAINT `fk_tmvulubonmsyipcowotdrvldhpawftsqazcn` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vomjddiakqccaryvtmdvoboejrniobfuhnqu` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES
(1,	2,	1,	1,	NULL),
(2,	2,	1,	2,	'Applied “Draft 1”'),
(3,	2,	1,	3,	'Applied “Draft 1”');

DROP TABLE IF EXISTS `searchindex`;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_zksrssalnxyaehvzmgdbpprhcfeakohfqzri` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1,	'email',	0,	1,	' admin janhendrickx be '),
(1,	'firstname',	0,	1,	''),
(1,	'fullname',	0,	1,	''),
(1,	'lastname',	0,	1,	''),
(1,	'slug',	0,	1,	''),
(1,	'username',	0,	1,	' admin '),
(2,	'slug',	0,	1,	' home '),
(2,	'title',	0,	1,	' home '),
(5,	'alt',	0,	1,	''),
(5,	'extension',	0,	1,	' jpg '),
(5,	'filename',	0,	1,	' e0a2832 jpg '),
(5,	'kind',	0,	1,	' image '),
(5,	'slug',	0,	1,	''),
(5,	'title',	0,	1,	' e0 a2832 '),
(6,	'alt',	0,	1,	''),
(6,	'extension',	0,	1,	' jpg '),
(6,	'filename',	0,	1,	' e0a3764 jpg '),
(6,	'kind',	0,	1,	' image '),
(6,	'slug',	0,	1,	''),
(6,	'title',	0,	1,	' e0 a3764 '),
(7,	'alt',	0,	1,	''),
(7,	'extension',	0,	1,	' jpg '),
(7,	'filename',	0,	1,	' e0a5671 luxor rotterdam ruben jpg '),
(7,	'kind',	0,	1,	' image '),
(7,	'slug',	0,	1,	''),
(7,	'title',	0,	1,	' e0 a5671 luxor rotterdam ruben '),
(8,	'alt',	0,	1,	''),
(8,	'extension',	0,	1,	' jpg '),
(8,	'filename',	0,	1,	' e0a5777tilburg jpg '),
(8,	'kind',	0,	1,	' image '),
(8,	'slug',	0,	1,	''),
(8,	'title',	0,	1,	' e0 a5777 tilburg '),
(12,	'alt',	0,	1,	''),
(12,	'extension',	0,	1,	' jpg '),
(12,	'filename',	0,	1,	' e0a8758 jpg '),
(12,	'kind',	0,	1,	' image '),
(12,	'slug',	0,	1,	''),
(12,	'title',	0,	1,	' e0 a8758 '),
(13,	'alt',	0,	1,	''),
(13,	'extension',	0,	1,	' jpg '),
(13,	'filename',	0,	1,	' e0a8920 jpg '),
(13,	'kind',	0,	1,	' image '),
(13,	'slug',	0,	1,	''),
(13,	'title',	0,	1,	' e0 a8920 '),
(14,	'alt',	0,	1,	''),
(14,	'extension',	0,	1,	' jpg '),
(14,	'filename',	0,	1,	' e0a9004 jpg '),
(14,	'kind',	0,	1,	' image '),
(14,	'slug',	0,	1,	''),
(14,	'title',	0,	1,	' e0 a9004 '),
(16,	'alt',	0,	1,	''),
(16,	'extension',	0,	1,	' jpg '),
(16,	'filename',	0,	1,	' e0a9151 jpg '),
(16,	'kind',	0,	1,	' image '),
(16,	'slug',	0,	1,	''),
(16,	'title',	0,	1,	' e0 a9151 '),
(18,	'alt',	0,	1,	''),
(18,	'extension',	0,	1,	' jpg '),
(18,	'filename',	0,	1,	' e0a9641 jpg '),
(18,	'kind',	0,	1,	' image '),
(18,	'slug',	0,	1,	''),
(18,	'title',	0,	1,	' e0 a9641 '),
(19,	'alt',	0,	1,	''),
(19,	'extension',	0,	1,	' jpg '),
(19,	'filename',	0,	1,	' e0a9682 jenne stroobants kat leuven b jpg '),
(19,	'kind',	0,	1,	' image '),
(19,	'slug',	0,	1,	''),
(19,	'title',	0,	1,	' e0 a9682 jenne stroobants kat leuven b '),
(20,	'alt',	0,	1,	''),
(20,	'extension',	0,	1,	' jpg '),
(20,	'filename',	0,	1,	' mg 0719 jpg '),
(20,	'kind',	0,	1,	' image '),
(20,	'slug',	0,	1,	''),
(20,	'title',	0,	1,	' mg 0719 '),
(21,	'alt',	0,	1,	''),
(21,	'extension',	0,	1,	' jpg '),
(21,	'filename',	0,	1,	' mg 0833 jpg '),
(21,	'kind',	0,	1,	' image '),
(21,	'slug',	0,	1,	''),
(21,	'title',	0,	1,	' mg 0833 '),
(22,	'alt',	0,	1,	''),
(22,	'extension',	0,	1,	' jpg '),
(22,	'filename',	0,	1,	' mg 0889 jpg '),
(22,	'kind',	0,	1,	' image '),
(22,	'slug',	0,	1,	''),
(22,	'title',	0,	1,	' mg 0889 '),
(23,	'alt',	0,	1,	''),
(23,	'extension',	0,	1,	' jpg '),
(23,	'filename',	0,	1,	' mg 1804 jpg '),
(23,	'kind',	0,	1,	' image '),
(23,	'slug',	0,	1,	''),
(23,	'title',	0,	1,	' mg 1804 '),
(24,	'alt',	0,	1,	''),
(24,	'extension',	0,	1,	' jpg '),
(24,	'filename',	0,	1,	' mg 2960 jpg '),
(24,	'kind',	0,	1,	' image '),
(24,	'slug',	0,	1,	''),
(24,	'title',	0,	1,	' mg 2960 '),
(25,	'alt',	0,	1,	''),
(25,	'extension',	0,	1,	' jpg '),
(25,	'filename',	0,	1,	' mg 4136 jpg '),
(25,	'kind',	0,	1,	' image '),
(25,	'slug',	0,	1,	''),
(25,	'title',	0,	1,	' mg 4136 '),
(26,	'alt',	0,	1,	''),
(26,	'extension',	0,	1,	' jpg '),
(26,	'filename',	0,	1,	' 1 jpg '),
(26,	'kind',	0,	1,	' image '),
(26,	'slug',	0,	1,	''),
(26,	'title',	0,	1,	' 1 '),
(28,	'alt',	0,	1,	''),
(28,	'extension',	0,	1,	' jpg '),
(28,	'filename',	0,	1,	' 6 jpg '),
(28,	'kind',	0,	1,	' image '),
(28,	'slug',	0,	1,	''),
(28,	'title',	0,	1,	' 6 '),
(30,	'alt',	0,	1,	''),
(30,	'extension',	0,	1,	' jpg '),
(30,	'filename',	0,	1,	' 10 jpg '),
(30,	'kind',	0,	1,	' image '),
(30,	'slug',	0,	1,	''),
(30,	'title',	0,	1,	' 10 '),
(31,	'alt',	0,	1,	''),
(31,	'extension',	0,	1,	' jpg '),
(31,	'filename',	0,	1,	' 11 jpg '),
(31,	'kind',	0,	1,	' image '),
(31,	'slug',	0,	1,	''),
(31,	'title',	0,	1,	' 11 '),
(32,	'alt',	0,	1,	''),
(32,	'extension',	0,	1,	' jpg '),
(32,	'filename',	0,	1,	' 12 jpg '),
(32,	'kind',	0,	1,	' image '),
(32,	'slug',	0,	1,	''),
(32,	'title',	0,	1,	' 12 '),
(34,	'alt',	0,	1,	''),
(34,	'extension',	0,	1,	' jpg '),
(34,	'filename',	0,	1,	' 18 jpg '),
(34,	'kind',	0,	1,	' image '),
(34,	'slug',	0,	1,	''),
(34,	'title',	0,	1,	' 18 '),
(35,	'alt',	0,	1,	''),
(35,	'extension',	0,	1,	' jpg '),
(35,	'filename',	0,	1,	' 21 jpg '),
(35,	'kind',	0,	1,	' image '),
(35,	'slug',	0,	1,	''),
(35,	'title',	0,	1,	' 21 '),
(36,	'alt',	0,	1,	''),
(36,	'extension',	0,	1,	' jpg '),
(36,	'filename',	0,	1,	' 27 jpg '),
(36,	'kind',	0,	1,	' image '),
(36,	'slug',	0,	1,	''),
(36,	'title',	0,	1,	' 27 '),
(37,	'alt',	0,	1,	''),
(37,	'extension',	0,	1,	' jpg '),
(37,	'filename',	0,	1,	' 28 jpg '),
(37,	'kind',	0,	1,	' image '),
(37,	'slug',	0,	1,	''),
(37,	'title',	0,	1,	' 28 '),
(38,	'alt',	0,	1,	''),
(38,	'extension',	0,	1,	' jpg '),
(38,	'filename',	0,	1,	' 30 jpg '),
(38,	'kind',	0,	1,	' image '),
(38,	'slug',	0,	1,	''),
(38,	'title',	0,	1,	' 30 '),
(39,	'alt',	0,	1,	''),
(39,	'extension',	0,	1,	' jpg '),
(39,	'filename',	0,	1,	' 34 jpg '),
(39,	'kind',	0,	1,	' image '),
(39,	'slug',	0,	1,	''),
(39,	'title',	0,	1,	' 34 '),
(40,	'alt',	0,	1,	''),
(40,	'extension',	0,	1,	' jpg '),
(40,	'filename',	0,	1,	' albert heijn jpg '),
(40,	'kind',	0,	1,	' image '),
(40,	'slug',	0,	1,	''),
(40,	'title',	0,	1,	' albert heijn '),
(41,	'alt',	0,	1,	''),
(41,	'extension',	0,	1,	' jpg '),
(41,	'filename',	0,	1,	' b80v2391 jpg '),
(41,	'kind',	0,	1,	' image '),
(41,	'slug',	0,	1,	''),
(41,	'title',	0,	1,	' b80 v2391 '),
(42,	'alt',	0,	1,	''),
(42,	'extension',	0,	1,	' jpg '),
(42,	'filename',	0,	1,	' bodystyling jpg '),
(42,	'kind',	0,	1,	' image '),
(42,	'slug',	0,	1,	''),
(42,	'title',	0,	1,	' bodystyling '),
(46,	'alt',	0,	1,	''),
(46,	'extension',	0,	1,	' jpg '),
(46,	'filename',	0,	1,	' jean vermaelen mg 9554 jpg '),
(46,	'kind',	0,	1,	' image '),
(46,	'slug',	0,	1,	''),
(46,	'title',	0,	1,	' jean vermaelen mg 9554 '),
(47,	'alt',	0,	1,	''),
(47,	'extension',	0,	1,	' jpg '),
(47,	'filename',	0,	1,	' luvanium jpg '),
(47,	'kind',	0,	1,	' image '),
(47,	'slug',	0,	1,	''),
(47,	'title',	0,	1,	' luvanium '),
(49,	'alt',	0,	1,	''),
(49,	'extension',	0,	1,	' jpg '),
(49,	'filename',	0,	1,	' primus schuin definitief jpg '),
(49,	'kind',	0,	1,	' image '),
(49,	'slug',	0,	1,	''),
(49,	'title',	0,	1,	' primus schuin definitief '),
(50,	'alt',	0,	1,	''),
(50,	'extension',	0,	1,	' jpg '),
(50,	'filename',	0,	1,	' sint gillis waas dullaert nancy mg 9568 jpg '),
(50,	'kind',	0,	1,	' image '),
(50,	'slug',	0,	1,	''),
(50,	'title',	0,	1,	' sint gillis waas dullaert nancy mg 9568 '),
(51,	'alt',	0,	1,	''),
(51,	'extension',	0,	1,	' jpg '),
(51,	'filename',	0,	1,	' tongerlo jpg '),
(51,	'kind',	0,	1,	' image '),
(51,	'slug',	0,	1,	''),
(51,	'title',	0,	1,	' tongerlo '),
(54,	'slug',	0,	1,	' editorial '),
(54,	'title',	0,	1,	' editorial '),
(55,	'slug',	0,	1,	' food '),
(55,	'title',	0,	1,	' food '),
(56,	'slug',	0,	1,	' portrait '),
(56,	'title',	0,	1,	' portrait '),
(57,	'slug',	0,	1,	' travel '),
(57,	'title',	0,	1,	' travel ');

DROP TABLE IF EXISTS `searchindexqueue`;
CREATE TABLE `searchindexqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ndiudeqlpgdsvpinrwkbnfnycwdzrxafbojt` (`elementId`,`siteId`,`reserved`),
  CONSTRAINT `fk_neverfpmvdyunxzsupbythpiztzjwirgvkto` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `searchindexqueue_fields`;
CREATE TABLE `searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `idx_ufnpcwgvapmoujkettgajbfynzgubgwaubst` (`jobId`,`fieldHandle`),
  CONSTRAINT `fk_ufdffcirjdmpxcgpuwimolpdkqsqydblvvhk` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zykcucmoywcvquramgcaolieeirjgqlklqdh` (`handle`),
  KEY `idx_ocyuuyciteostwklbbxjshumijrymvyycncn` (`name`),
  KEY `idx_xhasmoufqbznoceavsmbgedebdjlpauhcxbv` (`structureId`),
  KEY `idx_qzethinvamvotfffkzqesrxuuowtkhnrybhn` (`dateDeleted`),
  CONSTRAINT `fk_ytbhbufegezledmnllktspudysoapevqsinf` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `maxAuthors`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1,	NULL,	'Home',	'homepage',	'single',	1,	1,	'all',	'end',	'[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]',	'2025-05-29 12:49:16',	'2025-05-29 12:49:16',	NULL,	'460ec1d4-502a-4553-82f2-23c3f41054a7');

DROP TABLE IF EXISTS `sections_entrytypes`;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_kmrqtdntpkowubikaeobfjfxvspktqkwcrru` (`typeId`),
  CONSTRAINT `fk_cuaoksyijsufkjwhcswevwmwomzaqzkkjudd` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kmrqtdntpkowubikaeobfjfxvspktqkwcrru` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `sections_entrytypes` (`sectionId`, `typeId`, `sortOrder`, `name`, `handle`) VALUES
(1,	1,	1,	NULL,	NULL);

DROP TABLE IF EXISTS `sections_sites`;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_quiglgnnqvfebxqaqtbdvqaqpttgwdecrqhv` (`sectionId`,`siteId`),
  KEY `idx_ujlewonejurinsmofxjvqxlqprdiefwbcime` (`siteId`),
  CONSTRAINT `fk_clgqjzwrtaeaacniaeotqtbfghhzhhpeldgm` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kcvjedpyaglykgyxzgpziyzfzipxrjxibxtl` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1,	1,	1,	1,	'__home__',	'index.twig',	1,	'2025-05-29 12:49:16',	'2025-05-29 12:49:16',	'9e39e37d-41f2-4639-bcac-37e66c8441f2');

DROP TABLE IF EXISTS `sequences`;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vkwpiljjwxydugvigncetbccshzkhlcqunxd` (`uid`),
  KEY `idx_ftziuwkctpkygakypibokjkpjbxvunhktrxj` (`token`),
  KEY `idx_hxdqcitoeumnlovuimgwtmhyybmayoybqteo` (`dateUpdated`),
  KEY `idx_ptqyfektftnoadphxkkozsnubwbfwwrtrype` (`userId`),
  CONSTRAINT `fk_ygsgavldjqwmulnguslbgmbbskmrivyfjvhc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `shunnedmessages`;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_swucodwyyuravbtlplhwikcuzgflaigyoqoq` (`userId`,`message`),
  CONSTRAINT `fk_lcsxqeuyhmdydfthaydogngodkdfscxejvsv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `sitegroups`;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cxovxrbdzqmcktyynbyiiljwnqekumgaramp` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1,	'The Annie Club',	'2025-05-29 10:18:35',	'2025-05-29 10:18:35',	NULL,	'702fb49c-145b-4804-9326-248b64c7d98c');

DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pjjbubvjcosverfntvpytpydzzlodcggbtvl` (`dateDeleted`),
  KEY `idx_ygldcncfjspdsstzbdbxmruaptavchahuftk` (`handle`),
  KEY `idx_dkymsemclfhzysxvyyqlpyjzsdtrxmrrhwww` (`sortOrder`),
  KEY `fk_eqxlmhreewzgmyffbflipnaqgmpglcpviigt` (`groupId`),
  CONSTRAINT `fk_eqxlmhreewzgmyffbflipnaqgmpglcpviigt` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1,	1,	1,	'1',	'The Annie Club',	'default',	'nl',	1,	'http://the-annie-club.local/',	1,	'2025-05-29 10:18:35',	'2025-05-29 10:18:35',	NULL,	'dd6e4919-ff41-4207-af9c-630665454e96');

DROP TABLE IF EXISTS `sso_identities`;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_rxfczycshuvntqkhjebybswtufwbkyludsho` (`userId`),
  CONSTRAINT `fk_rxfczycshuvntqkhjebybswtufwbkyludsho` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `structureelements`;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nonahxqosduizwfeidgoaurtjaqhthkvodoq` (`structureId`,`elementId`),
  KEY `idx_blqolxlxbnnhydafpmbtppizwbwybkgqytoh` (`root`),
  KEY `idx_hoastrvqthlzhehctfuszibohsjvylagrnuc` (`lft`),
  KEY `idx_xoqydvzieetumfvfjumcpteeazhamlkarxlv` (`rgt`),
  KEY `idx_ufgbeeyejjdoeeedigufpmrweqlntephpjyo` (`level`),
  KEY `idx_jdzkkwfxtjfuusueimtftrpxoxjzkszubtbh` (`elementId`),
  CONSTRAINT `fk_qhfswrhlqsbgbvpnfgemcljrpfwcgehgkgde` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1,	1,	NULL,	1,	1,	10,	0,	'2025-05-29 12:52:12',	'2025-05-29 12:52:34',	'0cb36be7-77e5-407f-8850-2f5bd28ac52a'),
(2,	1,	54,	1,	2,	3,	1,	'2025-05-29 12:52:12',	'2025-05-29 12:52:12',	'31fc2148-64d3-4d5d-be90-f1e3514b2c1b'),
(3,	1,	55,	1,	4,	5,	1,	'2025-05-29 12:52:26',	'2025-05-29 12:52:26',	'f0cf7e98-b831-4a97-b461-95e22420e57c'),
(4,	1,	56,	1,	6,	7,	1,	'2025-05-29 12:52:30',	'2025-05-29 12:52:30',	'e2e18c46-7e30-46e1-9a44-5c2c9658f619'),
(5,	1,	57,	1,	8,	9,	1,	'2025-05-29 12:52:34',	'2025-05-29 12:52:34',	'17cd1296-74ca-4db8-b86d-61d400af1b3a');

DROP TABLE IF EXISTS `structures`;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_prkwdnxvkopvcbodxrmekpgwxnnvthixmqwu` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1,	NULL,	'2025-05-29 12:48:19',	'2025-05-29 12:48:19',	NULL,	'83cb782f-9b4d-4704-ba09-34044903534d');

DROP TABLE IF EXISTS `systemmessages`;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wgmilfojkymeyfotnudqclhbkkeekkjtrowt` (`key`,`language`),
  KEY `idx_sigxfwstymedsoosyouwcxkhunefefaegoic` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `taggroups`;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uyqakfnhuxogqzheadzxhwuhxqdrudxudugi` (`name`),
  KEY `idx_erbwdsoyvwceynnspxtzenbtxcqgrmzesqau` (`handle`),
  KEY `idx_urputgupdbumshzvlxqohroajcescgryvrbd` (`dateDeleted`),
  KEY `fk_enzapoyjvgtjezjljjroghcmtkraphftsbug` (`fieldLayoutId`),
  CONSTRAINT `fk_enzapoyjvgtjezjljjroghcmtkraphftsbug` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xsdypkdzwpzilijhzalvyoqxaogouhgsvrlh` (`groupId`),
  CONSTRAINT `fk_ersoulubxzsysuvpurxwsckciwccdpkxmhug` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ojdwzgmbkpydthximpsxknjzxjbgjpvvcnny` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cygramozytpazvyuguyhnpptqcueqrmcspdd` (`token`),
  KEY `idx_euremrrenribwjjnbucycadsbzsiixxnmqvg` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `usergroups`;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_apbudplwjgmfeoactgbfsrsdqoicpsxjakjd` (`handle`),
  KEY `idx_oxkssgdzeqjixrkioeojucqrfijknryzkpka` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `usergroups_users`;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lgkwmwvgrtvwfysbxgbwzlpeflnweeyfxdqs` (`groupId`,`userId`),
  KEY `idx_hnmgvvfwmxxikwvdnrjdetlcuqoywhgtjggu` (`userId`),
  CONSTRAINT `fk_qbnrnaxovkthrqnorxmcyobsuixzzikumcbe` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sbauugcwpvewkpygyixkownddriseojnhnbn` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `userpermissions`;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gipcnhjhvorkqcclznqvvxnlzrlpmjjsmxje` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `userpermissions_usergroups`;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rvkxjzhlwiqvqwrjboayhcofugtmugtcjcok` (`permissionId`,`groupId`),
  KEY `idx_jnyjoheqopkikqqlckicgykctgowdnfuvntp` (`groupId`),
  CONSTRAINT `fk_gfdhdltlenvktxgdbwyjubavuqwnezdpsema` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pwzfjjxzvffykjfurngpyyflejmmusqaxfvp` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `userpermissions_users`;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ststimbavakrwpqdvnynjcbdlxjczixhljrz` (`permissionId`,`userId`),
  KEY `idx_klkjpxmyfxyizhreygmjecniywbwzpmyfesx` (`userId`),
  CONSTRAINT `fk_grxuxtvfahttktilatxwlpqmllhnevahmtto` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zgaqmgxjsomxroacurpyodizcfohzgqyakfr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `userpreferences`;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_xrtzqnzmjvvbzxvhxhfoywaijoeojbieamhn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1,	'{\"locale\": null, \"language\": \"en\", \"useShapes\": false, \"weekStartDay\": \"1\", \"underlineLinks\": false, \"disableAutofocus\": \"\", \"profileTemplates\": false, \"showFieldHandles\": false, \"showExceptionView\": false, \"notificationDuration\": \"5000\", \"enableDebugToolbarForCp\": false, \"enableDebugToolbarForSite\": false}');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `affiliatedSiteId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jwahqbtvwnvusagmznkxtrxwhtbczcooeesz` (`active`),
  KEY `idx_zzflhuxtnguealgvltscgjwbysdfzchywbso` (`locked`),
  KEY `idx_vprxdmgjqyywppexiowuhgolcdwcankifmuq` (`pending`),
  KEY `idx_fqyfexwzeqrwqaupktypzqtnarcypqulobqn` (`suspended`),
  KEY `idx_mplhkwpzfxfghuqkcmkslcjgropfsyazymlk` (`verificationCode`),
  KEY `idx_wgmskhlcpydivdkpzxfoqrurvruhgsypysks` (`email`),
  KEY `idx_nuxpcnyhsywzslsdmjuncrzcrladaqcnkazy` (`username`),
  KEY `fk_wajzuqlttdmmzajhercksmjqpdelnuoexdvb` (`photoId`),
  KEY `fk_lkejfmpykpcxoliyvcxonpivrzfjhoohyvmv` (`affiliatedSiteId`),
  CONSTRAINT `fk_gekvnflpzfdacdfittqiexobddwlsqdgxkkg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lkejfmpykpcxoliyvcxonpivrzfjhoohyvmv` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wajzuqlttdmmzajhercksmjqpdelnuoexdvb` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `users` (`id`, `photoId`, `affiliatedSiteId`, `active`, `pending`, `locked`, `suspended`, `admin`, `username`, `fullName`, `firstName`, `lastName`, `email`, `password`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`) VALUES
(1,	NULL,	NULL,	1,	0,	0,	0,	1,	'admin',	NULL,	NULL,	NULL,	'admin@janhendrickx.be',	'$2y$13$kliLx5tyc65a3asNXXrdjOjDXNryJW91gxjZxAArRHDVEzvlrgs7i',	'2025-05-29 12:44:05',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	0,	'2025-05-29 10:18:36',	'2025-05-29 10:18:36',	'2025-05-29 12:44:05');

DROP TABLE IF EXISTS `volumefolders`;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xhshjrovfdpqeffidfetoqoffddqurxewasq` (`name`,`parentId`,`volumeId`),
  KEY `idx_cchtufepebqseezjwuzbbwypsszmvcxdljhd` (`parentId`),
  KEY `idx_ozutyxqhxpedxxnncpcvirdgaifqqckovvur` (`volumeId`),
  CONSTRAINT `fk_abliehrfnhinhjpdvflrepsujvxzwdprevvu` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gejpiwbtclirwjlragegzdpgxkntvwawftfb` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1,	NULL,	1,	'Foto\'s',	'',	'2025-05-29 12:46:38',	'2025-05-29 12:46:38',	'97e79079-9181-4440-821e-5226ff697195'),
(2,	NULL,	NULL,	'Temporary Uploads',	NULL,	'2025-05-29 12:49:28',	'2025-05-29 12:49:28',	'cb06bb4a-4f50-4ad8-bd6b-7a30594b699d'),
(3,	2,	NULL,	'user_1',	'user_1/',	'2025-05-29 12:49:28',	'2025-05-29 12:49:28',	'b4871723-672b-45e4-9a83-f904eacc430a');

DROP TABLE IF EXISTS `volumes`;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nplyxkmqzzgryqsveiuaapammxoysvzjurby` (`name`),
  KEY `idx_rljoukjoapiedkyccspoaipnzbodpfsbgcsp` (`handle`),
  KEY `idx_vbgpkmwebnhjczuvwwwjwtooahclocbzfodz` (`fieldLayoutId`),
  KEY `idx_nbrplvctogqtxufuhqcindxvvqquallsjvcp` (`dateDeleted`),
  CONSTRAINT `fk_prjvggnnornmkjwsoaczneitngulcxefhylg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `fs`, `subpath`, `transformFs`, `transformSubpath`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `altTranslationMethod`, `altTranslationKeyFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1,	1,	'Foto\'s',	'fotos',	'bestanden',	'',	'',	'',	'site',	NULL,	'none',	NULL,	1,	'2025-05-29 12:46:38',	'2025-05-29 12:46:38',	NULL,	'6d83ddd1-f2ce-4ce6-9aac-88fcbf50c2d8');

DROP TABLE IF EXISTS `webauthn`;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_oomtuxpzwlwwxbnotmopduexyijbclwqsdmy` (`userId`),
  CONSTRAINT `fk_oomtuxpzwlwwxbnotmopduexyijbclwqsdmy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `widgets`;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xewjzrgyidvjnkmujmdiunkezsrlbjaujjqq` (`userId`),
  CONSTRAINT `fk_rdwgdhptvcvuavyhkmciowugswvbrnabuepa` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1,	1,	'craft\\widgets\\RecentEntries',	1,	NULL,	'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',	1,	'2025-05-29 10:18:56',	'2025-05-29 10:18:56',	'd0760933-078a-46b4-91fb-fbebd2218696'),
(2,	1,	'craft\\widgets\\CraftSupport',	2,	NULL,	'[]',	1,	'2025-05-29 10:18:56',	'2025-05-29 10:18:56',	'77eed2fa-5bf8-4d40-a0c6-affd506b10bb'),
(3,	1,	'craft\\widgets\\Updates',	3,	NULL,	'[]',	1,	'2025-05-29 10:18:56',	'2025-05-29 10:18:56',	'4ca3e1fe-68d6-480b-acb9-330c48f0946e'),
(4,	1,	'craft\\widgets\\Feed',	4,	NULL,	'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',	1,	'2025-05-29 10:18:56',	'2025-05-29 10:18:56',	'f70c82af-f227-4fdc-a12e-db63dd205985');

-- 2025-06-16 06:58:42
