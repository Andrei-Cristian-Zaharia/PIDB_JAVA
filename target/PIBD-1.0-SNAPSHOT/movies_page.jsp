<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.teal-blue.min.css" />
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>

<style>
    body {
        overflow: hidden; /* Hide scrollbars */
    }

    h1 {
        text-align: center;
    }

    a {
        padding: 1em 1.5em;
        text-decoration: none;
        text-transform: uppercase;
    }

    input[type=submit] {
        background-color: transparent;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        color: white;
        text-transform: uppercase;
        margin-top: 13px;
    }

    input[type=submit]:hover {
        background-color: transparent;
    }

    input {
        border: none;
        display: inline;
        font-family: inherit;
        font-size: inherit;
        padding: 0;
        width: auto;
    }

    form {
        float: right;
    }

    .list-container {
        border: 2px dotted black;
        padding: 0px;
        width: 730px;
        margin: 0 auto;
    }

    .list-control {
        width: 800px;
    }

    .edit-profile-button {
        margin-left: 10px;
        margin-right: 10px;
    }

    .view-profile-button {
        margin-left: 10px;
        margin-right: 10px;
    }

    .person-container {
        float: left;
        width: 250px;
    }

    .buttons-container {
        width: 430px;
    }

    .add-actor-button {
        position: fixed;
        right: 30px;
        bottom: 30px;
    }

    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0, 0, 0); /* Fallback color */
        background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
    }

    /* Modal Content */
    .modal-content {
        overflow: auto;
        background-color: #fefefe;
        margin: auto;
        width: 40%;
    }

    /* The Close Button */
    .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

    .center {
        margin: auto;
        width: 0%;
        padding: 10px;
    }

    .info-text-a {
        padding-bottom: 10px;
        padding-left: 20px;
        padding-top: 10px;
        text-decoration: none;
        text-transform: uppercase;
        font-weight: bold;
    }

    .info-text-p {
        padding-left: 20px;
    }

    .demo-card-wide.mdl-card {
        width: 700px;
    }

    .demo-card-wide > .mdl-card__title {
        color: #fff;
        height: 176px;
        background: url("https://media.istockphoto.com/photos/concept-of-reserved-seats-picture-id915697084?b=1&k=20&m=915697084&s=170667a&w=0&h=lEHLEtcjZKjDcW2k1Wtgo1hW7siaGkXXmsRkIqhMLQU=") center / cover;
    }

    .demo-card-wide > .mdl-card__menu {
        color: #fff;
    }
</style>

<!doctype html>
<html lang="ro">

<head>
    <title>Movies</title>
</head>

<body>

