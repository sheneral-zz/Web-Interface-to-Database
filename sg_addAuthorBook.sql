DELIMITER //
CREATE PROCEDURE addAuthorBook(varFirstName char(30), varLastName char(30), varTitle char(40), varPublicationDate date)
BEGIN
  insert into SG_AUTHOR(FirstName, LastName)
    values(varFirstName, varLastName);
 
  insert into SG_INVENTORY(Title, PublicationDate)
    values(varTitle, varPublicationDate);
 
  insert into SG_AUTHOR_INVENTORY_INT(TitleID, AuthorID)
    values((select TitleID from SG_INVENTORY where Title=varTitle), (select AuthorID from SG_AUTHOR where FirstName=varFirstName and LastName=varLastName)); 
  
 END
 //
 DELIMITER;