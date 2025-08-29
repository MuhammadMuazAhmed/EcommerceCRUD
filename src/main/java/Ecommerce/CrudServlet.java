package Ecommerce;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/CrudServlet")
public class CrudServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String dbUrl;
	private String dbUser;
	private String dbPassword;

	@Override
	public void init() throws ServletException {
		try {
			// Load the properties file using ServletContext
			Properties props = new Properties();
			String configPath = "/WEB-INF/classes/config.properties";
			InputStream input = getServletContext().getResourceAsStream(configPath);

			if (input == null) {
				throw new ServletException("Unable to find config.properties at " + configPath);
			}

			props.load(input);

			// Get the database properties
			dbUrl = props.getProperty("db.url");
			dbUser = props.getProperty("db.user");
			dbPassword = props.getProperty("db.password");

			if (dbUrl == null || dbUser == null || dbPassword == null) {
				throw new ServletException("Database properties not found in config file");
			}

			input.close();
		} catch (IOException e) {
			throw new ServletException("Error loading configuration: " + e.getMessage());
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action == null)
			action = "list";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

			if (action.equals("delete")) {
				int id = Integer.parseInt(req.getParameter("id"));
				PreparedStatement ps = conn.prepareStatement("Delete from products where product_id=?");
				ps.setInt(1, id);

				ps.executeUpdate();
				ps.close();
				resp.sendRedirect("CrudServlet");
				conn.close();
				return;
			} else if (action.equals("edit")) {
				int id = Integer.parseInt(req.getParameter("id"));
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM products WHERE product_id=?");
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					req.setAttribute("product", rs);
					req.getRequestDispatcher("editproduct.jsp").forward(req, resp);
				}
				rs.close();
				ps.close();
				conn.close();
				return;
			}

			// default: list all products

			else {
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select * from products");
				req.setAttribute("products", rs);
				req.getRequestDispatcher("Productlist.jsp").forward(req, resp);
				rs.close();
				stmt.close();
				conn.close();
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String action = req.getParameter("action");
			String name = req.getParameter("name");
			String description = req.getParameter("description");
			double price = Double.parseDouble(req.getParameter("price"));
			int quantity = Integer.parseInt(req.getParameter("quantity"));

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

			if ("update".equals(action)) {
				try {
					int id = Integer.parseInt(req.getParameter("id"));
					PreparedStatement ps = conn.prepareStatement(
							"UPDATE products SET name=?, description=?, price=?, quantity=? WHERE product_id=?");
					ps.setString(1, name);
					ps.setString(2, description);
					ps.setDouble(3, price);
					ps.setInt(4, quantity);
					ps.setInt(5, id);

					int rowsUpdated = ps.executeUpdate();
					ps.close();

					if (rowsUpdated > 0) {
						resp.sendRedirect("CrudServlet");
					} else {
						throw new ServletException("Update failed - no rows were updated");
					}
				} catch (SQLException e) {
					throw new ServletException("Error updating product: " + e.getMessage());
				}
			} else {
				// Insert new product
				PreparedStatement ps = conn
						.prepareStatement(
								"INSERT INTO products (name, description, price, quantity) VALUES (?, ?, ?, ?)");
				ps.setString(1, name);
				ps.setString(2, description);
				ps.setDouble(3, price);
				ps.setInt(4, quantity);
				ps.executeUpdate();
				ps.close();
				resp.sendRedirect("CrudServlet");
			}
			conn.close();
		} catch (Exception e) {
			throw new ServletException("Error in doPost: " + e.getMessage());
		}
	}
}
