#contacts.sql ---- The Anypoint Template comes packaged with a #MYSQL script to create the Database table that it uses. Make #Sure that the below scripts are executed in the oreder


SET FOREIGN_KEY_CHECKS=0;


CREATE TABLE `Identification` (
  `identificationId` mediumint(8) unsigned NOT NULL auto_increment,
  `FirstName` varchar(255) default NULL,
  `LastName` varchar(255) default NULL,
  `DOB` varchar(255),
  `Gender` varchar(255) default NULL,
  `Title` varchar(255),
  PRIMARY KEY (`identificationId`)
) AUTO_INCREMENT=1;

CREATE TABLE `Address` (
  `addressId` mediumint(8) unsigned NOT NULL auto_increment,
  `type` varchar(255) default NULL,
  `number` varchar(255) default NULL,
  `street` varchar(255) default NULL,
  `Unit` varchar(255) default NULL,
  `City` varchar(255),
  `State` varchar(50) default NULL,
  `zipcode` varchar(10) default NULL,
  `identificationId` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`addressId`),
  FOREIGN KEY (`identificationId`) REFERENCES `Identification`(`identificationId`) ON DELETE CASCADE
) AUTO_INCREMENT=1;



CREATE TABLE `Communication` (
  `communicationId` mediumint(8) unsigned NOT NULL auto_increment,
  `type` TEXT default NULL,
  `value` TEXT default NULL,
  `preferred` TEXT default NULL,

  `identificationId` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`communicationId`),
  FOREIGN KEY (`identificationId`) REFERENCES `Identification`(`identificationId`) ON DELETE CASCADE
) AUTO_INCREMENT=1;

SET FOREIGN_KEY_CHECKS=1;



#Inserting Values into all the three tables manually, These are #used to test PUT, GET and DELETE for the first time not for #Insetion. Insertion can be done directly through mule ##after #inserting tables


INSERT INTO `Identification` (`FirstName`,`LastName`,`DOB`,`Gender`,`Title`) VALUES ("Chava","Golden","11/30/2019","Krishnaa","Tincidunt Dui Augue Ltd"),("Prescott","Love","06/27/2018","Thenral","Molestie Pharetra LLC");
INSERT INTO `Identification` (`FirstName`,`LastName`,`DOB`,`Gender`,`Title`) VALUES ("Pandora","Pickett","01/10/2019","Tamanna","Ultrices Vivamus Corporation"),("Galvin","Fry","06/10/2019","Perumal","Enim LLC");


INSERT INTO `Address` (`type`,`number`,`street`,`Unit`,`City`,`State`,`zipcode`,`identificationId`) VALUES ("6456 Eu, Rd.","P.O. Box 264, 8324 Magnis Rd.","P.O. Box 827, 3300 Suspendisse St.","895-6936 Neque Av.","Bulandshahr","UP","748522",1);
INSERT INTO `Address` (`type`,`number`,`street`,`Unit`,`City`,`State`,`zipcode`,`identificationId`) VALUES ("P.O. Box 654, 3527 Non, Ave","P.O. Box 931, 2859 Luctus Street","9472 Sed, Avenue","106-2018 Cum Rd.","Hyderabad","Andhra Pradesh","969878",2);



INSERT INTO `Communication` (`type`,`value`,`preferred`,`identificationId`) VALUES ("cell","9589345234","false",1),("email","qw@gmail.com","true",1);
INSERT INTO `Communication` (`type`,`value`,`preferred`,`identificationId`) VALUES ("cell","9589345274","false",2),("email","qww@gmail.com","true",2);

#If there is any need to truncate all the three tables below are #the required scripts

DROP TABLE `Identification`;
DROP TABLE `Address`;
DROP TABLE `Communication`;
