package pe.edu.vallegrande.servlet;

import pe.edu.vallegrande.controller.MasNoticiasController;
import pe.edu.vallegrande.model.MasNoticiasDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet("/MasNoticiasServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5,    // 5 MB
        maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
public class MasNoticiasServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads"; // Carpeta donde se guardarán las imágenes
    private final MasNoticiasController noticiasController = new MasNoticiasController();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "add":
                    agregarNoticia(request, response);
                    break;
                case "edit":
                    editarNoticia(request, response);
                    break;
                case "delete":
                    eliminarNoticia(request, response);
                    break;
                default:
                    response.sendRedirect("MasNoticiasAdmin.jsp?error=Acción no válida");
            }
        } else {
            response.sendRedirect("MasNoticiasAdmin.jsp?error=No se especificó una acción");
        }
    }

    private void agregarNoticia(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Procesar la carga de la imagen
        String filePath = null;
        Part filePart = request.getPart("img");
        if (filePart != null && filePart.getSize() > 0) {
            // Validar el tipo de archivo
            String fileName = filePart.getSubmittedFileName();
            String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
            if (!fileExtension.equals("jpg") && !fileExtension.equals("jpeg") && !fileExtension.equals("png")) {
                response.sendRedirect("MasNoticiasAdmin.jsp?error=Solo se permiten archivos JPG, JPEG y PNG");
                return;
            }

            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            filePath = UPLOAD_DIR + "/" + fileName;
        }

        // Crear el objeto MasNoticiasDTO
        MasNoticiasDTO noticia = new MasNoticiasDTO();
        noticia.setImg(filePath);
        noticia.setDescripcion(request.getParameter("descripcion"));
        noticia.setContenido(request.getParameter("contenido"));

        // Agregar a la base de datos
        noticiasController.agregarNoticia(noticia);

        // Redirigir con mensaje de éxito
        response.sendRedirect("MasNoticiasAdmin.jsp?success=Noticia agregada exitosamente");
    }

    private void editarNoticia(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Procesar la carga de la nueva imagen (opcional)
        String filePath = null;
        Part filePart = request.getPart("newImg");
        if (filePart != null && filePart.getSize() > 0) {
            // Validar tipo de archivo
            String fileName = filePart.getSubmittedFileName();
            String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
            if (!fileExtension.equals("jpg") && !fileExtension.equals("jpeg") && !fileExtension.equals("png")) {
                response.sendRedirect("MasNoticiasAdmin.jsp?error=Solo se permiten archivos JPG, JPEG y PNG");
                return;
            }

            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            filePath = UPLOAD_DIR + "/" + fileName;
        } else {
            // Si no se sube nueva imagen, mantener la imagen actual
            MasNoticiasDTO noticiaActual = noticiasController.buscarPorId(id);
            filePath = noticiaActual.getImg();
        }

        // Actualizar los datos de la noticia
        MasNoticiasDTO noticia = new MasNoticiasDTO();
        noticia.setId(id);
        noticia.setImg(filePath);
        noticia.setDescripcion(request.getParameter("descripcion"));
        noticia.setContenido(request.getParameter("contenido"));

        noticiasController.editarNoticia(noticia);

        // Redirigir con mensaje de éxito
        response.sendRedirect("MasNoticiasAdmin.jsp?success=Noticia actualizada exitosamente");
    }

    private void eliminarNoticia(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // Recibir el ID de la noticia a eliminar
            int id = Integer.parseInt(request.getParameter("id"));

            // Eliminar la noticia de la base de datos
            noticiasController.eliminarNoticia(id);

            // Redirigir con mensaje de éxito
            response.sendRedirect("MasNoticiasAdmin.jsp?success=Noticia eliminada exitosamente");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("MasNoticiasAdmin.jsp?error=Error al intentar eliminar la noticia");
        }
    }
}
