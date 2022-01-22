package Repositories;

import Helpers.HibernateUtil;
import IRepositories.IActorRepository;
import JavaBean.Actor;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ActorRepository implements IActorRepository {

    @Override
    public Actor getActor(Long ID) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Actor actor = session.load(Actor.class, ID);
        session.close();
        return actor;
    }

    @Override
    public List<Actor> getActors() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Actor> actorList = session.createQuery("SELECT a FROM Actor a", Actor.class).getResultList();
        session.close();
        return actorList;
    }

    @Override
    public void addActor(Actor actor) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(actor);
        transaction.commit();
        session.close();
    }

    @Override
    public void deleteActor(Actor actor) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(actor);
        transaction.commit();
        session.close();
    }

    @Override
    public void updateActor(Actor actor) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(actor);
        transaction.commit();
        session.close();
    }
}
