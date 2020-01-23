create database contactmgt;

CREATE USER 'admin2' IDENTIFIED BY 'admin2';

GRANT ALL PRIVILEGES ON contactmgt.* TO admin2 IDENTIFIED BY 'admin2';

FLUSH PRIVILEGES;

use contactmgt;

drop table IF EXISTS identification_tbl;
create table identification_tbl(
   contact_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
   first_name VARCHAR(100) NOT NULL,
   last_name VARCHAR(100) NOT NULL,
   gender ENUM("M","F","U"),
   dob DATE,
   title ENUM("MANAGER","ASSOCIATE1","ASSOCIATE2") NOT NULL,
   PRIMARY KEY ( contact_id )
);


drop table IF EXISTS address_tbl;
create table address_tbl(
		id INT UNSIGNED NOT NULL AUTO_INCREMENT,
		addrType ENUM("HOME","CONDO","APARTMENT"),
		addrNumber INT UNSIGNED,
		street VARCHAR(100),
		unit VARCHAR(20),
		city VARCHAR(50),
		state VARCHAR(10),
		zipcode VARCHAR(10),
		contact_id INT UNSIGNED NOT NULL REFERENCES identification_tbl(contact_id),
        PRIMARY KEY ( id )
);	

drop table IF EXISTS communication_tbl;
create table communication_tbl(			
		id INT UNSIGNED NOT NULL AUTO_INCREMENT,
		commType ENUM("EMAIL","CELL"),
		commValue VARCHAR(80),
	  	preferred ENUM("TRUE"),
		contact_id INT UNSIGNED NOT NULL REFERENCES identification_tbl(contact_id),
        PRIMARY KEY ( id )
);	


commit;
