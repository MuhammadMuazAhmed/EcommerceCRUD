<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.* , java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product list</title>
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }

  body {
    background: #f0f2f5;
    padding: 20px;
    min-height: 100vh;
  }

  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
    padding: 20px;
    background: white;
    border-radius: 12px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
  }

  .header h1 {
    color: #1a1a1a;
    font-size: 24px;
  }

  .add-product-btn {
    background: #4CAF50;
    color: white;
    text-decoration: none;
    padding: 12px 24px;
    border-radius: 8px;
    font-weight: 500;
    transition: all 0.3s ease;
  }

  .add-product-btn:hover {
    background: #43a047;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(76, 175, 80, 0.2);
  }

  .card-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 24px;
    padding: 10px;
  }

  .product-card {
    border-radius: 12px;
    padding: 24px;
    background: white;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    transition: all 0.3s ease;
    border: 1px solid rgba(0, 0, 0, 0.05);
  }

  .product-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
  }

  .product-card h3 {
    color: #1a1a1a;
    font-size: 20px;
    margin-bottom: 16px;
    border-bottom: 2px solid #f0f2f5;
    padding-bottom: 10px;
  }

  .product-info {
    display: grid;
    gap: 12px;
    margin-bottom: 20px;
  }

  .product-info p {
    color: #4a4a4a;
    font-size: 15px;
    display: flex;
    align-items: center;
    gap: 8px;
  }

  .product-info strong {
    color: #2a2a2a;
    min-width: 100px;
  }

  .price-tag {
    color: #2e7d32;
    font-size: 18px;
    font-weight: 600;
  }

  .card-buttons {
    display: flex;
    gap: 12px;
    margin-top: 20px;
    padding-top: 20px;
    border-top: 1px solid #f0f2f5;
  }

  .card-buttons a {
    flex: 1;
    text-decoration: none;
    padding: 10px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 500;
    text-align: center;
    transition: all 0.3s ease;
  }

  .btn-update {
    background-color: #1976d2;
    color: white;
  }

  .btn-update:hover {
    background-color: #1565c0;
    transform: translateY(-2px);
  }

  .btn-delete {
    background-color: #d32f2f;
    color: white;
  }

  .btn-delete:hover {
    background-color: #c62828;
    transform: translateY(-2px);
  }

  @media (max-width: 768px) {
    .card-container {
      grid-template-columns: 1fr;
    }
    
    .header {
      flex-direction: column;
      gap: 16px;
      text-align: center;
    }
  }
</style>
</head>
<body>
<div class="header">
    <h1>Product Management</h1>
    <a href="addproduct.jsp" class="add-product-btn">+ Add New Product</a>
</div>

<% ResultSet rs=(ResultSet) request.getAttribute("products"); %>
<div class="card-container">
<% while(rs.next()) {    
%>
  <div class="product-card">
    <h3><%= rs.getString("name") %></h3>
    <div class="product-info">
        <p><strong>ID:</strong> <%=rs.getInt("product_id") %></p>
        <p><strong>Description:</strong> <%= rs.getString("description") %></p>
        <p class="price-tag"><strong>Price:</strong> $<%= String.format("%.2f", rs.getDouble("price")) %></p>
        <p><strong>Quantity:</strong> <%= rs.getInt("quantity") %></p>
    </div>
    
    <div class="card-buttons">
      <a href="CrudServlet?action=edit&id=<%=rs.getInt("product_id")%>" class="btn-update">
        Edit Product
      </a>
      <a href="CrudServlet?action=delete&id=<%=rs.getInt("product_id") %>" class="btn-delete" 
         onclick="return confirm('Are you sure you want to delete this product?');">
        Delete
      </a>
    </div>
  </div>
<% } rs.close(); %>
</div>

</body>
</html>