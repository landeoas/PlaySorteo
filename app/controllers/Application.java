package controllers;

import play.*;
import play.mvc.*;
import views.html.*;
import play.db.jpa.*;
import models.*;

public class Application extends Controller {

    public static Result index() {
        return ok(index.render());
    }
    /*
    public static Result sorteo() {
    	return ok(sorteo.render("Sorteo!!!"));
    }
    
    public static Result inscripcion() {
    	return ok(inscripcion.render("Inscripcion!!!"));
    }
    
    public static Result seguridad() {
    	return ok(seguridad.render("Seguridad!!!"));
    }
    */
}
