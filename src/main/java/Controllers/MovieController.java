package Controllers;

import JavaBean.Actor;
import JavaBean.Movie;
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
import java.util.Objects;

public class MovieController extends HttpServlet {

    MovieRepository movieRepository = new MovieRepository();
    Movie movie = new Movie();

    @Override
    protected void doGet(@NotNull HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("returnMovies") != null) {
            List<Movie> movies = movieRepository.getMovies();
            request.setAttribute("movies", movies);
            RequestDispatcher dispatcher = request.getRequestDispatcher("movies_page.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getParameter("deleteMovie") != null){
            Long MOVIE_ID = Long.parseLong(req.getParameter("selected_deleteMovie"));
            movie.setMOVIE_ID(MOVIE_ID);
            movieRepository.deleteMovie(movie);
        }

        if (req.getParameter("addMovie") != null) {

            Movie movie = new Movie();

            movie.setMOVIE_NAME(req.getParameter("name"));
            movie.setMOVIE_TYPE(req.getParameter("type"));
            movie.setPRODUCTION_COMPANY(req.getParameter("production"));
            movie.setRELEASE_DATE(LocalDate.parse(req.getParameter("release")));
            movie.setLANGUAGE(req.getParameter("language"));
            movie.setCOUNTRY_ORIGIN(req.getParameter("country"));
            movie.setRAITING(Integer.parseInt(req.getParameter("raiting")));
            movie.setMOVIE_DIRECTOR(req.getParameter("director"));

            movieRepository.addMovie(movie);
        }

        if (req.getParameter("editMovie") != null) {

            String aux = req.getParameter("selected_editMovie");

            Movie movie = movieRepository.getMovie(Long.valueOf(req.getParameter("selected_editMovie")));

            String name = req.getParameter("Ename");
            name = !name.isEmpty() ? name : movie.getMOVIE_NAME();

            String type = req.getParameter("Etype");
            type = !type.isEmpty() ? type : movie.getMOVIE_TYPE();

            String production = req.getParameter("Eproduction");
            production = !production.isEmpty() ? production : movie.getPRODUCTION_COMPANY();

            String date = req.getParameter("Erelease");
            LocalDate release = !date.isEmpty() ? LocalDate.parse(date) : movie.getRELEASE_DATE();

            String language = req.getParameter("Elanguage");
            language = !language.isEmpty() ? language : movie.getLANGUAGE();

            String country = req.getParameter("Ecountry");
            country = !country.isEmpty() ? country : movie.getCOUNTRY_ORIGIN();

            String rate = req.getParameter("Eraiting");
            Integer raiting = Integer.parseInt(rate);
            raiting = (String.valueOf(raiting).length() == 1 || String.valueOf(raiting).length() == 2) ? raiting : movie.getRAITING();

            String director = req.getParameter("Edirector");
            director = !director.isEmpty() ? director : movie.getMOVIE_DIRECTOR();

                Movie updatedMovie = new Movie(movie.getMOVIE_ID(), name, type, production, release, language, country, raiting, director);

            movieRepository.updateMovie(updatedMovie);
        }

        resp.sendRedirect("movies_page?returnMovies=Movies");
    }
}
