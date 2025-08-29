<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Edit Product</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      }

      body {
        background: #f0f2f5;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
      }

      .container {
        width: 100%;
        max-width: 600px;
        background: white;
        padding: 32px;
        border-radius: 16px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }

      h2 {
        color: #1a1a1a;
        margin-bottom: 24px;
        font-size: 24px;
        text-align: center;
        padding-bottom: 16px;
        border-bottom: 2px solid #f0f2f5;
      }

      .form-group {
        margin-bottom: 24px;
      }

      label {
        display: block;
        margin-bottom: 8px;
        color: #4a4a4a;
        font-weight: 500;
      }

      input[type="text"],
      input[type="number"],
      textarea {
        width: 100%;
        padding: 12px 16px;
        border: 2px solid #e0e0e0;
        border-radius: 8px;
        font-size: 15px;
        transition: all 0.3s ease;
        color: #2a2a2a;
      }

      input[type="text"]:focus,
      input[type="number"]:focus,
      textarea:focus {
        border-color: #1976d2;
        outline: none;
        box-shadow: 0 0 0 4px rgba(25, 118, 210, 0.1);
      }

      textarea {
        height: 120px;
        resize: vertical;
        font-family: inherit;
      }

      .btn-group {
        display: flex;
        gap: 12px;
        margin-top: 32px;
      }

      .btn {
        flex: 1;
        background-color: #1976d2;
        color: white;
        padding: 12px 24px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 500;
        transition: all 0.3s ease;
      }

      .btn:hover {
        background-color: #1565c0;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(25, 118, 210, 0.2);
      }

      .btn-secondary {
        background-color: #e0e0e0;
        color: #4a4a4a;
      }

      .btn-secondary:hover {
        background-color: #d5d5d5;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      }

      @media (max-width: 768px) {
        .container {
          padding: 20px;
        }
      }
    </style>
  </head>
  <body>
    <% ResultSet product = (ResultSet)request.getAttribute("product"); %>
    <div class="container">
      <h2>Edit Product</h2>
      <form action="CrudServlet" method="post">
        <input type="hidden" name="action" value="update" />
        <input type="hidden" name="id" value="<%= product.getInt("product_id")
        %>">

        <div class="form-group">
          <label>Product Name:</label>
          <input type="text" name="name" value="<%= product.getString("name")
          %>" required>
        </div>

        <div class="form-group">
          <label>Description:</label>
          <textarea name="description" required>
<%= product.getString("description") %></textarea
          >
        </div>

        <div class="form-group">
          <label>Price:</label>
          <input type="number" name="price" step="0.01" value="<%=
          product.getDouble("price") %>" required>
        </div>

        <div class="form-group">
          <label>Quantity:</label>
          <input type="number" name="quantity" value="<%=
          product.getInt("quantity") %>" required>
        </div>

        <div class="btn-group">
          <a href="CrudServlet" class="btn btn-secondary">Cancel</a>
          <button type="submit" class="btn">Update Product</button>
        </div>
      </form>
    </div>
  </body>
</html>
