package pe.edu.vallegrande.controller;

import pe.edu.vallegrande.db.ConexionDB;
import pe.edu.vallegrande.model.Descripcion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DescripcionController {

    /* Listar todas las descripciones */
    public List<Descripcion> listarTodos() {
        List<Descripcion> descripcionList = new ArrayList<>();
        String query = "SELECT * FROM contenido1";

        try (Connection connection = ConexionDB.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Descripcion descripcion = new Descripcion(rs.getInt("id"), rs.getString("descripcion"));
                descripcionList.add(descripcion);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return descripcionList;
    }

    /* Agregar una nueva descripción */
    public void agregarDescripcion(Descripcion descripcion) {
        String query = "INSERT INTO contenido1 (descripcion) VALUES (?)";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, descripcion.getDescripcion());
            pstmt.executeUpdate();
            System.out.println("Descripción agregada exitosamente.");
        } catch (Exception e) {
            System.out.println("Error al agregar la descripción.");
            e.printStackTrace();
        }
    }

    /* Editar una descripción existente */
    public void editarDescripcion(Descripcion descripcion) {
        String query = "UPDATE contenido1 SET descripcion = ? WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, descripcion.getDescripcion());
            pstmt.setInt(2, descripcion.getId());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Descripción actualizada exitosamente.");
            } else {
                System.out.println("No se encontró una descripción con el ID especificado.");
            }
        } catch (Exception e) {
            System.out.println("Error al actualizar la descripción.");
            e.printStackTrace();
        }
    }

    /* Eliminar una descripción */
    public void eliminarDescripcion(int id) {
        String query = "DELETE FROM contenido1 WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Descripción eliminada exitosamente.");
            } else {
                System.out.println("No se encontró una descripción con el ID especificado.");
            }
        } catch (Exception e) {
            System.out.println("Error al eliminar la descripción.");
            e.printStackTrace();
        }
    }

    /* Buscar una descripción por ID */
    public Descripcion buscarPorId(int id) {
        Descripcion descripcion = null;
        String query = "SELECT * FROM contenido1 WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                descripcion = new Descripcion(rs.getInt("id"), rs.getString("descripcion"));
            }
        } catch (Exception e) {
            System.out.println("Error al buscar la descripción.");
            e.printStackTrace();
        }

        return descripcion;
    }
}
