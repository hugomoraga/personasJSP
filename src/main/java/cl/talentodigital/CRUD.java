package cl.talentodigital;

import java.util.List;

public interface CRUD {
	public List listar();
	public String agregarPersona(Persona persona);
	public String actualizarPersona(Persona persona);
	public String eliminarPersona(int id);
	public Persona obtenerPersona(int id);

}
