package controllers;
import play.*;
import play.mvc.*;
import play.data.*;
import static play.data.Form.*;
import play.db.jpa.*;
import views.html.sorteos.*;
import models.*;

public class Sorteos extends Controller {
    public static Result blank() {
        return ok(sorteos.render());
    }
    
    @Transactional(readOnly=true)

    public static Result newSort() {
        Form<Sorteo> sorteoForm = form(Sorteo.class);
        return ok(createFormS.render(sorteoForm) );
    }

    public static Result list() {
        return ok(sorteos.render());
    }

    @Transactional
    public static Result save() {
        Form<Sorteo> sorteoForm = form(Sorteo.class).bindFromRequest();
        System.out.println("FORMULARIO de SORTEO: " + sorteoForm);

        if(sorteoForm.hasErrors()) {
            return badRequest(createFormS.render(sorteoForm));
        }

        sorteoForm.get().save();
        flash("success", "Sorteo " + sorteoForm.get().nomSorteo + " ha sido creado.");
        return ok(sorteos.render());
    }
}
