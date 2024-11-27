package pe.edu.vallegrande.controller;

import pe.edu.vallegrande.db.ConexionDB;
import pe.edu.vallegrande.model.TituloDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TituloController {

    /* Listar todos los títulos */
    public List<TituloDTO> listarTodos() {
        List<TituloDTO> tituloList = new ArrayList<>();
        String query = "SELECT * FROM Titulo";

        try (Connection connection = ConexionDB.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                TituloDTO titulo = new TituloDTO();
                titulo.setId(rs.getInt("id"));
                titulo.setTitulo(rs.getString("titulo"));
                titulo.setDescripcion(rs.getString("descripcion"));
                titulo.setImg(rs.getString("Img"));
                tituloList.add(titulo);
            }
        } catch (Exception e) {
            System.out.println("Error al listar los títulos.");
            e.printStackTrace();
        }
        return tituloList;
    }

    /* Actualizar el título */
    public boolean actualizarTitulo(String titulo, String descripcion, String img) {
        String query = "UPDATE Titulo SET titulo = ?, descripcion = ?, Img = ? WHERE id = 1"; // Suponiendo que solo hay un registro
        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, titulo);
            stmt.setString(2, descripcion);
            stmt.setString(3, img);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            System.out.println("Error al actualizar el título.");
            e.printStackTrace();
            return false;
        }
    }
}
