// CREATE DATABASE EASYCOMPANY;

//DROP TABLE `IDS`;
//DROP TABLE `RTETNAUTH`;
//DROP TABLE `RTETNBBS`;
//DROP TABLE `RTETNCART`;
//DROP TABLE `RTETNPURCHSLIST`;
//DROP TABLE `RTETNDLVYINFO`;
//DROP TABLE `RTETNGOODS`;
//DROP TABLE `RTETNCTGRY`;
//DROP TABLE `RTETNGOODSIMAGE`;
//DROP TABLE `RTETNMBER`;
//DROP TABLE `RTETCCODE`;

CREATE TABLE `IDS` (
  `TABLE_NAME` VARCHAR(20) NOT NULL,
  `NEXT_ID` DECIMAL(30,0) NOT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `RTETCCODE` (
  `CODE_ID` VARCHAR(6) NOT NULL DEFAULT '',
  `CODE_NM` VARCHAR(60) DEFAULT NULL,
  `DC` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `RTETNDLVYINFO` (
  `DLVY_SE` CHAR(2) NOT NULL DEFAULT '',
  `DLVY_STTUS` VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (`DLVY_SE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `RTETNCTGRY` (
  `CTGRY_ID` VARCHAR(20) NOT NULL DEFAULT '',
  `CTGRY_NM` VARCHAR(100) DEFAULT NULL,
  `DC` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`CTGRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `RTETNGOODSIMAGE` (
  `GOODS_IMAGE_ID` CHAR(20) NOT NULL DEFAULT '',
  `FILE_NM` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`GOODS_IMAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `RTETNAUTH` (
  `URL` VARCHAR(100) NOT NULL DEFAULT '',
  `MNGR_SE` VARCHAR(6) DEFAULT NULL,
  PRIMARY KEY (`URL`),
  KEY `R_37` (`MNGR_SE`),
  CONSTRAINT `rtetnauth_ibfk_1` FOREIGN KEY (`MNGR_SE`) REFERENCES `RTETCCODE` (`CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `RTETNBBS` (
  `NO` CHAR(20) NOT NULL DEFAULT '',
  `SJ` VARCHAR(60) DEFAULT NULL,
  `CN` VARCHAR(4000) DEFAULT NULL,
  `REGIST_DT` DATE DEFAULT NULL,
  `MBER_NO` CHAR(20) DEFAULT NULL,
  `MBER_ID` VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `RTETNGOODS` (
  `GOODS_ID` CHAR(20) NOT NULL DEFAULT '',
  `GOODS_NM` VARCHAR(255) DEFAULT NULL,
  `PRICE` DECIMAL(16,0) DEFAULT NULL,
  `CTGRY_ID` VARCHAR(20) DEFAULT NULL,
  `MAKR` VARCHAR(20) DEFAULT NULL,
  `DETAIL_INFO_IMAGE_ID` CHAR(20) DEFAULT NULL,
  `GOODS_IMAGE_ID` CHAR(20) DEFAULT NULL,
  `USE_AT` CHAR(1) DEFAULT NULL,
  PRIMARY KEY (`GOODS_ID`),
  KEY `R_6` (`CTGRY_ID`),
  KEY `R_33` (`DETAIL_INFO_IMAGE_ID`),
  KEY `R_35` (`GOODS_IMAGE_ID`),
  CONSTRAINT `rtetngoods_ibfk_1` FOREIGN KEY (`CTGRY_ID`) REFERENCES `RTETNCTGRY` (`CTGRY_ID`),
  CONSTRAINT `rtetngoods_ibfk_2` FOREIGN KEY (`DETAIL_INFO_IMAGE_ID`) REFERENCES `RTETNGOODSIMAGE` (`GOODS_IMAGE_ID`),
  CONSTRAINT `rtetngoods_ibfk_3` FOREIGN KEY (`GOODS_IMAGE_ID`) REFERENCES `RTETNGOODSIMAGE` (`GOODS_IMAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `RTETNMBER` (
  `MBER_NO` CHAR(20) NOT NULL DEFAULT '',
  `MBER_ID` VARCHAR(20) DEFAULT NULL,
  `NM` VARCHAR(60) DEFAULT NULL,
  `PASSWORD` VARCHAR(200) DEFAULT NULL,
  `EMAIL` VARCHAR(50) DEFAULT NULL,
  `TELNO` VARCHAR(20) DEFAULT NULL,
  `MBTLNUM` VARCHAR(20) DEFAULT NULL,
  `ZIP` CHAR(6) DEFAULT NULL,
  `ADRES` VARCHAR(100) DEFAULT NULL,
  `DETAIL_ADRES` VARCHAR(100) DEFAULT NULL,
  `LAST_CHANGE_DT` DATE DEFAULT NULL,
  `MNGR_SE` VARCHAR(6) DEFAULT NULL,
  PRIMARY KEY (`MBER_NO`),
  KEY `R_19` (`MNGR_SE`),
  CONSTRAINT `rtetnmber_ibfk_1` FOREIGN KEY (`MNGR_SE`) REFERENCES `RTETCCODE` (`CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `RTETNCART` (
  `CART_ID` CHAR(20) NOT NULL DEFAULT '',
  `MBER_NO` CHAR(20) DEFAULT NULL,
  `GOODS_ID` CHAR(20) DEFAULT NULL,
  `QY` DECIMAL(20,0) DEFAULT NULL,
  PRIMARY KEY (`CART_ID`),
  KEY `R_10` (`MBER_NO`),
  KEY `R_11` (`GOODS_ID`),
  CONSTRAINT `rtetncart_ibfk_1` FOREIGN KEY (`MBER_NO`) REFERENCES `RTETNMBER` (`MBER_NO`) ON DELETE CASCADE,
  CONSTRAINT `rtetncart_ibfk_2` FOREIGN KEY (`GOODS_ID`) REFERENCES `RTETNGOODS` (`GOODS_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `RTETNPURCHSLIST` (
  `PURCHS_ID` CHAR(20) NOT NULL DEFAULT '',
  `GOODS_ID` CHAR(20) NOT NULL,
  `MBER_NO` CHAR(20) NOT NULL,
  `QY` DECIMAL(20,0) DEFAULT NULL,
  `PURCHS_DE` CHAR(8) DEFAULT NULL,
  `DLVY_SE` CHAR(2) DEFAULT NULL,
  PRIMARY KEY (`PURCHS_ID`),
  KEY `R_1` (`GOODS_ID`),
  KEY `R_3` (`MBER_NO`),
  KEY `R_20` (`DLVY_SE`),
  CONSTRAINT `rtetnpurchslist_ibfk_1` FOREIGN KEY (`GOODS_ID`) REFERENCES `RTETNGOODS` (`GOODS_ID`),
  CONSTRAINT `rtetnpurchslist_ibfk_2` FOREIGN KEY (`MBER_NO`) REFERENCES `RTETNMBER` (`MBER_NO`) ON DELETE CASCADE,
  CONSTRAINT `rtetnpurchslist_ibfk_3` FOREIGN KEY (`DLVY_SE`) REFERENCES `RTETNDLVYINFO` (`DLVY_SE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

commit;
