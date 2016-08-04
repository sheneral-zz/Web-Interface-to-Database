/* Update Customer's name: */

DELIMITER //

CREATE PROCEDURE UpdateSGCustomerName

(IN oldCustomerLastName Char(25),
IN oldCustomerFirstName Char(25),
IN newCustomerLastName Char(25),
IN newCustomerFirstName Char(25))

BEGIN
DECLARE varRowCount Int;

SELECT COUNT(*) INTO varRowCount

FROM SG_CUSTOMER AS C1

WHERE C1.LastName = oldCustomerLastName

AND C1.FirstName = oldCustomerFirstName

;

IF (varRowCount > 1) THEN
ROLLBACK;

ELSE
UPDATE SG_CUSTOMER

SET LastName = newCustomerLastName,
FirstName = newCustomerFirstName

WHERE LastName = oldCustomerLastName

AND FirstName = oldCustomerFirstName;


END IF;
END

/*search by author's name and book title (join 3 tables): */

DELIMITER //

CREATE PROCEDURE SearchByAuthor(varAuthorFName char(30), varAuthorLName char(30), varTitle char(40))
  BEGIN
  select FirstName, LastName, i.Title
  from SG_AUTHOR a
  join SG_AUTHOR_INVENTORY_INT ai
  on a.AuthorID=ai.AuthorID
  join SG_INVENTORY i
  on i.TitleID=ai.TitleID
  where FirstName=varAuthorFName and LastName=varAuthorLName and i.Title=varTitle;

 END 
 //
 DELIMITER ;
 
/*sql to above: */
select FirstName, LastName, i.Title
  from SG_AUTHOR a
  join SG_AUTHOR_INVENTORY_INT ai
  on a.AuthorID=ai.AuthorID
  join SG_INVENTORY i
  on i.TitleID=ai.TitleID
  where FirstName = "Shen" and LastName="Gao" and Title="The Hell";
 
/* insert new customer info*/
insert into SG_CUSTOMER(FirstName, LastName, Address, ZipCode, PhoneNumber)
  values("Cuiling", "Zhang", "64 Ashland Ave", "01909", 8483939292);

/* insert new customer procedure*/
DELIMITER //
  
  CREATE PROCEDURE InsertSGCustomer(varFName char(30), varLName char(30), varAddress char(60), varZipCode mediumint(5), varPhone char(30))
  BEGIN
  
  insert into SG_CUSTOMER(FirstName, LastName, Address, ZipCode, PhoneNumber)
  values(varFName, varLName, varAddress, varZipCode, varPhone);

  END
  //
DELIMITER; 

/* insert book name to inventory: */

DELIMITER //
  
  CREATE PROCEDURE insertTitle(varTitle char(50), varPublicationDate date)
  begin 
  insert into SG_INVENTORY(Title, PublicationDate)
  values(varTitle, varPublicationDate);
  
  end
  //
  DELIMITER; 

/* insert new author name: */

DELIMITER //
  
  CREATE PROCEDURE insertAuthor(varFirstName char(50), varLastName char(50))
  begin 
  insert into SG_AUTHOR(FirstName, LastName)
  values(varFirstName, varLastName);
  
  end
  //
  DELIMITER; 
  
/* sql for adding foreign keys into intersection table: */
insert into SG_AUTHOR_INVENTORY_INT(TitleID, AuthorID)
  values((select TitleID from SG_INVENTORY where Title="Math 101"), (select AuthorID from SG_AUTHOR where FirstName="Bulang" and LastName="Gao"));
  
/* stored procedure to add info to SG_AUTHOR and SG_INVENTORY and SG_AUTHOR_INVENTORY_INT tables: */

DELIMITER //

CREATE PROCEDURE addAuthorBook2(varFirstName char(30), varLastName char(30), varTitle char(40), varPublicationDate date)

BEGIN
    insert into SG_AUTHOR(FirstName, LastName)
    values(varFirstName, varLastName);
  select LAST_INSERT_ID() into @author_id;
    
  insert into SG_INVENTORY(Title, PublicationDate)
    values(varTitle, varPublicationDate);
  select LAST_INSERT_ID() into @inventory_id;
 
  insert into SG_AUTHOR_INVENTORY_INT(TitleID, AuthorID)
    values(@inventory_id, @author_id); 
  
 END
 //
 DELIMITER;
  
/* search by author sql*/
select * from SG_AUTHOR 
  where FirstName like "Shen"
  and LastName like "Gao";
  
/*search by book title sql */
select * from SG_INVENTORY
  where Title like "%car%";
  
/* see if book has been returned: */
select Title, ReturnDate
  from SG_INVENTORY i
  join SG_RETURN_INFO ri
  on i.TitleID=ri.TitleID
  where Title like "%humans%";
  
/* procedure to above: */
DELIMITER //
  CREATE PROCEDURE checkBookReturn(varTitle char(30))
  BEGIN
    
  select Title, ReturnDate
  from SG_INVENTORY i
  join SG_RETURN_INFO ri
  on i.TitleID=ri.TitleID
  where Title like CONCAT("%", varTitle, "%");

 end
  //
  DELIMITER; 

/* check if book has been borrowed and returned */
select Title, BorrowDate, ReturnDate
  from SG_INVENTORY i
  join SG_BOOKS_LENT bl
  on i.TitleID=bl.TitleID
  join SG_RETURN_INFO ri
  on bl.TitleID=ri.TitleID
  where Title like "%humans%";

/* procedure to above: */
DELIMITER //
  
  CREATE PROCEDURE checkBorrowReturn(varTitle char(30))
  BEGIN
    
  select Title, BorrowDate, ReturnDate
  from SG_INVENTORY i
  join SG_BOOKS_LENT bl
  on i.TitleID=bl.TitleID
  join SG_RETURN_INFO ri
  on bl.TitleID=ri.TitleID
  where Title like CONCAT("%", varTitle, "%");
    
  end
  //
  DELIMITER;
  
/* search by author name linking to title: */
DELIMITER //
  
  CREATE PROCEDURE SearchByAuthorName(varFirstName char(30), varLastName char(30))
  BEGIN

  select FirstName, LastName, i.TItle
  from SG_AUTHOR a
  join SG_AUTHOR_INVENTORY_INT ai
  on a.AuthorID=ai.AuthorID
  join SG_INVENTORY i
  on i.TitleID=ai.TitleID
  where FirstName=varFirstName and LastName=varLastName;
  
  end
//
  DELIMITER;
