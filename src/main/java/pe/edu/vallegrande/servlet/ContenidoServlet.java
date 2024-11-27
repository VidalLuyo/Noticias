package pe.edu.vallegrande.servlet;

import pe.edu.vallegrande.controller.ContenidoController;
import pe.edu.vallegrande.model.ContenidoDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet("/ContenidoServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5,    // 5 MB
        maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
public class ContenidoServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";
    private final ContenidoController contenidoController = new ContenidoController();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Configurar la codificación de caracteres para manejar tildes, ñ, etc.
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Obtener la acción (agregar, editar, eliminar)
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "add":
                    agregarContenido(request, response);
                    break;
                case "edit":
                    editarContenido(request, response);
                    break;
                case "delete":
                    eliminarContenido(request, response);
                    break;
                default:
                    response.sendRedirect("ContenidoAdmin.jsp?error=Acción no válida");
            }
        } else {
            response.sendRedirect("ContenidoAdmin.jsp?error=No se especificó una acción");
        }
    }

    private void agregarContenido(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String contenido = request.getParameter("contenido");
        String descripcion = request.getParameter("descripcion");

        // Validación de campos
        if (contenido == null || contenido.trim().isEmpty() || descripcion == null || descripcion.trim().isEmpty()) {
            response.sendRedirect("ContenidoAdmin.jsp?error=Los campos de contenido y descripción son obligatorios");
            return;
        }

        // Procesar imagen
        String filePath = processImage(request.getPart("img"));

        if (filePath == null) {
            response.sendRedirect("ContenidoAdmin.jsp?error=Debe seleccionar una imagen válida");
            return;
        }

        ContenidoDTO contenidoDTO = new ContenidoDTO();
        contenidoDTO.setContenido(contenido);
        contenidoDTO.setDescripcion(descripcion);
        contenidoDTO.setImg(filePath);

        boolean agregado = contenidoController.agregarContenido(contenidoDTO);

        if (agregado) {
            response.sendRedirect("ContenidoAdmin.jsp?success=Contenido agregado exitosamente");
        } else {
            response.sendRedirect("ContenidoAdmin.jsp?error=No se pudo agregar el contenido");
        }
    }

    private void editarContenido(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String contenido = request.getParameter("contenido");
        String descripcion = request.getParameter("descripcion");

        // Validación de campos
        if (contenido == null || contenido.trim().isEmpty() || descripcion == null || descripcion.trim().isEmpty()) {
            response.sendRedirect("ContenidoAdmin.jsp?error=Los campos de contenido y descripción son obligatorios");
            return;
        }

        // Verificar si hay una nueva imagen
        String filePath = request.getPart("newImg") != null && request.getPart("newImg").getSize() > 0
                ? processImage(request.getPart("newImg"))
                : contenidoController.buscarPorId(id).getImg();

        if (filePath == null) {
            response.sendRedirect("ContenidoAdmin.jsp?error=Debe seleccionar una imagen válida");
            return;
        }

        ContenidoDTO contenidoDTO = new ContenidoDTO();
        contenidoDTO.setId(id);
        contenidoDTO.setContenido(contenido);
        contenidoDTO.setDescripcion(descripcion);
        contenidoDTO.setImg(filePath);

        boolean actualizado = contenidoController.editarContenido(contenidoDTO);

        if (actualizado) {
            response.sendRedirect("ContenidoAdmin.jsp?success=Contenido actualizado exitosamente");
        } else {
            response.sendRedirect("ContenidoAdmin.jsp?error=No se pudo actualizar el contenido");
        }
    }

    private void eliminarContenido(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean eliminado = contenidoController.eliminarContenido(id);

            if (eliminado) {
                response.sendRedirect("ContenidoAdmin.jsp?success=Contenido eliminado exitosamente");
            } else {
                response.sendRedirect("ContenidoAdmin.jsp?error=No se pudo eliminar el contenido");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ContenidoAdmin.jsp?error=Error al intentar eliminar el contenido");
        }
    }

    private String processImage(Part filePart) throws IOException {
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = filePart.getSubmittedFileName();
            // Validar la extensión de la imagen
            if (!isValidImage(fileName)) {
                return null;
            }

            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            return UPLOAD_DIR + "/" + fileName;
        }
        return null;
    }

    private boolean isValidImage(String fileName) {
        // Validar que el archivo tenga una extensión de imagen
        String[] allowedExtensions = {"jpg", "jpeg", "png", "gif"};
        String extension = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();
        for (String ext : allowedExtensions) {
            if (ext.equals(extension)) {
                return true;
            }
        }
        return false;
    }
}