<div class="mdl-layout mdl-js-layout">
    <header class="mdl-layout__header mdl-layout__header--scroll">
        <div class="mdl-layout__header-row">
            <a class="mdl-layout-title" href="index.jsp" style="color: white;"><h3>Home</h3></a>
            <div class="mdl-layout-spacer"></div>
            <nav class="mdl-navigation">
                <form role="form" action="actors_page" method="GET">
                    <input type="submit" class="btn btn-primary btn-lg m-2 fix-button" name="returnActors" value="Actors">
                </form>

                <form role="form" action="contracts_page" method="GET">
                    <input type="submit" class="btn btn-primary btn-lg m-2 fix-button" name="returnContracts" value="Contracts">
                </form>

                <form role="form" action="movies_page" method="GET">
                    <input type="submit" class="btn btn-primary btn-lg m-2 fix-button" name="returnMovies" value="Movies">
                </form>
            </nav>
        </div>
    </header>
    <main class="mdl-layout__content">
        <!-- END NAVBAR -->

        <!-- EDIT ACTOR DIALOG -->
        <!-- The Modal -->
        <div id="myModalE" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span id="closeE" class="close" style="padding-right: 10px; padding-top: 10px">&times;</span>
                <form autocomplete="on" action="movies_page" method="POST" style="margin-right: 60px;">
                    <h1>Edit movie</h1>
                    <select style="display: none" type="none" class="form-control" name="selected_editMovie"
                            id="selected_editActor">
                        <option id="setEditId" value=" "></option>
                    </select>
                    <div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                             style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="text" id="Ename" name="Ename" value=" ">
                            <label class="mdl-textfield__label" for="Ename">Name</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                             style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="text" id="Etype" name="Etype" value=" ">
                            <label class="mdl-textfield__label" for="Etype">Type</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                             style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="text" id="Eproduction" name="Eproduction" value=" ">
                            <label class="mdl-textfield__label" for="Eproduction">Production company</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield" style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="date" id="Erelease" name="Erelease">
                            <label class="mdl-textfield__label" for="Erelease"></label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                             style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="text" id="Elanguage" name="Elanguage" value=" ">
                            <label class="mdl-textfield__label" for="Elanguage">Language</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                             style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="text" id="Ecountry" name="Ecountry" value=" ">
                            <label class="mdl-textfield__label" for="Ecountry">Country Origin</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield" style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="text" pattern="[0-9]*" id="Eraiting" name="Eraiting"
                                   value="0">
                            <label class="mdl-textfield__label" for="Eraiting">Raiting</label>
                            <span class="mdl-textfield__error">Digits only</span>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                             style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="text" id="Edirector" name="Edirector" value=" ">
                            <label class="mdl-textfield__label" for="Edirector">Director</label>
                        </div>
                    </div>
                    <div class="center">
                        <button name="editMovie"
                                class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect edit-profile-button">
                            Edit
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <!-- END EDIT MOVIE DIALOG -->

        <div style="padding-bottom: 20px">
            <div>
                <h1>List of Movies</h1>
            </div>
            <div class="list-container">
                <!-- List with avatar and controls -->
                <ul class="list-control mdl-list">
                    <%--@elvariable id="movies" type="java.util.List"--%>
                    <c:forEach var="MOVIE" items="${movies}">
                        <li class="mdl-list__item">
    <span class="mdl-list__item-primary-content">
      <i class="material-icons" style="font-size: 50px; padding-right: 20px">movie</i>
        <div class="person-container">
            ${MOVIE.MOVIE_NAME}
        </div>
        <div class="buttons-container">

            <i><b>${MOVIE.RAITING} / 10</b></i>

            <button style="margin-left: 30px" id="myBtnE${MOVIE.MOVIE_ID}"
                    class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect edit-profile-button">Edit Movie</button>
            <script>
            var modalE = document.getElementById("myModalE");

            var btnE${MOVIE.MOVIE_ID} = document.getElementById("myBtnE${MOVIE.MOVIE_ID}");

            var spanE${MOVIE.MOVIE_ID} = document.getElementById("closeE");

            btnE${MOVIE.MOVIE_ID}.onclick = function () {
                modalE.style.display = "block";

                var nameEdit = document.getElementById("Ename");
                var typeEdit = document.getElementById("Etype");
                var productionEdit = document.getElementById("Eproduction");
                var releaseEdit = document.getElementById("Erelease");
                var languageEdit = document.getElementById("Elanguage");
                var countryEdit = document.getElementById("Ecountry");
                var raitingEdit = document.getElementById("Eraiting");
                var directorEdit = document.getElementById("Edirector");
                var ID = document.getElementById("setEditId");

                nameEdit.value = "${MOVIE.MOVIE_NAME}";
                typeEdit.value = "${MOVIE.MOVIE_TYPE}";
                productionEdit.value = "${MOVIE.PRODUCTION_COMPANY}";
                releaseEdit.value = "${MOVIE.RELEASE_DATE}";
                languageEdit.value = "${MOVIE.LANGUAGE}";
                countryEdit.value = "${MOVIE.COUNTRY_ORIGIN}";
                raitingEdit.value = "${MOVIE.RAITING}";
                directorEdit.value = "${MOVIE.MOVIE_DIRECTOR}";

                ID.value = "${MOVIE.MOVIE_ID}";
            }

            spanE${MOVIE.MOVIE_ID}.onclick = function () {
                modalE.style.display = "none";
            }
        </script>
            <button id="myBtnV${MOVIE.MOVIE_ID}"
                    class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect">Details</button>
            <form role="form" action="movies_page" method="POST" style="margin-right: 60px;">
                <select style="display: none" type="none" class="form-control" name="selected_deleteMovie" id="selected_deleteMovie">
                    <option value="${MOVIE.MOVIE_ID}"></option>
                </select>
                <button type="submit" name="deleteMovie"
                        class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored"><i class="material-icons">delete</i></button>
            </form>

            <!-- The Modal -->
        <div id="myModal${MOVIE.MOVIE_ID}" class="modal">
                        <!-- Modal content -->

            <div class="demo-card-wide mdl-card mdl-shadow--2dp modal-content">
            <div class="mdl-card__title">
            </div>
            <div class="mdl-card__supporting-text">
                    <p class="info-text-a">Name: ${MOVIE.MOVIE_NAME}</p
                    <p class="info-text-p"></p>
                    <p class="info-text-a">Movie details:</p>
                    <p class="info-text-p"> Type: ${MOVIE.MOVIE_TYPE} </p>
                    <p class="info-text-p"> Production company: ${MOVIE.PRODUCTION_COMPANY} </p>
                    <p class="info-text-p"> Release date: ${MOVIE.RELEASE_DATE.format(DateTimeFormatter.ofPattern("dd.MM.yyyy"))} </p>
                    <p class="info-text-p"> Language: ${MOVIE.LANGUAGE} </p>
                    <p class="info-text-p"> Country origin: ${MOVIE.COUNTRY_ORIGIN} </p>
                    <p class="info-text-p"> Current raiting: ${MOVIE.RAITING} </p>
                    <p class="info-text-p"> Director: ${MOVIE.MOVIE_DIRECTOR} </p>
            </div>
            <div class="mdl-card__actions mdl-card--border">
                <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" id="close${MOVIE.MOVIE_ID}">
                    Close
                </a>
            </div>
            </div>
        </div>

        <script>
            var modal${MOVIE.MOVIE_ID} = document.getElementById("myModal${MOVIE.MOVIE_ID}");

            var btn${MOVIE.MOVIE_ID} = document.getElementById("myBtnV${MOVIE.MOVIE_ID}");

            var span${MOVIE.MOVIE_ID} = document.getElementById("close${MOVIE.MOVIE_ID}");

            btn${MOVIE.MOVIE_ID}.onclick = function () {
                modal${MOVIE.MOVIE_ID}.style.display = "block";
            }

            span${MOVIE.MOVIE_ID}.onclick = function () {
                modal${MOVIE.MOVIE_ID}.style.display = "none";
            }
        </script>
        </div>
    </span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <!-- ADD NEW MOVIE -->
        <div class="add-actor-button">
            <button id="myBtn"
                    class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-mini-footer__right-section">
                <i class="material-icons">add</i>
            </button>
            <!-- The Modal -->
            <div id="myModal" class="modal">

                <!-- Modal content -->
                <div class="modal-content">
                    <span id="close" class="close" style="padding-top: 10px; padding-right: 10px">&times;</span>
                    <form autocomplete="on" action="movies_page" method="POST" style="margin-right: 60px;">
                        <h1>Add a new movie</h1>
                        <div>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                                 style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="text" id="name" name="name">
                                <label class="mdl-textfield__label" for="name">Name</label>
                            </div>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                                 style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="text" id="type" name="type">
                                <label class="mdl-textfield__label" for="type">Type</label>
                            </div>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                                 style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="text" id="production" name="production">
                                <label class="mdl-textfield__label" for="production">Production company</label>
                            </div>
                            <div class="mdl-textfield mdl-js-textfield" style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="date" id="release" name="release">
                                <label class="mdl-textfield__label" for="release"></label>
                            </div>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                                 style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="text" id="language" name="language">
                                <label class="mdl-textfield__label" for="language">Language</label>
                            </div>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                                 style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="text" id="country" name="country">
                                <label class="mdl-textfield__label" for="country">Country Origin</label>
                            </div>
                            <div class="mdl-textfield mdl-js-textfield" style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="text" pattern="[0-9]*" id="raiting" name="raiting">
                                <label class="mdl-textfield__label" for="raiting">Raiting</label>
                                <span class="mdl-textfield__error">Digits only</span>
                            </div>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                                 style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="text" id="director" name="director">
                                <label class="mdl-textfield__label" for="director">Director</label>
                            </div>
                        </div>
                        <div class="center">
                            <button name="addMovie"
                                    class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect edit-profile-button">
                                Add
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <script>
                var modal = document.getElementById("myModal");

                var btn = document.getElementById("myBtn");

                var span = document.getElementById("close");

                btn.onclick = function () {
                    modal.style.display = "block";
                }

                span.onclick = function () {
                    modal.style.display = "none";
                }
            </script>
        </div>
        <!-- END ADD NEW MOVIE -->

    </main>
</div>
</body>

</html>