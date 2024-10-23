package pe.edu.vallegrande.controller;

import pe.edu.vallegrande.db.ConexionDB;
import pe.edu.vallegrande.model.Politica;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PoliticaController {

    /* Listar todas las políticas */
    public List<Politica> listarTodos() {
        List<Politica> politicaList = new ArrayList<>();
        String query = "SELECT * FROM Politica";

        try (Connection connection = ConexionDB.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Politica politica = new Politica(rs.getInt("id"), rs.getString("titulo"), rs.getString("descripcion"));
                politicaList.add(politica);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return politicaList;
    }

    /* Agregar una nueva política */
    public void agregarPolitica(Politica politica) {
        String query = "INSERT INTO Politica (titulo, descripcion) VALUES (?, ?)";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, politica.getTitulo());
            pstmt.setString(2, politica.getDescripcion());
            pstmt.executeUpdate();
            System.out.println("Política agregada exitosamente.");
        } catch (Exception e) {
            System.out.println("Error al agregar la política.");
            e.printStackTrace();
        }
    }

    /* Editar una política existente */
    public void editarPolitica(Politica politica) {
        String query = "UPDATE Politica SET titulo = ?, descripcion = ? WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, politica.getTitulo());
            pstmt.setString(2, politica.getDescripcion());
            pstmt.setInt(3, politica.getId());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Política actualizada exitosamente.");
            } else {
                System.out.println("No se encontró una política con el ID especificado.");
            }
        } catch (Exception e) {
            System.out.println("Error al actualizar la política.");
            e.printStackTrace();
        }
    }

    /* Eliminar una política */
    public void eliminarPolitica(int id) {
        String query = "DELETE FROM Politica WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Política eliminada exitosamente.");
            } else {
                System.out.println("No se encontró una política con el ID especificado.");
            }
        } catch (Exception e) {
            System.out.println("Error al eliminar la política.");
            e.printStackTrace();
        }
    }

    /* Buscar una política por ID */
    public Politica buscarPorId(int id) {
        Politica politica = null;
        String query = "SELECT * FROM Politica WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                politica = new Politica(rs.getInt("id"), rs.getString("titulo"), rs.getString("descripcion"));
            }
        } catch (Exception e) {
            System.out.println("Error al buscar la política.");
            e.printStackTrace();
        }

        return politica;
    }
}
