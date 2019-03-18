DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `detail` varchar(4096) NOT NULL,
  `author` varchar(255) NOT NULL,
  `invisible` int(1) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
