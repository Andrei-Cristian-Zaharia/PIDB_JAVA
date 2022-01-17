package Repositories;

import Helpers.HibernateUtil;
import IRepositories.IMovieRepository;
import JavaBean.Actor;
import JavaBean.Movie;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class MovieRepository implements IMovieRepository {

    @Override
    public Movie getMovie(Long ID) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Movie movie = session.load(Movie.class, ID);
        session.close();
        return movie;
    }

    @Override
    public List<Movie> getMovies() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Movie> movieList = session.createQuery("SELECT a FROM Movie a", Movie.class).getResultList();
        session.close();
        return movieList;
    }

    @Override
    public void addMovie(Movie movie) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(movie);
        transaction.commit();
        session.close();
    }

    @Override
    public void updateMovie(Movie movie) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(movie);
        transaction.commit();
        session.close();
    }

    @Override
    public void deleteMovie(Movie movie) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(movie);
        transaction.commit();
        session.close();
    }
}
