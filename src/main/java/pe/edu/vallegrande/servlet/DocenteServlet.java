package pe.edu.vallegrande.servlet;

import pe.edu.vallegrande.controller.DocenteController;
import pe.edu.vallegrande.model.DocenteDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet("/DocenteServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5,    // 5 MB
        maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
public class DocenteServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads"; // Carpeta donde se guardarán las imágenes
    private final DocenteController docenteController = new DocenteController();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Configurar la codificación de caracteres
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Obtener la acción (agregar, editar, eliminar)
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "add":
                    agregarDocente(request, response);
                    break;
                case "edit":
                    editarDocente(request, response);
                    break;
                case "delete":
                    eliminarDocente(request, response);
                    break;
                default:
                    response.sendRedirect("admin.jsp?error=Acción no válida");
            }
        } else {
            response.sendRedirect("admin.jsp?error=No se especificó una acción");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Reutilizamos el método para eliminar en caso de que se acceda con GET
        eliminarDocente(request, response);
    }

    private void agregarDocente(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Recibir parámetros del formulario
        String nombres = request.getParameter("nombres");
        String descripcion2 = request.getParameter("descripcion2");

        // Procesar la carga de la imagen
        String filePath = null;
        Part filePart = request.getPart("img");
        if (filePart != null && filePart.getSize() > 0) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            String fileName = filePart.getSubmittedFileName();
            filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            filePath = UPLOAD_DIR + "/" + fileName;
        }

        // Crear el objeto DocenteDTO
        DocenteDTO docente = new DocenteDTO();
        docente.setNombres(nombres);
        docente.setDescripcion2(descripcion2);
        docente.setImg(filePath);

        // Agregar a la base de datos
        boolean agregado = docenteController.agregarDocente(docente);

        if (agregado) {
            response.sendRedirect("admin.jsp?success=Docente agregado exitosamente");
        } else {
            response.sendRedirect("admin.jsp?error=No se pudo agregar el docente");
        }
    }

    private void editarDocente(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombres = request.getParameter("nombres");
        String descripcion2 = request.getParameter("descripcion2");

        // Procesar la carga de la nueva imagen (opcional)
        String filePath = null;
        Part filePart = request.getPart("newImg");
        if (filePart != null && filePart.getSize() > 0) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            String fileName = filePart.getSubmittedFileName();
            filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            filePath = UPLOAD_DIR + "/" + fileName;
        } else {
            // Si no se sube nueva imagen, mantenemos la imagen actual
            DocenteDTO docenteActual = docenteController.buscarPorId(id);
            filePath = docenteActual.getImg();
        }

        // Actualizar datos del docente
        DocenteDTO docente = new DocenteDTO();
        docente.setId(id);
        docente.setNombres(nombres);
        docente.setDescripcion2(descripcion2);
        docente.setImg(filePath);

        boolean actualizado = docenteController.editarDocente(docente);

        if (actualizado) {
            response.sendRedirect("admin.jsp?success=Docente actualizado exitosamente");
        } else {
            response.sendRedirect("admin.jsp?error=No se pudo actualizar el docente");
        }
    }


    private void eliminarDocente(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // Recibir el ID del docente a eliminar
            int id = Integer.parseInt(request.getParameter("id"));

            // Eliminar de la base de datos
            boolean eliminado = docenteController.eliminarDocente(id);

            if (eliminado) {
                response.sendRedirect("admin.jsp?success=Docente eliminado exitosamente");
            } else {
                response.sendRedirect("admin.jsp?error=No se pudo eliminar el docente (ID no encontrado o error en la base de datos)");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?error=Error al intentar eliminar el docente");
        }
    }
}
