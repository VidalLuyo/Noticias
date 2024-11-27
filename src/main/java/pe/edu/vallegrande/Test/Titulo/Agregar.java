package pe.edu.vallegrande.Test.Titulo;

import pe.edu.vallegrande.controller.TituloController;
import pe.edu.vallegrande.model.TituloDTO;

public class Agregar {
    public static void main(String[] args) {
        TituloController tituloController = new TituloController();

        // Crear un nuevo objeto TituloDTO con los datos a agregar
        TituloDTO nuevoTitulo = new TituloDTO();
        nuevoTitulo.setTitulo("Juegos  Florales ");
        nuevoTitulo.setDescripcion("Promoviendo la creatividad y el talento artístico.");



        System.out.println("Prueba de agregar título realizada.");
    }
}
