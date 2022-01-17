package JavaBean;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

public class Contract {

    private Long CONTRACT_ID;
    private Actor ACTOR;
    private Movie MOVIE;
    private LocalDate DATE;
    private int PAYCHECK;
    private String DETAILS;

    public Contract(Long CONTRACT_ID, Actor ACTOR, Movie MOVIE, LocalDate DATE, int PAYCHECK, String DETAILS) {
        this.CONTRACT_ID = CONTRACT_ID;
        this.ACTOR = ACTOR;
        this.MOVIE = MOVIE;
        this.DATE = DATE;
        this.PAYCHECK = PAYCHECK;
        this.DETAILS = DETAILS;
    }

    public Contract(){

        DATE = LocalDate.now();
        PAYCHECK = 0;
        DETAILS = "";
    }

    public Contract(Actor ACTOR, Movie MOVIE, LocalDate DATE, int PAYCHECK, String DETAILS) {
        this.ACTOR = ACTOR;
        this.MOVIE = MOVIE;
        this.DATE = DATE;
        this.PAYCHECK = PAYCHECK;
        this.DETAILS = DETAILS;
    }

    public Long getCONTRACT_ID() {
        return CONTRACT_ID;
    }

    public void setCONTRACT_ID(Long CONTRACT_ID) {
        this.CONTRACT_ID = CONTRACT_ID;
    }

    public Actor getACTOR() {
        return ACTOR;
    }

    public void setACTOR(Actor ACTOR) {
        this.ACTOR = ACTOR;
    }

    public Movie getMOVIE() {
        return MOVIE;
    }

    public void setMOVIE(Movie MOVIE) {
        this.MOVIE = MOVIE;
    }

    public LocalDate getDATE() {
        return DATE;
    }

    public void setDATE(LocalDate DATE) {
        this.DATE = DATE;
    }

    public int getPAYCHECK() {
        return PAYCHECK;
    }

    public void setPAYCHECK(int PAYCHECK) {
        this.PAYCHECK = PAYCHECK;
    }

    public String getDETAILS() {
        return DETAILS;
    }

    public void setDETAILS(String DETAILS) {
        this.DETAILS = DETAILS;
    }
}
