<?php
/*CREATE a simple stordprocedure
DELIMITER $$

CREATE PROCEDURE getAllData()

BEGIN 

SELECT * from `bank_mst`;

END $$

DELIMITER ;

CREATE PROCEDURE getAllData() BEGIN SELECT * from `bank_mst`; END;


---------------------------------------------------------------------

DROP PROCEDURE `getTwoRecords`; CREATE DEFINER=`root`@`localhost` PROCEDURE `getTwoRecords`() COMMENT 'test' NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER BEGIN SELECT * from `bank_mst` ORDER BY `bank_mst`.`id` DESC limit 2; END

---------------------------------------------------------------------


DELIMITER $$

CREATE PROCEDURE getLogicLocalValueData()

BEGIN

DECLARE idis INT DEFAULT 0;

SET idis = 1;

SELECT * from `bank_mst` WHERE `bank_mst`.`id` = idis;

END $$

DELIMITER ;


CREATE PROCEDURE getLogicLocalValueData() BEGIN DECLARE idis INT DEFAULT 1; SELECT * from `bank_mst` WHERE `bank_mst`.`id` = idis; END;

---------------------------------------------------------------------


Delimiter //
CREATE PROCEDURE demo()
BEGIN
   DECLARE done INT DEFAULT 0;
   DECLARE playerID INT DEFAULT 0;
   DECLARE firstName VARCHAR(255) DEFAULT "";
   DECLARE lastName VARCHAR(255) DEFAULT "";
   DECLARE DOB DATE;
   DECLARE placeOfBirth VARCHAR(255) DEFAULT "";
   DECLARE playerCountry VARCHAR(255) DEFAULT "";
   DECLARE cur CURSOR FOR

   SELECT ID, First_Name, Last_Name, Date_Of_Birth, Place_Of_Birth, Country FROM Players;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cur;
   label:LOOP
   FETCH cur INTO playerID, firstName, lastName, DOB, placeOfBirth, playerCountry;
   
   IF done = 1 THEN LEAVE label;
   END IF;

   SELECT CONCAT(playerID,' ', firstName,' ', lastName, ' ', DOB, ' ', placeOfBirth, ' ', playerCountry) AS PlayerData;
   END LOOP label;
   CLOSE cur;
END//

---------------------------------------------------------------------

// with IN parameter

CREATE DEFINER=`root`@`localhost` PROCEDURE `getDetails`(IN `row_id` INT) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER BEGIN SELECT * FROM `bank_mst` WHERE `bank_mst`.`id` = row_id; END

DELIMITER $$

CREATE PROCEDURE getDetails(IN `row_id` INT)

BEGIN

SELECT * from `bank_mst` WHERE `bank_mst`.`id` = row_id;

END $$

DELIMITER ;


---------------------------------------------------------------------

// with OUT parameter

CREATE DEFINER=`root`@`localhost` PROCEDURE `getTotalCount`(OUT `total_count` INT) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER BEGIN SELECT COUNT(`id`) INTO total_count from `bank_mst`; END

BEGIN

SELECT COUNT(`id`) INTO total_count from `bank_mst`;

END 

---------------------------------------------------------------------


BEGIN

SELECT `bank_code` INTO data_is FROM `bank_mst` WHERE `bank_mst`.`id`=row_id;

SET data_is = data_is + 10;

END
SET @Idis = 1;
CALL getAllDataInOut(@Idis,@total_sum);
SELECT @total_sum as total_is;

*/










$DEFAULT_DB_HOST = "localhost";
$DEFAULT_DB_USER = "root";
$DEFAULT_DB_PASSWORD = "";
$DEFAULT_DB_NANE = "samaj-demo";


$connection = new mysqli($DEFAULT_DB_HOST, $DEFAULT_DB_USER, $DEFAULT_DB_PASSWORD, $DEFAULT_DB_NANE);

// $query = "CALL getAllData()";
// $result = $connection->query($query);
// $data = $result->fetch_all(MYSQLI_ASSOC);


// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
// ---------------------------------------------------------------------


// $query = "CALL getLogicLocalValueData()";
// $result = $connection->query($query);
// $data = $result->fetch_all(MYSQLI_ASSOC);


// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
// ---------------------------------------------------------------------


// $query = "CALL getTwoRecords()";
// $result = $connection->query($query);
// $data = $result->fetch_all(MYSQLI_ASSOC);


// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
// ---------------------------------------------------------------------


// $query = "CALL getDetails(1)";// with IN parameter
// $result = $connection->query($query);
// $data = $result->fetch_assoc();fetch_object()


// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
// ---------------------------------------------------------------------


// with OUT parameter
// $connection->multi_query("CALL `getTotalCount`(@p0); SELECT @p0 AS `total_count`;" );
// $connection->next_result();      
// $result=$connection->store_result(); 
// $data= $result->fetch_assoc();


// $connection->multi_query( "CALL getTaskPoint(@p0, @p1, @p2);SELECT @p0 AS `less_than`, @p1 AS `avg_value`, @p2 AS `more_than`" );
// $connection->next_result();      
// $result=$connection->store_result(); 
// $data= $result->fetch_assoc();


// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
// ---------------------------------------------------------------------


// with IN OUT parameter

// $query1 = "SET @p0='1';";
// $connection->query($query1);

// $query2 = " CALL `getInOutScore`(@p0);";
// $connection->query($query2);

// $query3 = "SELECT @p0 AS `tbl_value`;";
// $result = $connection->query($query3);
// $data = $result->fetch_assoc();
 

// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
// ---------------------------------------------------------------------


// with IF ELSE condition;

// $query1 = "SET @p0='4'";
// $connection->query($query1);

// $query2 = "SET @p1='23'";
// $connection->query($query2);

// $query3 = "CALL `getIfElseDeta`(@p0, @p1)";
// $connection->query($query3);

// $query4 = "SELECT @p1 AS `result_is`";
// $result = $connection->query($query4);
// $data = $result->fetch_assoc();


// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
// ---------------------------------------------------------------------


$connection->multi_query("CALL `getCaseData`(@p0); SELECT @p0 AS `value_is`;");
$connection->next_result();
$result = $connection->store_result();
$data = $result->fetch_assoc();

// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
// ---------------------------------------------------------------------

/*
basic command
SHOW PROCEDURE STATUS;
SHOW PROCEDURE STATUS WHERE db='samaj-demo';
SHOW PROCEDURE STATUS WHERE name LIKE '%getAllData%';
SHOW CREATE PROCEDURE getAllData;
DROP PROCEDURE IF EXISTS getAllData;
*/
echo "<pre>";
print_r($data);
echo "</pre>";
