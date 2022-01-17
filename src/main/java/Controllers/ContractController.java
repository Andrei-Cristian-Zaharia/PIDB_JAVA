package Controllers;

import JavaBean.Actor;
import JavaBean.Contract;
import JavaBean.Movie;
import Repositories.ActorRepository;
import Repositories.ContractRepository;
import Repositories.MovieRepository;
import com.sun.istack.NotNull;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

public class ContractController extends HttpServlet {

    ContractRepository contractRepository = new ContractRepository();
    ActorRepository actorRepository = new ActorRepository();
    MovieRepository movieRepository = new MovieRepository();
    Contract contract = new Contract();

    @Override
    protected void doGet(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("returnContracts") != null) {
            List<Contract> contracts = contractRepository.getContracts();
            List<Actor> actors = actorRepository.getActors();
            List<Movie> movies = movieRepository.getMovies();
            request.setAttribute("contracts", contracts);
            request.setAttribute("actors", actors);
            request.setAttribute("movies", movies);
            RequestDispatcher dispatcher = request.getRequestDispatcher("contracts_page.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getParameter("deleteContract") != null){
            Long CONTRACT_ID = Long.parseLong(req.getParameter("selected_deleteContract"));
            contract = contractRepository.getContract(CONTRACT_ID);
            contractRepository.deleteContract(contract);
        }

        if (req.getParameter("addContract") != null) {
            String actors_ID[] = req.getParameterValues("createContractForThisActor");
            Long movieID = Long.parseLong(req.getParameter("createContractForThisMovie"));
            Movie movie = movieRepository.getMovie(movieID);

            Integer paycheck = Integer.parseInt(req.getParameter("paycheck"));
            LocalDate date = LocalDate.parse(req.getParameter("date"));
            String details = req.getParameter("details");

            for (String ID: actors_ID) {
                Long actorID = Long.parseLong(ID);
                Actor actor = actorRepository.getActor(actorID);
                contractRepository.addContract(new Contract(actor, movie, date, paycheck, details));
            }
        }

        if (req.getParameter("editContract") != null) {
            Contract contract = contractRepository.getContract(Long.valueOf(req.getParameter("selected_editContract")));

            Actor actor = actorRepository.getActor(Long.parseLong(req.getParameter("editContractForThisActor")));
            actor = (actor == null) ? contract.getACTOR() : actor;

            Movie movie = movieRepository.getMovie(Long.parseLong(req.getParameter("editContractForThisMovie")));
            movie = (movie == null) ? contract.getMOVIE() : movie;

            Integer paycheck = Integer.parseInt(req.getParameter("paycheckE"));
            paycheck = String.valueOf(paycheck).length() >= 1 ? paycheck : contract.getPAYCHECK();

            String date = req.getParameter("dateE");
            LocalDate localDate = LocalDate.parse(date);

            String details = req.getParameter("detailsE");
            details = !details.isEmpty() ? details : contract.getDETAILS();

            Contract updatedContract = new Contract(contract.getCONTRACT_ID(), actor, movie, localDate, paycheck, details);

            contractRepository.updateContract(updatedContract);
        }

        resp.sendRedirect("contracts_page?returnContracts=Contracts");
    }
}
