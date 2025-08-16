DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists;
DELIMITER $$
CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE cnt INT;
    DECLARE nextID INT;

    SELECT COUNT(*) INTO cnt
    FROM Subscribers
    WHERE SubscriberName = subName;

    IF cnt = 0 THEN
        SELECT IFNULL(MAX(SubscriberID), 0) + 1 INTO nextID
        FROM Subscribers;

        INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate)
        VALUES (nextID, subName, CURDATE());
    END IF;
END$$
DELIMITER ;
