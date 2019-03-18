DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(20) NOT NULL,
  `username` varchar(18) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'user',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
