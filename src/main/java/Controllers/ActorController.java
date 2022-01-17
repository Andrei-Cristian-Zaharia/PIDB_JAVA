package Controllers;

import JavaBean.Actor;
import Repositories.ActorRepository;
import com.sun.istack.NotNull;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

public class ActorController extends HttpServlet {

    ActorRepository actorRepository = new ActorRepository();
    Actor actor = new Actor();

    @Override
    protected void doGet(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("returnActors") != null) {
            List<Actor> actors = actorRepository.getActors();
            request.setAttribute("actors", actors);
            RequestDispatcher dispatcher = request.getRequestDispatcher("actors_page.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getParameter("deleteActor") != null){
            Long ACTOR_ID = Long.parseLong(req.getParameter("selected_deleteActor"));
            actor.setACTOR_ID(ACTOR_ID);
            actorRepository.deleteActor(actor);
        }

        if (req.getParameter("addActor") != null) {

            Actor actor = new Actor();

            actor.setLASTNAME(req.getParameter("lastname"));
            actor.setFIRSTNAME(req.getParameter("firstname"));
            actor.setEMAIL_ADDRESS(req.getParameter("emailaddress"));
            actor.setPHONE_NUMBER(Integer.parseInt(req.getParameter("phone")));
            actor.setBIRTHDATE(LocalDate.parse(req.getParameter("birthdate")));
            actor.setNATIONALITY(req.getParameter("nationality"));
            actor.setPREFERED_ROLE(req.getParameter("prefered_role"));
            actor.setOCCUPIED(!Objects.equals(req.getParameter("checkbox"), "yes"));

            if (actor.getPREFERED_ROLE().isEmpty()) actor.setPREFERED_ROLE("Doesn't have any.");

            actorRepository.addActor(actor);
        }

        if (req.getParameter("editActor") != null) {
            Actor actor = actorRepository.getActor(Long.valueOf(req.getParameter("selected_editActor")));

            String lastname = req.getParameter("Elastname");
            lastname = !lastname.isEmpty() ? lastname : actor.getLASTNAME();

            String firstname = req.getParameter("Efirstname");
            firstname = !firstname.isEmpty() ? firstname : actor.getFIRSTNAME();

            String emailAddress = req.getParameter("Eemailaddress");
            emailAddress = !emailAddress.isEmpty() ? emailAddress : actor.getEMAIL_ADDRESS();

            String phone = req.getParameter("Ephone");
            Integer phone_number = Integer.parseInt(phone.substring(1));
            phone_number = String.valueOf(phone_number).length() == 9 ? phone_number : actor.getPHONE_NUMBER();

            String date = req.getParameter("Ebirthdate");
            LocalDate birthdate = LocalDate.parse(date);

            String nationality = req.getParameter("Enationality");
            nationality = !nationality.isEmpty() ? nationality : actor.getNATIONALITY();

            String prefered_role = req.getParameter("Eprefered_role");
            prefered_role = !prefered_role.isEmpty() ? prefered_role : actor.getPREFERED_ROLE();

            String checkbox = req.getParameter("Echeckbox");

            Boolean occupied = false;

            if (Objects.equals(checkbox, "yes")) occupied = true;

            Actor updatedActor = new Actor(actor.getACTOR_ID(), lastname, firstname, emailAddress, phone_number, birthdate, nationality, prefered_role, occupied);

            actorRepository.updateActor(updatedActor);
        }

        resp.sendRedirect("actors_page?returnActors=Actors");
    }
}
