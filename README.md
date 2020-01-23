Pre-requisites:
1) Maven is setup
2) Mule 4 runtime is available and up
3) MySQL database installation available

SETUP

1) This is a Mule 4 application
2) This uses mysql database. It has been tested with v. 8.0.0.
3) Please run the DDL provided at ./MYSQL/MS3ExMYSQL.ddl against the database installation. This will create the database and the necessary tables.
4) Please, import the mysql jdbc connector jar into your local maven repository to the group com.mycompany under version 0.1. This is provided at ./MYSQL/mysql-connector-java-8.0.16.jar.
5) Download mule applications ms3defaultdomain and ms3excercise.
6) Change to the directory ms3defaultdomain at the command line. Run mvn clean package. Deploy the default domain jar (using runtime agent if run against on-prem).
7) Change to the directory ms3excercise at the command line. Run mvn clean package. Deploy the jar (using runtime agent if run against on-prem).
8) The http listeners listens to 8081. If this port is not available, please use a port that is available and change the port in the ms3excercise/src/main/resources/config.yaml file and repeat step 7.
9) SOAPUI unit test project is included at ./UnitTests-SOAPUI/MS3-soapui-project.xml.zip


AVAILABLE METHODS

The RAML spec is located at ms3excercise/src/main/resources/api/contactMgtAPI.raml

The following is the resource path for the API.
http://<<hostname:port>>/api/custmgt/contacts

1) GET  (all contacts -  query parameters - all optional - firstname, lastname, title (manager, associate1,associate2), pagenumber (1,2 etc)
2) POST (Array of contacts)
3) GET BY ID uri paramters (/{id})
4) PUT BY ID uri paramters (/{id})
5) POST BY ID uri paramters (/{id})
5) DELETE BY ID uri paramters (/{id})

Contact Example:
{
   "Identification":    {
      "FirstName": "JESSICA32",
      "LastName": "PANDIT23",
      "DOB": "06/21/1987",
      "Gender": "F",
      "Title": "MANAGER"
   },
   "Address": [   {
      "type": "CONDO",
      "number": 2234,
      "street": "blah1 blah2 St",
      "Unit": "1 b",
      "City": "Somewhere",
      "State": "KY",
      "zipcode": "32346"
   }],
   "Communication":    [
            {
         "type": "EMAIL",
         "value": "bfe2@sample.com",
         "preferred": "TRUE"
      },
            {
         "type": "CELL",
         "value": "304-555-8284",
         "preferred": ""
      }
   ],
   "ID": 199
}
