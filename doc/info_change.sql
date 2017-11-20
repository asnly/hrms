/*
 * 2017-7-6  添加档案管理表
 */
CREATE TABLE `info`.`Dossier` (
  `id` INT NOT NULL,
  `userid` INT NOT NULL,
  `DossierNum` VARCHAR(45) NOT NULL,
  `context` VARCHAR(100) NOT NULL,
  `remark` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`));
/*
 * 2017-7-6  添加员工履历表
 */
CREATE TABLE `info`.`Detail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `department` VARCHAR(45) NOT NULL,
  `job` VARCHAR(45) NOT NULL,
  `academic` VARCHAR(45) NOT NULL,
  `workContent` VARCHAR(200) NOT NULL,
  `performance` VARCHAR(45) NOT NULL,
  `startTime` VARCHAR(45) NOT NULL,
  `endTime` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
/*
 * 2017-7-6  修改员工履历表中的startTime,endTime字段
 */
ALTER TABLE `info`.`Detail` 
CHANGE COLUMN `startTime` `startTime` DATETIME NOT NULL ,
CHANGE COLUMN `endTime` `endTime` DATETIME NOT NULL ;
/*
 * 2017-7-6  添加合同信息表
 */
CREATE TABLE `info`.`Contract` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userid` VARCHAR(45) NOT NULL,
  `contractNum` VARCHAR(45) NOT NULL,
  `startTime` DATETIME NOT NULL,
  `endTime` DATETIME NOT NULL,
  PRIMARY KEY (`id`));
/*
 * 2017-7-6  添加奖惩表
 */
CREATE TABLE `info`.`RewardsAndPunishments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rewardsuser` VARCHAR(45) NOT NULL,
  `rewardsTime` DATETIME NOT NULL,
  `rewardsContext` VARCHAR(100) NOT NULL,
  `rewardsCategory` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
/**
 * 2017-7-7  修改合同表
 */
ALTER TABLE `info`.`Contract` 
ADD COLUMN `quarters` VARCHAR(45) NOT NULL AFTER `endTime`,
ADD COLUMN `content` VARCHAR(100) NOT NULL AFTER `quarters`,
ADD COLUMN `contractImage` VARCHAR(400) NOT NULL AFTER `content`;

/*
 * 2017-7-7    增加培训记录表
 */
CREATE TABLE `info`.`trainingRecord` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NOT NULL,
  `nature` VARCHAR(45) NOT NULL,
  `number` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `startTime` DATETIME NOT NULL,
  `endTime` DATETIME NOT NULL,
  `price` INT(8) NOT NULL,
  `location` VARCHAR(400) NOT NULL,
  `participants` VARCHAR(200) NOT NULL,
  `organizer` VARCHAR(200) NOT NULL,
  `methods` VARCHAR(45) NOT NULL,
  `nameOfpersonIncharge` VARCHAR(45) NOT NULL,
  `score` INT NOT NULL,
  `teacher` VARCHAR(45) NOT NULL,
  `class` VARCHAR(45) NOT NULL,
  `totalPrice` INT(8) NOT NULL,
  `subject` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`));

  /**
   * 2017-7-7   增加员工证书表
   */
  CREATE TABLE `info`.`CertificateRecord` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userid` VARCHAR(45) NOT NULL,
  `tid` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `number` VARCHAR(45) NOT NULL,
  `certificateDate` DATETIME NOT NULL,
  PRIMARY KEY (`id`));
  /**
   * 2017-8-1 修改员工信息表
   */
  ALTER TABLE `info`.`employee` 
CHANGE COLUMN `image` `image` VARCHAR(200) NOT NULL ,
ADD COLUMN `EducationImage` VARCHAR(200) NOT NULL AFTER `specialties`,
ADD COLUMN `DegreeImage` VARCHAR(200) NOT NULL AFTER `EducationImage`;

  /**
   * 2017-8-19 添加部门信息表
   */
   CREATE TABLE `info`.`DeptInfo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dept_num` VARCHAR(45) NOT NULL,
  `dept_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`));

  /**
   * 2017-8-20  修改员工信息表
   */
  ALTER TABLE `info`.`employee` 
CHANGE COLUMN `degree` `degree` INT(11) NOT NULL ,
CHANGE COLUMN `department` `department` INT(11) NOT NULL ,
CHANGE COLUMN `rstatus` `rstatus` INT(10) NOT NULL ,
CHANGE COLUMN `education` `education` INT(11) NOT NULL ;
/*
 * 2017-8-22  增加机构信息表
 */
CREATE TABLE `info`.`InstitutionInfo` (
  `id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `content` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id`));
/*
 * 2017-8-22 修改机构信息表
 */
  ALTER TABLE `info`.`InstitutionInfo` 
ADD COLUMN `issuedate` DATETIME NOT NULL AFTER `content`;
/*
 * 2017-8-23 修改机构信息表
 */
ALTER TABLE `info`.`InstitutionInfo` 
CHANGE COLUMN `category` `category` INT(11) NOT NULL ;
ALTER TABLE `info`.`InstitutionInfo` 
ADD COLUMN `author` VARCHAR(100) NOT NULL AFTER `issuedate`;
ALTER TABLE `info`.`InstitutionInfo` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;
/*
 * 2017-8-31   增加角色信息表
 */
CREATE TABLE `info`.`RoleInfo` (
  `id` INT NOT NULL,
  `roleName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
