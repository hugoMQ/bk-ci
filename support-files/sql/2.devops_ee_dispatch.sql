USE devops_ee_dispatch;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for T_DISPATCH_MACHINE
-- ----------------------------
DROP TABLE IF EXISTS `T_DISPATCH_MACHINE`;
CREATE TABLE `T_DISPATCH_MACHINE` (
  `MACHINE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MACHINE_IP` varchar(128) NOT NULL,
  `MACHINE_NAME` varchar(128) NOT NULL,
  `MACHINE_USERNAME` varchar(128) NOT NULL,
  `MACHINE_PASSWORD` varchar(128) NOT NULL,
  `MACHINE_CREATED_TIME` datetime NOT NULL,
  `MACHINE_UPDATED_TIME` datetime NOT NULL,
  `CURRENT_VM_RUN` int(11) NOT NULL DEFAULT '0',
  `MAX_VM_RUN` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`MACHINE_ID`),
  UNIQUE KEY `MACHINE_IP` (`MACHINE_IP`),
  UNIQUE KEY `MACHINE_NAME` (`MACHINE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for T_DISPATCH_PIPELINE_BUILD
-- ----------------------------
DROP TABLE IF EXISTS `T_DISPATCH_PIPELINE_BUILD`;
CREATE TABLE `T_DISPATCH_PIPELINE_BUILD` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` varchar(32) NOT NULL,
  `PIPELINE_ID` varchar(34) NOT NULL,
  `BUILD_ID` varchar(34) NOT NULL,
  `VM_SEQ_ID` varchar(34) NOT NULL DEFAULT '',
  `VM_ID` int(20) NOT NULL,
  `CREATED_TIME` datetime NOT NULL,
  `UPDATED_TIME` datetime NOT NULL,
  `STATUS` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for T_DISPATCH_THIRDPARTY_AGENT_BUILD
-- ----------------------------
DROP TABLE IF EXISTS `T_DISPATCH_THIRDPARTY_AGENT_BUILD`;
CREATE TABLE `T_DISPATCH_THIRDPARTY_AGENT_BUILD` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` varchar(64) NOT NULL,
  `AGENT_ID` varchar(32) NOT NULL,
  `PIPELINE_ID` varchar(34) NOT NULL DEFAULT '',
  `BUILD_ID` varchar(34) NOT NULL,
  `VM_SEQ_ID` varchar(34) NOT NULL,
  `STATUS` int(11) NOT NULL,
  `CREATED_TIME` datetime NOT NULL,
  `UPDATED_TIME` datetime NOT NULL,
  `WORKSPACE` varchar(4096) DEFAULT NULL,
  `BUILD_NUM` int(20) DEFAULT '0',
  `PIPELINE_NAME` varchar(255) DEFAULT '',
  `TASK_NAME` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `BUILD_ID` (`BUILD_ID`,`VM_SEQ_ID`) USING BTREE,
  KEY `idx_agent_id` (`AGENT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
