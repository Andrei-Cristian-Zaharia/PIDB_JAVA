package JavaBean;

import java.sql.Date;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

public class Movie {

    private Long MOVIE_ID;
    private String MOVIE_NAME;
    private String MOVIE_TYPE;
    private String PRODUCTION_COMPANY;
    private LocalDate RELEASE_DATE;
    private String LANGUAGE;
    private String COUNTRY_ORIGIN;
    private int RAITING;
    private String MOVIE_DIRECTOR;
    private Set<Contract> CONTRACTS;

    public Movie(Long MOVIE_ID, String MOVIE_NAME, String MOVIE_TYPE, String PRODUCTION_COMPANY, LocalDate RELEASE_DATE, String LANGUAGE, String COUNTRY_ORIGIN, int RAITING, String MOVIE_DIRECTOR, Set<Contract> CONTRACTS) {
        this.MOVIE_ID = MOVIE_ID;
        this.MOVIE_NAME = MOVIE_NAME;
        this.MOVIE_TYPE = MOVIE_TYPE;
        this.PRODUCTION_COMPANY = PRODUCTION_COMPANY;
        this.RELEASE_DATE = RELEASE_DATE;
        this.LANGUAGE = LANGUAGE;
        this.COUNTRY_ORIGIN = COUNTRY_ORIGIN;
        this.RAITING = RAITING;
        this.MOVIE_DIRECTOR = MOVIE_DIRECTOR;
        this.CONTRACTS = CONTRACTS;
    }

    public Movie(){
        MOVIE_NAME = "";
        MOVIE_TYPE = "";
        PRODUCTION_COMPANY = "";
        RELEASE_DATE = LocalDate.now();
        LANGUAGE = "";
        COUNTRY_ORIGIN = "";
        RAITING = 0;
        MOVIE_DIRECTOR = "";
        CONTRACTS = new HashSet<>();
    }

    public Movie(Long MOVIE_ID, String MOVIE_NAME, String MOVIE_TYPE, String PRODUCTION_COMPANY, LocalDate RELEASE_DATE, String LANGUAGE, String COUNTRY_ORIGIN, int RAITING, String MOVIE_DIRECTOR) {
        this.MOVIE_ID = MOVIE_ID;
        this.MOVIE_NAME = MOVIE_NAME;
        this.MOVIE_TYPE = MOVIE_TYPE;
        this.PRODUCTION_COMPANY = PRODUCTION_COMPANY;
        this.RELEASE_DATE = RELEASE_DATE;
        this.LANGUAGE = LANGUAGE;
        this.COUNTRY_ORIGIN = COUNTRY_ORIGIN;
        this.RAITING = RAITING;
        this.MOVIE_DIRECTOR = MOVIE_DIRECTOR;
    }

    public Long getMOVIE_ID() {
        return MOVIE_ID;
    }

    public void setMOVIE_ID(Long MOVIE_ID) {
        this.MOVIE_ID = MOVIE_ID;
    }

    public String getMOVIE_NAME() {
        return MOVIE_NAME;
    }

    public void setMOVIE_NAME(String MOVIE_NAME) {
        this.MOVIE_NAME = MOVIE_NAME;
    }

    public String getMOVIE_TYPE() {
        return MOVIE_TYPE;
    }

    public void setMOVIE_TYPE(String MOVIE_TYPE) {
        this.MOVIE_TYPE = MOVIE_TYPE;
    }

    public String getPRODUCTION_COMPANY() {
        return PRODUCTION_COMPANY;
    }

    public void setPRODUCTION_COMPANY(String PRODUCTION_COMPANY) {
        this.PRODUCTION_COMPANY = PRODUCTION_COMPANY;
    }

    public LocalDate getRELEASE_DATE() {
        return RELEASE_DATE;
    }

    public void setRELEASE_DATE(LocalDate RELEASE_DATE) {
        this.RELEASE_DATE = RELEASE_DATE;
    }

    public String getLANGUAGE() {
        return LANGUAGE;
    }

    public void setLANGUAGE(String LANGUAGE) {
        this.LANGUAGE = LANGUAGE;
    }

    public String getCOUNTRY_ORIGIN() {
        return COUNTRY_ORIGIN;
    }

    public void setCOUNTRY_ORIGIN(String COUNTRY_ORIGIN) {
        this.COUNTRY_ORIGIN = COUNTRY_ORIGIN;
    }

    public int getRAITING() {
        return RAITING;
    }

    public void setRAITING(int RAITING) {
        this.RAITING = RAITING;
    }

    public String getMOVIE_DIRECTOR() {
        return MOVIE_DIRECTOR;
    }

    public void setMOVIE_DIRECTOR(String MOVIE_DIRECTOR) {
        this.MOVIE_DIRECTOR = MOVIE_DIRECTOR;
    }

    public Set<Contract> getCONTRACTS() {
        return CONTRACTS;
    }

    public void setCONTRACTS(Set<Contract> CONTRACTS) {
        this.CONTRACTS = CONTRACTS;
    }
}
