package pe.edu.vallegrande.servlet;

import pe.edu.vallegrande.controller.VdsController;
import pe.edu.vallegrande.model.VdsDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/VdsServlet")
public class VdsServlet extends HttpServlet {

    private final VdsController vdsController = new VdsController();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "add":
                    agregarVideo(request, response);
                    break;
                case "edit":
                    editarVideo(request, response);
                    break;
                case "delete":
                    eliminarVideo(request, response);
                    break;
                default:
                    response.sendRedirect("VdsAdmin.jsp?error=Acción no válida");
            }
        } else {
            response.sendRedirect("VdsAdmin.jsp?error=No se especificó una acción");
        }
    }

    // Agregar un nuevo video
    // Agregar un nuevo video
    private void agregarVideo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String videoUrl = request.getParameter("videoUrl");
        String descripcion = request.getParameter("descripcion");  // Cambié el nombre aquí a 'descripcion'

        if (videoUrl == null || videoUrl.isEmpty()) {
            response.sendRedirect("VdsAdmin.jsp?error=La URL del video no puede estar vacía");
            return;
        }

        // Si la descripción está vacía, asignar un valor por defecto
        if (descripcion == null || descripcion.isEmpty()) {
            descripcion = "Sin descripción";
        }

        // Crear el objeto VdsDTO
        VdsDTO vds = new VdsDTO();
        vds.setVideos(videoUrl);
        vds.setDescripcion(descripcion);  // Asignar la descripción

        // Agregar el video a la base de datos
        vdsController.agregarVideo(vds);

        // Redirigir con mensaje de éxito
        response.sendRedirect("VdsAdmin.jsp?success=Video agregado exitosamente");
    }


    private void editarVideo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String videoUrl = request.getParameter("newVideoUrl");
        String descripcion = request.getParameter("newDescription");  // Cambié aquí el nombre del parámetro

        if (videoUrl == null || videoUrl.isEmpty()) {
            response.sendRedirect("VdsAdmin.jsp?error=La URL del video no puede estar vacía");
            return;
        }

        // Si la descripción está vacía, asignar un valor por defecto
        if (descripcion == null || descripcion.isEmpty()) {
            descripcion = "Sin descripción";
        }

        // Crear el objeto VdsDTO con la nueva URL y descripción
        VdsDTO vds = new VdsDTO();
        vds.setId(id);
        vds.setVideos(videoUrl);
        vds.setDescripcion(descripcion);  // Asignar la nueva descripción

        // Actualizar el video en la base de datos
        vdsController.editarVideo(vds);

        // Redirigir con mensaje de éxito
        response.sendRedirect("VdsAdmin.jsp?success=Video actualizado exitosamente");
    }


    // Eliminar un video
    private void eliminarVideo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            // Eliminar el video de la base de datos
            vdsController.eliminarVideo(id);

            // Redirigir con mensaje de éxito
            response.sendRedirect("VdsAdmin.jsp?success=Video eliminado exitosamente");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("VdsAdmin.jsp?error=Error al intentar eliminar el video");
        }
    }
}
