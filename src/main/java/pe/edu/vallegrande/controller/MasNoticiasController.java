package pe.edu.vallegrande.controller;

import pe.edu.vallegrande.db.ConexionDB;
import pe.edu.vallegrande.model.MasNoticiasDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class MasNoticiasController {

    /* Listar todas las noticias */
    public List<MasNoticiasDTO> listarTodas() {
        List<MasNoticiasDTO> noticiasList = new ArrayList<>();
        String query = "SELECT * FROM Mas_noticias";

        try (Connection connection = ConexionDB.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                MasNoticiasDTO noticia = new MasNoticiasDTO();
                noticia.setId(rs.getInt("id"));
                noticia.setContenido(rs.getString("Contenido"));
                noticia.setDescripcion(rs.getString("descripcion"));
                noticia.setImg(rs.getString("Img"));
                noticiasList.add(noticia);
            }
        } catch (Exception e) {
            System.out.println("Error al listar las noticias.");
            e.printStackTrace();
        }
        return noticiasList.isEmpty() ? new ArrayList<>() : noticiasList;  // Retorna lista vacía si no hay noticias
    }


    /* Agregar una nueva noticia */
    public void agregarNoticia(MasNoticiasDTO noticia) {
        String query = "INSERT INTO Mas_noticias (Contenido, descripcion, Img) VALUES (?, ?, ?)";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, noticia.getContenido());
            pstmt.setString(2, noticia.getDescripcion());
            pstmt.setString(3, noticia.getImg());
            pstmt.executeUpdate();
            System.out.println("Noticia agregada exitosamente.");
        } catch (Exception e) {
            System.out.println("Error al agregar la noticia.");
            e.printStackTrace();
        }
    }



    /* Editar una noticia existente */
    public void editarNoticia(MasNoticiasDTO noticia) {
        String query = "UPDATE Mas_noticias SET Contenido = ?, descripcion = ?, Img = ? WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, noticia.getContenido());
            pstmt.setString(2, noticia.getDescripcion());
            pstmt.setString(3, noticia.getImg());
            pstmt.setInt(4, noticia.getId());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Noticia actualizada exitosamente.");
            } else {
                System.out.println("No se encontró una noticia con el ID especificado.");
            }
        } catch (Exception e) {
            System.out.println("Error al actualizar la noticia.");
            e.printStackTrace();
        }
    }

    /* Eliminar una noticia por ID */
    public void eliminarNoticia(int id) {
        String query = "DELETE FROM Mas_noticias WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Noticia eliminada exitosamente.");
            } else {
                System.out.println("No se encontró una noticia con el ID especificado.");
            }
        } catch (Exception e) {
            System.out.println("Error al eliminar la noticia.");
            e.printStackTrace();
        }
    }

    public MasNoticiasDTO obtenerNoticiaAleatoria() {
        String query = "SELECT * FROM Mas_noticias ORDER BY RAND() LIMIT 1";
        MasNoticiasDTO noticia = null;
        try (Connection connection = ConexionDB.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            if (rs.next()) {
                noticia = new MasNoticiasDTO();
                noticia.setId(rs.getInt("id"));
                noticia.setContenido(rs.getString("Contenido"));
                noticia.setDescripcion(rs.getString("descripcion"));
                noticia.setImg(rs.getString("Img"));
            }
        } catch (Exception e) {
            System.out.println("Error al obtener la noticia aleatoria.");
            e.printStackTrace();
        }
        return noticia;
    }


    /* Buscar una noticia por ID */
    public MasNoticiasDTO buscarPorId(int id) {
        MasNoticiasDTO noticia = null;
        String query = "SELECT * FROM Mas_noticias WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                noticia = new MasNoticiasDTO();
                noticia.setId(rs.getInt("id"));
                noticia.setContenido(rs.getString("Contenido"));
                noticia.setDescripcion(rs.getString("descripcion"));
                noticia.setImg(rs.getString("Img"));
            }
        } catch (Exception e) {
            System.out.println("Error al buscar la noticia.");
            e.printStackTrace();
        }

        return noticia;
    }
}
