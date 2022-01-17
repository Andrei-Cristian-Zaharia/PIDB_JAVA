package IRepositories;

import JavaBean.Movie;

import java.util.List;

public interface IMovieRepository {

    Movie getMovie(Long ID);

    List<Movie> getMovies();

    void addMovie(Movie movie);

    void updateMovie(Movie movie);

    void deleteMovie(Movie movie);
}
