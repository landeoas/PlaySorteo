package controllers;
import play.*;
import play.mvc.*;
import views.html.participantes.*;

public class Participantes extends Controller{
    public static Result blank() {
        return ok(participantes.render());
    }
}
