# README

Input and Output is in JSON Format

I have used Postman application for both input and output the result in JSON

Created a rails project for managing the address version

Address version is nothing but when ever there is a client wants to change the address. If is changed the address the previous address is moved to the version table.

The reason why we are adding the previous address in the version table because when the client necessary wants the previous address. It is easy to change the current from the version table.

Controller : address, version
Model : address,version
DB Table : addresses, versions



HOW TO RUN THIS APPLICATION IN YOUR LOCAL :
1.Clone it first.
2.Create a database in the postgres with the database name that i mentioned in the "database.yml" file that is located in the config folder.
3.Create a role in postgres that i mentioned in the same file "database.yml".
4.run rails server.
5.Using postman perform different http request and response.


