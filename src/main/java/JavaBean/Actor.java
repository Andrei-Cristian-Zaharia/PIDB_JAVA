package JavaBean;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

public class Actor implements Serializable {

    private Long ACTOR_ID;
    private String LASTNAME;
    private String FIRSTNAME;
    private String EMAIL_ADDRESS;
    private int PHONE_NUMBER;
    private LocalDate BIRTHDATE;
    private String NATIONALITY;
    private String PREFERED_ROLE;
    private Boolean OCCUPIED;
    private Set<Contract> CONTRACTS;

    public Actor(Long ACTOR_ID, String LASTNAME, String FIRSTNAME, String EMAIL_ADDRESS, int PHONE_NUMBER, LocalDate BIRTHDATE, String NATIONALITY, String PREFERED_ROLE, Boolean OCCUPIED, Set<Contract> CONTRACTS) {
        this.ACTOR_ID = ACTOR_ID;
        this.LASTNAME = LASTNAME;
        this.FIRSTNAME = FIRSTNAME;
        this.EMAIL_ADDRESS = EMAIL_ADDRESS;
        this.PHONE_NUMBER = PHONE_NUMBER;
        this.BIRTHDATE = BIRTHDATE;
        this.NATIONALITY = NATIONALITY;
        this.PREFERED_ROLE = PREFERED_ROLE;
        this.OCCUPIED = OCCUPIED;
        this.CONTRACTS = CONTRACTS;
    }

    public Actor(Long ACTOR_ID, String LASTNAME, String FIRSTNAME, String EMAIL_ADDRESS, int PHONE_NUMBER, LocalDate BIRTHDATE, String NATIONALITY, String PREFERED_ROLE, Boolean OCCUPIED) {
        this.ACTOR_ID = ACTOR_ID;
        this.LASTNAME = LASTNAME;
        this.FIRSTNAME = FIRSTNAME;
        this.EMAIL_ADDRESS = EMAIL_ADDRESS;
        this.PHONE_NUMBER = PHONE_NUMBER;
        this.BIRTHDATE = BIRTHDATE;
        this.NATIONALITY = NATIONALITY;
        this.PREFERED_ROLE = PREFERED_ROLE;
        this.OCCUPIED = OCCUPIED;
    }

    public Actor() {
        ACTOR_ID = 0L;
        LASTNAME = "";
        FIRSTNAME = "";
        EMAIL_ADDRESS = "";
        PHONE_NUMBER = 0;
        BIRTHDATE = LocalDate.now();
        NATIONALITY = "";
        PREFERED_ROLE = "";
        OCCUPIED = false;
        CONTRACTS = new HashSet<>();
    }

    public Long getACTOR_ID() {
        return ACTOR_ID;
    }

    public void setACTOR_ID(Long ACTOR_ID) {
        this.ACTOR_ID = ACTOR_ID;
    }

    public String getLASTNAME() {
        return LASTNAME;
    }

    public void setLASTNAME(String LASTNAME) {
        this.LASTNAME = LASTNAME;
    }

    public String getFIRSTNAME() {
        return FIRSTNAME;
    }

    public void setFIRSTNAME(String FIRSTNAME) {
        this.FIRSTNAME = FIRSTNAME;
    }

    public String getEMAIL_ADDRESS() {
        return EMAIL_ADDRESS;
    }

    public void setEMAIL_ADDRESS(String EMAIL_ADDRESS) {
        this.EMAIL_ADDRESS = EMAIL_ADDRESS;
    }

    public int getPHONE_NUMBER() {
        return PHONE_NUMBER;
    }

    public void setPHONE_NUMBER(int PHONE_NUMBER) {
        this.PHONE_NUMBER = PHONE_NUMBER;
    }

    public LocalDate getBIRTHDATE() {
        return BIRTHDATE;
    }

    public void setBIRTHDATE(LocalDate BIRTHDATE) {
        this.BIRTHDATE = BIRTHDATE;
    }

    public String getNATIONALITY() {
        return NATIONALITY;
    }

    public void setNATIONALITY(String NATIONALITY) {
        this.NATIONALITY = NATIONALITY;
    }

    public String getPREFERED_ROLE() {
        return PREFERED_ROLE;
    }

    public void setPREFERED_ROLE(String PREFERED_ROLE) {
        this.PREFERED_ROLE = PREFERED_ROLE;
    }

    public Boolean getOCCUPIED() {
        return OCCUPIED;
    }

    public void setOCCUPIED(Boolean OCCUPIED) {
        this.OCCUPIED = OCCUPIED;
    }

    public Set<Contract> getCONTRACTS() {
        return CONTRACTS;
    }

    public void setCONTRACTS(Set<Contract> CONTRACTS) {
        this.CONTRACTS = CONTRACTS;
    }
}