/*
 * 2017-8-31  增加离职信息表
 */
CREATE TABLE `info`.`DemissionInfo` (
  `id` INT NOT NULL,
  `employeeid` VARCHAR(45) NOT NULL,
  `reasonsleaving` VARCHAR(45) NOT NULL,
  `type` INT(11) NOT NULL,
  `dessiontime` DATETIME NOT NULL,
  PRIMARY KEY (`id`));
/*
 * 2017-8-31 修改用户信息表
 */
ALTER TABLE `info`.`Account` 
ADD COLUMN `roleid` VARCHAR(45) NOT NULL AFTER `pwd`,
ADD COLUMN `status` VARCHAR(45) NOT NULL AFTER `roleid`;
/*
 * 2017-8-31 创建调动信息表
 */
CREATE TABLE `info`.`TransferInformation` (
  `id` INT NOT NULL,
  `employeeid` VARCHAR(45) NOT NULL,
  `transfertime` DATETIME NOT NULL,
  `beforedept` VARCHAR(45) NOT NULL,
  `beforeposition` VARCHAR(45) NOT NULL,
  `afterdept` VARCHAR(45) NOT NULL,
  `afterposition` VARCHAR(45) NOT NULL,
  `reason` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
/*
 * 2017-8-31 增加部门级别信息表
 */
CREATE TABLE `info`.`DepartmentLevelInfo` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
/*
 * 2017-8-31 修改部门级别信息表
 */
  ALTER TABLE `info`.`DepartmentLevelInfo` 
ADD COLUMN `leavelid` VARCHAR(45) NOT NULL AFTER `status`;
/*
 * 2017-8-31 修改档案信息表 
 */
ALTER TABLE `info`.`Dossier` 
CHANGE COLUMN `designation` `designation` VARCHAR(45) NOT NULL ,
ADD COLUMN `dossiertime` DATETIME NOT NULL AFTER `designation`;
/*
 * 2017-8-31 修改奖惩信息表
 */
ALTER TABLE `info`.`RewardsAndPunishments` 
ADD COLUMN `rewardsTitle` VARCHAR(45) NOT NULL AFTER `rewardsCategory`;
/*
 * 2017-9-16 增加角色权限表
 */
CREATE TABLE `info`.`Permission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roleid` VARCHAR(45) NULL,
  `permission1` VARCHAR(45) NULL,
  `permission2` VARCHAR(45) NULL,
  `permission3` VARCHAR(45) NULL,
  `permission4` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
/*
 * 2017-9-17 修改角色信息表
 */
ALTER TABLE `info`.`RoleInfo` 
DROP COLUMN `permission4`,
DROP COLUMN `permission3`,
DROP COLUMN `permission2`,
DROP COLUMN `permission1`;

ALTER TABLE `info`.`RoleInfo` 
ADD COLUMN `description` VARCHAR(45) NOT NULL AFTER `roleName`,
ADD COLUMN `createtime` DATETIME NOT NULL AFTER `description`;
/*
 * 2017-9-22 添加用户角色表
 */
CREATE TABLE `info`.`AccountRole` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `rolename` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
/*
 * 2017-10-2 添加培训配别表
 */
  CREATE TABLE `info`.`TrainCategory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `catrgorycode` VARCHAR(45) NULL,
  `category` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
/*
 * 2017-10-28 添加职称信息表
 */
  CREATE TABLE `info`.`TitleRecord` (
  `id` INT NOT NULL,
  `Titlename` VARCHAR(45) NULL,
  `TitleTime` DATETIME NULL,
  `employeeid` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
/*
 * 2017-10-30 修改职称表
 */
  ALTER TABLE `info`.`TitleRecord` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;

/*
 * 2017-11-3 修改员工信息表
 */
ALTER TABLE `info`.`employee` 
CHANGE COLUMN `department` `department` VARCHAR(50) NOT NULL ;
/*
 * 2017-11-7 修改调动信息表
 */
ALTER TABLE `info`.`TransferInformation` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;
/*
 * 2017-11-8 修改培训信息表
 */
ADD COLUMN `grading` VARCHAR(45) NULL AFTER `employeeid`;