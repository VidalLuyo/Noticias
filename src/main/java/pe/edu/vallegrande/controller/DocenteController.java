package pe.edu.vallegrande.controller;

import pe.edu.vallegrande.db.ConexionDB;
import pe.edu.vallegrande.model.DocenteDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DocenteController {

    /* Listar todos los docentes */
    public List<DocenteDTO> listarTodos() {
        List<DocenteDTO> docenteList = new ArrayList<>();
        String query = "SELECT * FROM Docentes";

        try (Connection connection = ConexionDB.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                DocenteDTO docente = new DocenteDTO();
                docente.setId(rs.getInt("id"));
                docente.setImg(rs.getString("Img"));
                docente.setNombres(rs.getString("Nombres"));
                docente.setDescripcion2(rs.getString("Descripcion2"));
                docenteList.add(docente);
            }
        } catch (Exception e) {
            System.out.println("Error al listar los docentes.");
            e.printStackTrace();
        }
        return docenteList;
    }

    /* Agregar un nuevo docente */
    public boolean agregarDocente(DocenteDTO docente) {
        String query = "INSERT INTO Docentes (Img, Nombres, Descripcion2) VALUES (?, ?, ?)";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, docente.getImg());
            pstmt.setString(2, docente.getNombres());
            pstmt.setString(3, docente.getDescripcion2());
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("Error al agregar el docente.");
            e.printStackTrace();
            return false;
        }
    }


    /* Editar un docente existente */
    public boolean editarDocente(DocenteDTO docente) {
        String query = "UPDATE Docentes SET Img = ?, Nombres = ?, Descripcion2 = ? WHERE id = ?";
        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, docente.getImg());
            pstmt.setString(2, docente.getNombres());
            pstmt.setString(3, docente.getDescripcion2());
            pstmt.setInt(4, docente.getId());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0; // Devuelve true si al menos una fila fue afectada
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Devuelve false si hay un error
        }
    }


    /* Eliminar un docente */
    public boolean eliminarDocente(int id) {
        String query = "DELETE FROM Docentes WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0; // Devuelve true si al menos una fila fue eliminada
        } catch (Exception e) {
            System.out.println("Error al eliminar el docente.");
            e.printStackTrace();
            return false;
        }
    }


    /* Buscar un docente por ID */
    public DocenteDTO buscarPorId(int id) {
        DocenteDTO docente = null;
        String query = "SELECT * FROM Docentes WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                docente = new DocenteDTO();
                docente.setId(rs.getInt("id"));
                docente.setImg(rs.getString("Img"));
                docente.setNombres(rs.getString("Nombres"));
                docente.setDescripcion2(rs.getString("Descripcion2"));
            }
        } catch (Exception e) {
            System.out.println("Error al buscar el docente.");
            e.printStackTrace();
        }

        return docente;
    }
}
