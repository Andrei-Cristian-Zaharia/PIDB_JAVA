package IRepositories;

import JavaBean.Actor;

import java.util.List;

public interface IActorRepository {

    Actor getActor(Long ID);

    List<Actor> getActors();

    void addActor(Actor actor);

    void deleteActor(Actor actor);

    void updateActor(Actor actor);
}
