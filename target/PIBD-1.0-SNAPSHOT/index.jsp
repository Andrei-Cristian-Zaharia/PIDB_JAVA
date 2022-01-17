<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="JavaBean.Actor" %>
<%@ page import="Repositories.ActorRepository" %>
<%@ page import="java.util.List" %>
<%@ page import="Repositories.MovieRepository" %>
<%@ page import="JavaBean.Movie" %>
<%@ page import="Repositories.ContractRepository" %>
<%@ page import="JavaBean.Contract" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.teal-blue.min.css" />
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>

<style>
    body {
        background: url("https://static.vecteezy.com/system/resources/previews/002/217/896/original/cinema-wallpaper-social-media-message-background-vector.jpg") center / cover;
    }

    a {
        padding: 1em 1.5em;
        text-decoration: none;
        text-transform: uppercase;
    }

    input[type=submit] {
        padding: 60px;
        font-size: 40px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        background-color: #448CFC;
        color: #ffffff;
        text-transform: uppercase;
        margin-top: 13px;
        transition: 0.3s;
    }

    input[type=submit]:hover {
        background-color: #04948C;
        padding: 80px;
        font-size: 55px;
    }

    .list-container {
        position: absolute;
        top: 35%;
        margin-left: 450px;
    }
</style>

<!doctype html>
<html lang="ro">

<head>
<title>Actors</title>
</head>

<body>

<%
    ActorRepository actorRepository = new ActorRepository();
    MovieRepository movieRepository = new MovieRepository();
    ContractRepository contractRepository = new ContractRepository();
    List<Actor> actors = actorRepository.getActors();
    List<Movie> movies = movieRepository.getMovies();
    List<Contract> contracts = contractRepository.getContracts();
    request.setAttribute("actors", actors);
    request.setAttribute("movies", movies);
    request.setAttribute("contracts", contracts);
%>

<h1 style="text-align: center; font-size: 70px; color: white;" >Home</h1>
<div class="list-container">
    <div style="display:inline-block">
        <form role="form" action="actors_page" method="GET">
            <input type="submit" class="btn btn-primary btn-lg m-2 fix-button" name="returnActors" value="Actors">
        </form>
    </div>
    <span></span>
    <div style="display:inline-block;">
        <form role="form" action="contracts_page" method="GET">
            <input type="submit" class="btn btn-primary btn-lg m-2 fix-button" name="returnContracts" value="Contracts">
        </form>
    </div>
    <span></span>
    <div style="display:inline-block;">
        <form role="form" action="movies_page" method="GET">
            <input type="submit" class="btn btn-primary btn-lg m-2 fix-button" name="returnMovies" value="Movies">
        </form>
    </div>
</div>

</body>

</html>