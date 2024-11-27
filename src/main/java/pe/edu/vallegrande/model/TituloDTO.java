package pe.edu.vallegrande.model;

import lombok.Data;

@Data
public class TituloDTO {
    private int id;
    private String titulo;
    private String descripcion;
    private String Img; // Nuevo campo para la URL de la imagen
}
