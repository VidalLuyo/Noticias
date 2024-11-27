package pe.edu.vallegrande.controller;

import pe.edu.vallegrande.db.ConexionDB;
import pe.edu.vallegrande.model.AlbumDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlbumController {

    // Listar todas las imágenes
    public List<AlbumDTO> listarTodas() {
        List<AlbumDTO> albumList = new ArrayList<>();
        String query = "SELECT * FROM Albun";

        try (Connection connection = ConexionDB.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                AlbumDTO album = new AlbumDTO();
                album.setId(rs.getInt("id"));
                album.setImg(rs.getString("Img"));
                albumList.add(album);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return albumList;
    }

    // Agregar nueva imagen al álbum
    public void agregarImagen(AlbumDTO album) {
        String query = "INSERT INTO Albun (Img) VALUES (?)";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, album.getImg());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Editar imagen del álbum
    public void editarImagen(AlbumDTO album) {
        String query = "UPDATE Albun SET Img = ? WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, album.getImg());
            pstmt.setInt(2, album.getId());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Eliminar imagen del álbum
    public void eliminarImagen(int id) {
        String query = "DELETE FROM Albun WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Buscar imagen por ID (opcional, si es necesario para editar)
    public AlbumDTO buscarPorId(int id) {
        AlbumDTO album = null;
        String query = "SELECT * FROM Albun WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                album = new AlbumDTO();
                album.setId(rs.getInt("id"));
                album.setImg(rs.getString("Img"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return album;
    }
}
