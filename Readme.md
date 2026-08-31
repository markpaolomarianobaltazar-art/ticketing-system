IT Service Desk Ticketing System

A full-stack web application designed to simulate real-world IT Service Desk operations. The system allows customers to submit support tickets, technicians to manage and resolve issues, and administrators to oversee users, assignments, and ticket activity.

This project was developed to demonstrate both IT Support knowledge and full-stack web development skills.

Features
Customer Features
Submit support tickets
View ticket status and history
Add comments to existing tickets
Technician Features
View assigned tickets
Update ticket status and priority
Add troubleshooting notes and comments
Monitor assigned workload
Administrator Features
Create and manage users
Assign technician roles
Activate and deactivate accounts
Monitor ticket activity
View ticket statistics and dashboards
First-time administrator setup for new installations
Technology Stack
JavaScript
Node.js
Express.js
MySQL
EJS
Bootstrap
CSS
AJAX
Express Session
bcrypt

Installation
1. Clone the Repository
git clone https://github.com/yourusername/ticketing-system.git
cd ticketing-system

2. Install Dependencies
npm install

3. Configure Environment Variables
Create a .env file in the project root:
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=ticketing_system

4. Setup Database
Open phpMyAdmin and create:
ticketing_system
Import one of the SQL files located in the /database folder.
Option A - Empty Database
(empty)ticketing-system.sql
Recommended for testing the first-time setup process.
When no administrator account exists, the system automatically redirects to the Administrator Setup page.
Option B - Demo Database
(loaded)ticketing-system.sql
Includes sample users, tickets, comments, and assignments for demonstration purposes.

5. Run the Application
node app.js
Visit: http://localhost:3000

Demo Accounts
Administrator
Email:
michael.santos@mbitsolutions.com
Password:
admin123

Technicians
Email:
sarah.reyes@mbitsolutions.com
Password:
test123

Email:
kevin.cruz@mbitsolutions.com
Password:
test123

Customers
Email:
anna.villanueva@acmecorp.com
Password:
test123

Email:
mark.garcia@acmecorp.com
Password:
test123

Email:
patricia.mendoza@acmecorp.com
Password:
test123

These credentials are provided for demonstration purposes only.

First-Time Setup
If no administrator account exists, the application automatically redirects users to the Administrator Setup page.
After the first administrator account is created, all future users must be managed through the Administration Panel.

Project Goals
This project demonstrates:
IT Service Desk workflows
Incident and ticket management
User authentication and authorization
Role-based access control
Database design and management
Full-stack web development using Node.js and MySQL
Administrative dashboard development

For any bugs and errors upon testing, please do not hesitate to contact me at mark.paolo.mariano.baltazar@gmail.com

Author
Mark Paolo Baltazar