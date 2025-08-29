# Ecommerce CRUD Application 🛒

A simple **Java-based E-commerce Web Application** built using **JSP, Servlets, and JDBC** with complete **CRUD (Create, Read, Update, Delete)** functionality for product management.

---

## 🚀 Features
- Add new products
- View all products
- Update existing products
- Delete products
- Clean and simple UI

---

## 🛠️ Tech Stack
- **Frontend:** JSP, HTML, CSS
- **Backend:** Java Servlets
- **Database:** MySQL
- **Server:** Apache Tomcat

---

## 📂 Project Structure
EcommerceCRUD/

├── .settings

 │ ├── .jsdtscope

 │ ├── org.eclipse.core.resources.prefs

 │ ├── org.eclipse.jdt.core.prefs

 │ ├── org.eclipse.wst.common.component

 │ ├── org.eclipse.wst.common.project.facet.core.xml

 │ ├── org.eclipse.wst.jsdt.ui.superType.container

 │ ├── org.eclipse.wst.jsdt.ui.superType.name

├── build

 │ └── classes/Ecommerce/CrudServlet.class

├── src

 │ └── main/java/Ecommerce/CrudServlet.java

├── webapp

 │ ├── META-INF/MANIFEST.MF

 │ ├── WEB-INF

 │ │ ├── classes

 │ │ ├── lib

 │ │ └── web.xml

 │ ├── Productlist.jsp

 │ ├── addproduct.jsp

 │ ├── editproduct.jsp

├── .classpath

├── .gitignore

├── .project

---

## ⚡ Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/MuhammadMuazAhmed/EcommerceCRUD.git
   ```
   
Import the project into your IDE (Eclipse/IntelliJ).

Configure your Tomcat server.

Set up MySQL database:

```CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  description TEXT
);
```
Update your DB connection settings in the project.

Deploy the project on Tomcat and run:

```
 http://localhost:8080/EcommerceCRUD/
```
## 📸 Screenshots
<img width="1337" height="435" alt="1" src="https://github.com/user-attachments/assets/ba1666d4-c4ab-45bc-bc09-191b0ea2f501" />
<img width="795" height="625" alt="2" src="https://github.com/user-attachments/assets/926c5ffc-2a20-4edc-baf9-fb61aa5e0db9" />
<img width="628" height="462" alt="3" src="https://github.com/user-attachments/assets/30a7b868-a130-4219-931c-6db05e92beed" />
<img width="824" height="644" alt="4" src="https://github.com/user-attachments/assets/5e08323a-cf15-4e2e-b47c-3437d1f2c40c" />



## 📌 Future Improvements
Add user authentication (login/register)

Implement shopping cart

Add payment gateway integration

## 🤝 Contributing
Contributions are welcome! Feel free to fork this repo and submit a PR.
