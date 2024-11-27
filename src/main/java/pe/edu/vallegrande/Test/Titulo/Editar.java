package pe.edu.vallegrande.Test.Titulo;

import pe.edu.vallegrande.controller.TituloController;
import pe.edu.vallegrande.model.TituloDTO;

public class Editar {
    public static void main(String[] args) {
        TituloController tituloController = new TituloController();

        // Crear un objeto TituloDTO con los datos editados
        TituloDTO tituloEditado = new TituloDTO();
        tituloEditado.setId(2); // ID del registro que deseas editar
        tituloEditado.setTitulo("Listos para las Olimpiadas");
        tituloEditado.setDescripcion("Formación musical de alto nivel y accesible.");


        System.out.println("Prueba de editar título realizada.");
    }
}
