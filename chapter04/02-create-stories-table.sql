USE shovell_development;
CREATE TABLE `stories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `link` varchar(255) default NULL,
  PRIMARY KEY (`id`)
);