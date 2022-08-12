# Alraedah-App

Alraedah sample app with the following screens/features:
- Admin Panel
- Career Page
- Login Page
- Add SKills Page
- Filter Page

## Admin Panel:
It show all the applications with infinite scroll (pagination). Admin can change the status of the application, delete the application, edit the application.

## Career Page: 
It shows Career page where user can add more skills and also upload Resume.

## Login Page:
There are 2 types of users. User can login as Admin or login as Normal user.

## Add Skills Page:
User can add more skills to the list of skills

## Filter Page:
User can add filters to refine the list of skills.

## Mocked responses:
Mocked responses are uploaded on Github Pages and can be seen here: https://github.com/riziii123/riziii123.github.io

## Unit tests:
Unit tests are there for Admin Panel screen which is testing the all non UI classes.

## Architecture:
I am using MVVM architecture with an addition of Usecases and repository layer. 

## How to Run
- Install Xcode on the mac machine.
- Download the project or clone the repo in the directory
- Run `pod install` to install all the dependencies.
- Open `xcworkspace` project in Xcode
- Run the project.

### To login in the app (also mentioned on the login screen):

```
Admin:
Username: admin
Password: admin
```


```
User:
Username: user
Password: user
```
