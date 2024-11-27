package pe.edu.vallegrande.controller;

import pe.edu.vallegrande.db.ConexionDB;
import pe.edu.vallegrande.model.VdsDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VdsController {

    // Listar todos los videos
    public List<VdsDTO> listarTodos() {
        List<VdsDTO> vdsList = new ArrayList<>();
        String query = "SELECT * FROM VDS";

        try (Connection connection = ConexionDB.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                VdsDTO vds = new VdsDTO();
                vds.setId(rs.getInt("id"));
                vds.setVideos(rs.getString("Videos"));
                vds.setDescripcion(rs.getString("descripcion"));  // Agregar la descripción
                vdsList.add(vds);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return vdsList;
    }

    // Agregar un nuevo video
    public void agregarVideo(VdsDTO vds) {
        String query = "INSERT INTO VDS (Videos, descripcion) VALUES (?, ?)";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, vds.getVideos());
            pstmt.setString(2, vds.getDescripcion());  // Incluir la descripción al insertar
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Editar un video existente
    public void editarVideo(VdsDTO vds) {
        String query = "UPDATE VDS SET Videos = ?, descripcion = ? WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, vds.getVideos());
            pstmt.setString(2, vds.getDescripcion());  // Actualizar la descripción
            pstmt.setInt(3, vds.getId());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Eliminar un video por ID
    public void eliminarVideo(int id) {
        String query = "DELETE FROM VDS WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Buscar video por ID (opcional, si es necesario para editar o mostrar detalles)
    public VdsDTO buscarPorId(int id) {
        VdsDTO vds = null;
        String query = "SELECT * FROM VDS WHERE id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                vds = new VdsDTO();
                vds.setId(rs.getInt("id"));
                vds.setVideos(rs.getString("Videos"));
                vds.setDescripcion(rs.getString("descripcion"));  // Incluir la descripción en la búsqueda
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return vds;
    }

}
