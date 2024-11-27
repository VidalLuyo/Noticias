package pe.edu.vallegrande.controller;

import pe.edu.vallegrande.db.ConexionDB;
import pe.edu.vallegrande.model.ContenidoDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContenidoController {

    /* Listar todos los contenidos */
    public List<ContenidoDTO> listarTodos() {
        List<ContenidoDTO> contenidoList = new ArrayList<>();
        String query = "SELECT * FROM Contenido";

        try (Connection connection = ConexionDB.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                ContenidoDTO contenido = new ContenidoDTO();
                contenido.setId(rs.getInt("id"));
                contenido.setContenido(rs.getString("Contenido"));
                contenido.setDescripcion(rs.getString("descripcion"));
                contenido.setImg(rs.getString("Img"));
                contenidoList.add(contenido);
            }
        } catch (Exception e) {
            System.out.println("Error al listar los contenidos.");
            e.printStackTrace();
        }
        return contenidoList;
    }



    /* Agregar un nuevo contenido */
    public boolean agregarContenido(ContenidoDTO contenido) {
        String query = "INSERT INTO Contenido (Contenido, descripcion, Img) VALUES (?, ?, ?)";
        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, contenido.getContenido());
            pstmt.setString(2, contenido.getDescripcion());
            pstmt.setString(3, contenido.getImg());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /* Editar contenido */
    public boolean editarContenido(ContenidoDTO contenido) {
        String query = "UPDATE Contenido SET Contenido = ?, descripcion = ?, Img = ? WHERE id = ?";
        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, contenido.getContenido());
            pstmt.setString(2, contenido.getDescripcion());
            pstmt.setString(3, contenido.getImg());
            pstmt.setInt(4, contenido.getId());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /* Eliminar contenido */
    public boolean eliminarContenido(int id) {
        String query = "DELETE FROM Contenido WHERE id = ?";
        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /* Buscar un contenido por ID */
    public ContenidoDTO buscarPorId(int id) {
        ContenidoDTO contenido = null;
        String query = "SELECT * FROM Contenido WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                contenido = new ContenidoDTO();
                contenido.setId(rs.getInt("id"));
                contenido.setContenido(rs.getString("Contenido"));
                contenido.setDescripcion(rs.getString("descripcion"));
                contenido.setImg(rs.getString("Img"));
            }
        } catch (Exception e) {
            System.out.println("Error al buscar el contenido.");
            e.printStackTrace();
        }

        return contenido;
    }
}
