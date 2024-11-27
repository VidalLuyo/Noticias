package pe.edu.vallegrande.servlet;

import pe.edu.vallegrande.controller.AlbumController;
import pe.edu.vallegrande.model.AlbumDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet("/AlbumServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5,    // 5 MB
        maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
public class AlbumServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads"; // Carpeta donde se guardarán las imágenes
    private final AlbumController albumController = new AlbumController();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "add":
                    agregarAlbum(request, response);
                    break;
                case "edit":
                    editarAlbum(request, response);
                    break;
                case "delete":
                    eliminarAlbum(request, response);
                    break;
                default:
                    response.sendRedirect("AlbumAdmin.jsp?error=Acción no válida");
            }
        } else {
            response.sendRedirect("AlbumAdmin.jsp?error=No se especificó una acción");
        }
    }

    private void agregarAlbum(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Procesar la carga de la imagen
        String filePath = null;
        Part filePart = request.getPart("img");
        if (filePart != null && filePart.getSize() > 0) {
            // Validar el tipo de archivo
            String fileName = filePart.getSubmittedFileName();
            String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
            if (!fileExtension.equals("jpg") && !fileExtension.equals("jpeg") && !fileExtension.equals("png")) {
                response.sendRedirect("AlbumAdmin.jsp?error=Solo se permiten archivos JPG, JPEG y PNG");
                return;
            }

            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            filePath = UPLOAD_DIR + "/" + fileName;
        }

        // Crear el objeto AlbumDTO
        AlbumDTO album = new AlbumDTO();
        album.setImg(filePath);

        // Agregar a la base de datos
        albumController.agregarImagen(album);

        // Redirigir con mensaje de éxito
        response.sendRedirect("AlbumAdmin.jsp?success=Álbum agregado exitosamente");
    }

    private void editarAlbum(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Procesar la carga de la nueva imagen (opcional)
        String filePath = null;
        Part filePart = request.getPart("newImg");
        if (filePart != null && filePart.getSize() > 0) {
            // Validar tipo de archivo
            String fileName = filePart.getSubmittedFileName();
            String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
            if (!fileExtension.equals("jpg") && !fileExtension.equals("jpeg") && !fileExtension.equals("png")) {
                response.sendRedirect("AlbumAdmin.jsp?error=Solo se permiten archivos JPG, JPEG y PNG");
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
            AlbumDTO albumActual = albumController.buscarPorId(id);
            filePath = albumActual.getImg();
        }

        // Actualizar los datos del álbum
        AlbumDTO album = new AlbumDTO();
        album.setId(id);
        album.setImg(filePath);

        albumController.editarImagen(album);

        // Redirigir con mensaje de éxito
        response.sendRedirect("AlbumAdmin.jsp?success=Álbum actualizado exitosamente");
    }

    private void eliminarAlbum(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // Recibir el ID del álbum a eliminar
            int id = Integer.parseInt(request.getParameter("id"));

            // Eliminar el álbum de la base de datos
            albumController.eliminarImagen(id);

            // Redirigir con mensaje de éxito
            response.sendRedirect("AlbumAdmin.jsp?success=Álbum eliminado exitosamente");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AlbumAdmin.jsp?error=Error al intentar eliminar el álbum");
        }
    }
}
