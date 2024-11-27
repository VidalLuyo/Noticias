package pe.edu.vallegrande.Test.Titulo;

import pe.edu.vallegrande.controller.TituloController;
import pe.edu.vallegrande.model.TituloDTO;

import java.util.List;

public class Listar {
    public static void main(String[] args) {
        TituloController tituloController = new TituloController();

        // Llamar al método listarTodos() y obtener la lista de títulos
        List<TituloDTO> titulos = tituloController.listarTodos();

        // Imprimir cada título en la consola
        if (titulos.isEmpty()) {
            System.out.println("No hay títulos disponibles en la base de datos.");
        } else {
            for (TituloDTO titulo : titulos) {
                System.out.println("ID: " + titulo.getId());
                System.out.println("Titulo: " + titulo.getTitulo());
                System.out.println("Descripción: " + titulo.getDescripcion());
                System.out.println("-----------------------------------");
            }
        }
    }
}
