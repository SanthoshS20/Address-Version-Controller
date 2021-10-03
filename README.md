# README

Address Manager application is used to manage the different versions of address.

I have used Postman application for both input and output the result in the JSON format.

Created a rails project for managing the address version controller.

Address version controller is nothing but when ever there a client wants to change the address. A new version will be created. Suppose If a client wants the old address, this can be done by switching to the previous version. It is easy to change the address from the version table instead of creating a new one.


Controller : address, version
Model : address, version
DB Table : addresses, versions


**HOW TO RUN THIS APPLICATION IN YOUR LOCAL :**

1.Clone it first.

2.go to that path.

3.Create a database in the postgres with the database name that i mentioned in the "database.yml" file that is located in the config folder.

4.Create a role in postgres that i mentioned in the same file "database.yml".

5.run rails server.

6.Using postman perform different http request and response.


