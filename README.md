# LibraryManagementSystem

- For GitHub Read Me Usage
This is a diploma course final year project by group Cultured with members, Tan Wei Harng, Ooi Wei Chuen, Kok Jhun Kit and Kong Ding Hui.
Feel free to use it if u find it useful .w.

# To setup the system
## Setup Database with XAMPP
1. Download XAMPP, and install it
2. Open XAMPP Control Panel
3. Start the Apache and MySQL
4. Open "localhost/dashboard/" on a browser, then click on the phpMyAdmin
5. Create a new database by clicking the "New" on the left hand side
6. Type in the database name (remember it need to use it later), and click create
7. Select the database that just created, go to SQL
8. In the project folder, find SQL folder, in it, open the setup.sql and copy all the query inside
9. Paste the query in the space on the phpMyAdmin site (the space that appears after step 7)
10. Click go
11. The database has been setup

## Setup Connection to database
1. Create a file named "connectionString.config" in the project folder
2. In the file paste the code below in it
```
<?xml version="1.0"?>
<connectionStrings>
	<add name="myCon"
		connectionString="Server=localhost;Database=[database name];Uid=root;"
		providerName="MySql.Data.MySqlClient;"/>
</connectionStrings>
```
3. Replace the [database name] with the name of the database (refer back to step 6 in setup database)
4. Save the file
5. The setup is complete

## Open and Run the system
1. Open the .sln file in the project folder (LibraryManagementSystem.sln)
2. Click the IIS Express
3. The webpage will then be open
Note: if the webpage can't open, open the Home.aspx and try again

## Setup the data as an librarian
- The system consist of a default admin account, the librarian can use it to type in all the data by using that account.
- The email and password are as below:
- Email: admin@admin.com
- Password: admin
