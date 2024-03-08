/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

import sample.utils.DBUtils;

/**
 *
 * @author ASUS
 */
public class ProductDAO {

    private static final String LOADPRODUCT = "SELECT productID, name, price, quantity FROM Products WHERE name like ?";
    private static final String UPDATEPRODUCT = "UPDATE Products SET name = ?, quantity = ?, price = ? WHERE productID = ?";
    private static final String DELETEPRODUCT = "DELETE Products WHERE productID = ?";
    private static final String INSERTPRODUCT = "INSERT INTO Products(productID, name, quantity, price) VALUES(?,?,?,?)";
    private static final String DUPLICATEPRODUCT = "SELECT name FROM Products WHERE productID=?";

    public List<ProductDTO> getListProduct(String searchProduct) throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOADPRODUCT);

                ptm.setString(1, "%" + searchProduct + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    listProduct.add(new ProductDTO(productID, name, price, quantity));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listProduct;
    }
    
    public boolean update(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATEPRODUCT);
                ptm.setString(1, product.getName());
                ptm.setInt(2, product.getQuantity());
                ptm.setDouble(3, product.getPrice());
                ptm.setString(4, product.getProductID());

                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateProductManager(String productID, int quantity,
            double price, String name)
            throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //1. get connection
            con = DBUtils.getConnection();
            if (con != null) {
                //2.sql commands
                String sql = "Update tblProducts "
                        + "set name = ?, quantity = ?, price = ? "
                        + "where productID =? ";
                //3.stm create
                stm = con.prepareStatement(sql);
                stm.setString(1, name);
                stm.setInt(2, quantity);
                stm.setDouble(3, price);
                stm.setString(4, productID);
                //4. execute querry
                int effrows = stm.executeUpdate();
                //5.process                
                if (effrows > 0) {
                    result = true;
                }//end traversal
            }//con existed
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }
    public boolean delete(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETEPRODUCT);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insertV2(ProductDTO product) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERTPRODUCT);
                ptm.setString(1, product.getProductID());
                ptm.setString(2, product.getName());
                ptm.setInt(3, product.getQuantity());
                ptm.setDouble(4, product.getPrice());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicate(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DUPLICATEPRODUCT);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return check;
    }

    public boolean insert(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERTPRODUCT);
                ptm.setString(1, product.getProductID());
                ptm.setString(2, product.getName());
                ptm.setInt(3, product.getQuantity());
                ptm.setDouble(4, product.getPrice());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
