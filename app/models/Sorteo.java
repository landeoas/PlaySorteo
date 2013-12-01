package models;

import java.util.*;
import javax.persistence.*;
import play.data.format.*;
import play.data.validation.*;
import play.db.jpa.*;

@Entity
public class Sorteo {
    @Id
    public int codSorteo;
    @Constraints.Required
    public String nomSorteo;
    @Constraints.Required
    public String fechaIniRegParticipante;
    @Constraints.Required
    public String fechaFinRegParticipante;
        
    public String estadoSorteo;
    
    @Constraints.Required
    public String metodoSorteo;
    
    @Formats.DateTime(pattern="yyyy-MM-dd")
    public Date fechadeSorteo;
    
    public static Sorteo findById(int codSorteo) {
        return JPA.em().find(Sorteo.class, codSorteo);
    }
    
    public void update(int codSorteo) {
        this.codSorteo = codSorteo;
        JPA.em().merge(this);
    }
    
    public void save() {
        System.out.println("Grabando nuevo sorteo...");
        JPA.em().persist(this);
    }

    public void delete() {
        JPA.em().remove(this);
    }
}


