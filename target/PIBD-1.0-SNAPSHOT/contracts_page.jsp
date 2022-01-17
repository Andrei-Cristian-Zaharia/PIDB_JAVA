<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.teal-blue.min.css"/>
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

    .list-container {
        border: 2px dotted black;
        padding: 0px;
        width: 1050px;
        margin: 0 auto;
    }

    .list-control {
        width: 1050px;
    }

    .drop-parent {
        color: black;
        display: flex;
        font-family: sans-serif;
        font-weight: bold;
    }

    .example-draggable {
        border-radius: 5px;
        background-color: #ffffff;
        font-weight: normal;
        width: auto;
        margin-bottom: 10px;
        margin-top: 10px;
        padding: 5px;
    }

    .dropzone {
        border-radius: 20px;
        background-color: #448cfc;
        flex-basis: 100%;
        flex-grow: 1;
        padding: 10px;
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
        width: 80%;
        max-height: 860px;
        min-height: 100px;
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

    .add-contract-button {
        position: fixed;
        right: 30px;
        bottom: 30px;
    }

    .float-container {
        justify-content: center;
    }

    .float-child {
        width: 42%;
        float: left;
        padding: 10px;
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
        margin-left: 15px;
        width: 550px;
    }

    .buttons-container {
        width: 430px;
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
        background: url("https://1cliquesystems.com/wp-content/uploads/2018/07/iStock-502351625-1199x800.jpg") center / cover;
    }

    .demo-card-wide > .mdl-card__menu {
        color: #fff;
    }
</style>

<script>
    var currentActor;
    var currentMovie;

    function onDragStart(event) {
        event
            .dataTransfer
            .setData('text/plain', event.target.id);
    }

    function onDragOver(event) {
        event.preventDefault();
    }

    function onDrop(event) {
        const id = event
            .dataTransfer
            .getData('text');

        const draggableElement = document.getElementById(id);
        var countChilds = event.target.childElementCount;
        const dropzone = event.target;

        if (draggableElement.id.includes("Actor")) element = "Actor";
        if (draggableElement.id.includes("Movie")) element = "Movie";

        if (element === "Actor") {
            if (dropzone.id.substring(1) === "dropzoneActor") {
                if (dropzone.id === "2dropzoneActor") {
                    draggableElement.firstElementChild.setAttribute("name", "createContractForThisActor");
                    draggableElement.firstElementChild.setAttribute("value", draggableElement.id.substring(9));
                }

                if (dropzone.id === "1dropzoneActor" || dropzone.id === "1dropzoneActorE")
                    draggableElement.firstElementChild.setAttribute("name", "");

                dropzone.appendChild(draggableElement);

                return;
            }

            if (dropzone.id.substring(1) === "dropzoneActorE") {

                if (dropzone.id === "2dropzoneActorE") {
                    draggableElement.firstElementChild.setAttribute("name", "editContractForThisActor");
                    draggableElement.firstElementChild.setAttribute("value", draggableElement.id.substring(10));
                }

                if (countChilds === 1 && dropzone.id === "2dropzoneActorE") {
                    let containerDropzone = document.getElementById("1dropzoneActorE");

                    containerDropzone.appendChild(currentActor);
                    currentActor.firstElementChild.setAttribute("name", "");
                    currentActor = draggableElement;
                }

                if (countChilds === 0) currentActor = draggableElement;

                dropzone.appendChild(draggableElement);

                return;
            }
        }

        if (element === "Movie") {
            if (dropzone.id.substring(1) === "dropzoneMovie" || dropzone.id.substring(1) === "dropzoneMovieE") {
                if (dropzone.id === "2dropzoneMovie") {
                    draggableElement.firstElementChild.setAttribute("name", "createContractForThisMovie");
                    draggableElement.firstElementChild.setAttribute("value", draggableElement.id.substring(9));
                }

                if (dropzone.id === "2dropzoneMovieE") {
                    draggableElement.firstElementChild.setAttribute("name", "editContractForThisMovie");
                    draggableElement.firstElementChild.setAttribute("value", draggableElement.id.substring(10));
                }

                if (dropzone.id === "1dropzoneMovie" || dropzone.id === "1dropzoneMovieE")
                    draggableElement.firstElementChild.setAttribute("name", "");

                if (countChilds === 1 && (dropzone.id === "2dropzoneMovie" || dropzone.id === "2dropzoneMovieE")) {
                    let containerDropzone;

                    if (dropzone.id === "2dropzoneMovie")
                    containerDropzone = document.getElementById("1dropzoneMovie");
                    else containerDropzone = document.getElementById("1dropzoneMovieE");

                    containerDropzone.appendChild(currentMovie);
                    currentMovie.firstElementChild.setAttribute("name", "");
                    currentMovie = draggableElement;
                }

                if (countChilds === 0) currentMovie = draggableElement;

                dropzone.appendChild(draggableElement);

                return;
            }
        }

        var dropzoneId;

        if (dropzone.id.includes("Actor")) dropzoneId = "Actor";
        if (dropzone.id.includes("Movie")) dropzoneId = "Movie";

        if (dropzoneId === element) {
            let parent = dropzone.parentElement;

            if (parent.id === "1dropzoneActor" || parent.id === "1dropzoneActorE") {
                draggableElement.firstElementChild.setAttribute("name", "");

                parent.appendChild(draggableElement);
                return;
            }

            if (parent.id === "2dropzoneActor") {
                draggableElement.firstElementChild.setAttribute("name", "createContractForThisActor");
                draggableElement.firstElementChild.setAttribute("value", draggableElement.id.substring(9));
                parent.appendChild(draggableElement);
                return;
            }

            if (parent.id === "2dropzoneActorE") {
                countChilds = parent.childElementCount;

                if (countChilds === 1) {
                    let containerDropzone;

                    containerDropzone = document.getElementById("1dropzoneActorE");

                    containerDropzone.appendChild(currentActor);
                    currentActor.firstElementChild.setAttribute("name", "");
                    draggableElement.firstElementChild.setAttribute("name", "editContractForThisActor");
                    draggableElement.firstElementChild.setAttribute("value", draggableElement.id.substring(10));
                    currentActor = draggableElement;
                }

                parent.appendChild(draggableElement);
                return;
            }

            if (parent.id === "1dropzoneMovie" || parent.id === "1dropzoneMovieE") {
                draggableElement.firstElementChild.setAttribute("name", "");

                parent.appendChild(draggableElement);
                return;
            }

            if (parent.id === "2dropzoneMovie" || parent.id === "2dropzoneMovieE") {
                countChilds = parent.childElementCount;

                if (countChilds === 1) {
                    let containerDropzone;

                    if (parent.id === "2dropzoneMovieE") containerDropzone = document.getElementById("1dropzoneMovieE");
                    else containerDropzone = document.getElementById("1dropzoneMovie");

                    containerDropzone.appendChild(currentMovie);
                    currentMovie.firstElementChild.setAttribute("name", "");

                    if (parent.id === "2dropzoneMovieE") {
                        draggableElement.firstElementChild.setAttribute("name", "editContractForThisMovie");
                        draggableElement.firstElementChild.setAttribute("value", draggableElement.id.substring(10));
                    }

                    currentMovie = draggableElement;
                }

                parent.appendChild(draggableElement);
                return;
            }
        }

        event
            .dataTransfer
            .clearData();
    }
</script>

<!doctype html>
<html lang="ro">

<head>
    <title>Contracts</title>
</head>

<body>

<div class="mdl-layout mdl-js-layout">
    <header class="mdl-layout__header mdl-layout__header--scroll">
        <div class="mdl-layout__header-row">
            <a class="mdl-layout-title" href="index.jsp" style="color: white;"><h3>Home</h3></a>
            <div class="mdl-layout-spacer"></div>
            <nav class="mdl-navigation">
                <form role="form" action="actors_page" method="GET">
                    <input type="submit" class="btn btn-primary btn-lg m-2 fix-button" name="returnActors"
                           value="Actors">
                </form>

                <form role="form" action="contracts_page" method="GET">
                    <input type="submit" class="btn btn-primary btn-lg m-2 fix-button" name="returnContracts"
                           value="Contracts">
                </form>

                <form role="form" action="movies_page" method="GET">
                    <input type="submit" class="btn btn-primary btn-lg m-2 fix-button" name="returnMovies"
                           value="Movies">
                </form>
            </nav>
        </div>
    </header>
    <main class="mdl-layout__content">

        <!-- EDIT CONTRACT DIALOG -->
        <!-- The Modal -->
        <div id="myModalE" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span id="closeE" class="close" style="padding-top: 10px; padding-right: 10px">&times;</span>
                <form autocomplete="on" action="contracts_page" method="POST" style="margin-left: 60px">
                    <h1>Create a new contract</h1>
                    <select style="display: none" type="none" class="form-control" name="selected_editContract"
                            id="selected_editContract">
                        <option id="setEditId" value=" "></option>
                    </select>
                    <div class="float-container">
                        <div class="drop-parent float-child"
                             style="margin-top: 20px; margin-left: 40px; margin-bottom: 20px;">
                            <div id="1dropzoneActorE" class="dropzone container mdl-shadow--4dp" ondragover="onDragOver(event);"
                                 ondrop="onDrop(event);">
                                <%--@elvariable id="actors" type="java.util.List"--%>
                                <c:forEach var="ACTOR" items="${actors}">
                                    <div id="dragActorE${ACTOR.ACTOR_ID}" class="example-draggable" draggable="true"
                                         ondragstart="onDragStart(event);">
                                        <input type="hidden" id="actorIdE" name="" value=" ">

                                            ${ACTOR.LASTNAME} ${ACTOR.FIRSTNAME}
                                    </div>
                                </c:forEach>
                            </div>

                            <div id="2dropzoneActorE" class="dropzone container mdl-shadow--4dp" style="margin-left: 20px; height: 50px"
                                 ondragover="onDragOver(event);" ondrop="onDrop(event);">

                            </div>
                        </div>

                        <div class="drop-parent float-child"
                             style="margin-top: 20px; margin-bottom: 20px; margin-left: 40px;">
                            <div id="2dropzoneMovieE" style="height: 50px" class="dropzone container mdl-shadow--4dp"
                                 ondragover="onDragOver(event);" ondrop="onDrop(event);">

                            </div>

                            <div id="1dropzoneMovieE" class="dropzone container mdl-shadow--4dp" style="margin-left: 20px"
                                 ondragover="onDragOver(event);" ondrop="onDrop(event);">
                                <%--@elvariable id="movies" type="java.util.List"--%>
                                <c:forEach var="MOVIE" items="${movies}">
                                    <div id="dragMovieE${MOVIE.MOVIE_ID}" class="example-draggable" draggable="true"
                                         ondragstart="onDragStart(event);">
                                        <input type="hidden" id="movieIdE" name="" value=" ">
                                            ${MOVIE.MOVIE_NAME}
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div style="margin-left: 240px">
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?"
                                   id="paycheckE" name="paycheckE" value="0">
                            <label class="mdl-textfield__label" for="paycheckE">Paycheck</label>
                            <span class="mdl-textfield__error">Input is not a number!</span>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield" style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="date" id="dateE" name="dateE">
                            <label class="mdl-textfield__label" for="dateE"></label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                             style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="text" id="detailsE" name="detailsE" value=" ">
                            <label class="mdl-textfield__label" for="detailsE">Details</label>
                        </div>
                    </div>
                    <div class="center">
                        <button name="editContract"
                                class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect edit-profile-button">
                            Edit
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <!-- END EDIT CONTRACT DIALOG -->

        <div style="padding-bottom: 20px">
            <div>
                <h1>List of contracts</h1>
            </div>
            <div class="list-container">
                <!-- List with avatar and controls -->
                <ul class="list-control mdl-list">
                    <%--@elvariable id="contracts" type="java.util.List"--%>
                    <c:forEach var="CONTRACT" items="${contracts}">
                    <li class="mdl-list__item">
                    <span class="mdl-list__item-primary-content">
                    <i class="material-icons" style="font-size: 50px; padding-right: 10px; margin-left: 15px">summarize</i>
                    <div class="person-container">
                        ${CONTRACT.ACTOR.LASTNAME} is playing in ${CONTRACT.MOVIE.MOVIE_NAME}.
                    </div>
                    <div class="buttons-container">
                        <button id="myBtnE${CONTRACT.CONTRACT_ID}"
                                class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect edit-profile-button">Edit Contract</button>
                        <script>
                            var modalE = document.getElementById("myModalE");

                            var btnE${CONTRACT.CONTRACT_ID} = document.getElementById("myBtnE${CONTRACT.CONTRACT_ID}");

                            var spanE${CONTRACT.CONTRACT_ID} = document.getElementById("closeE");

                            var dropzoneActorE1 = document.getElementById("1dropzoneActorE");
                            var dropzoneMovieE1 = document.getElementById("1dropzoneMovieE");

                            var dropzoneActorE2 = document.getElementById("2dropzoneActorE");
                            var dropzoneMovieE2 = document.getElementById("2dropzoneMovieE");

                            btnE${CONTRACT.CONTRACT_ID}.onclick = function () {
                                modalE.style.display = "block";

                                var ID = document.getElementById("setEditId");
                                var paycheck = document.getElementById("paycheckE");
                                var date = document.getElementById("dateE");
                                var details = document.getElementById("detailsE");

                                var draggableActor = document.getElementById("dragActorE${CONTRACT.ACTOR.ACTOR_ID}");
                                var draggableMovie = document.getElementById("dragMovieE${CONTRACT.MOVIE.MOVIE_ID}");

                                currentMovie = draggableMovie;
                                currentActor = draggableActor;

                                removeAllChildNodes(dropzoneActorE2);
                                dropzoneMovieE1.appendChild(dropzoneMovieE2.firstChild);

                                paycheck.value = "${CONTRACT.PAYCHECK}";
                                date.value = "${CONTRACT.DATE}";
                                details.value = "${CONTRACT.DETAILS}";

                                draggableActor.firstElementChild.setAttribute("name", "editContractForThisActor");
                                draggableActor.firstElementChild.setAttribute("value", draggableActor.id.substring(10));
                                dropzoneActorE2.appendChild(draggableActor);

                                draggableMovie.firstElementChild.setAttribute("name", "editContractForThisMovie");
                                draggableMovie.firstElementChild.setAttribute("value", draggableMovie.id.substring(10));
                                dropzoneMovieE2.appendChild(draggableMovie);

                                ID.value = "${CONTRACT.CONTRACT_ID}";
                            }

                            function removeAllChildNodes(parent) {
                                while (parent.firstChild) {
                                    dropzoneActorE1.appendChild(dropzoneActorE2.firstChild);
                                }
                            }

                            spanE${CONTRACT.CONTRACT_ID}.onclick = function () {
                                modalE.style.display = "none";
                            }
                        </script>
                        <button id="myBtn${CONTRACT.CONTRACT_ID}"
                                class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect">View Contract</button>
                    <form role="form" action="contracts_page" method="POST" style="margin-right: 60px;">
                        <select style="display: none" type="none" class="form-control" name="selected_deleteContract" id="selected_deleteContract">
                            <option value="${CONTRACT.CONTRACT_ID}"></option>
                        </select>
                        <button type="submit" name="deleteContract" class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored"
                                style="float: right; bottom: 35px"><i class="material-icons">delete</i></button>
                    </form>

                                <!-- The Modal -->
                    <div id="myModal${CONTRACT.CONTRACT_ID}" class="modal">

                        <!-- Modal content -->
                        <div class="demo-card-wide mdl-card mdl-shadow--2dp modal-content">
                            <div class="mdl-card__title">
                <h2 class="mdl-card__title-text"
                    style="color: white; font-weight: bold; font-size: 40px"></h2>
            </div>
                            <div class="mdl-card__supporting-text">
                    <p class="info-text-a">Contract information:</p>
                    <p class="info-text-p"> Paycheck: ${CONTRACT.PAYCHECK} </p>
                    <p class="info-text-p"> Sign date: ${CONTRACT.DATE.format(DateTimeFormatter.ofPattern("dd.MM.yyyy"))} </p>
                    <p class="info-text-p"> Details: ${CONTRACT.DETAILS} </p>
                    <p class="info-text-p" style="font-weight: bold"> ${CONTRACT.ACTOR.LASTNAME} has a role in "${CONTRACT.MOVIE.MOVIE_NAME}" directed by ${CONTRACT.MOVIE.MOVIE_DIRECTOR}.</p>

            </div>
                            <div class="mdl-card__actions mdl-card--border">
                <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
                   id="close${CONTRACT.CONTRACT_ID}">
                    Close
                </a>
            </div>
                        </div>
                    </div>

                    <script>
                        var modal${CONTRACT.CONTRACT_ID} = document.getElementById("myModal${CONTRACT.CONTRACT_ID}");

                        var btn${CONTRACT.CONTRACT_ID} = document.getElementById("myBtn${CONTRACT.CONTRACT_ID}");

                        var span${CONTRACT.CONTRACT_ID} = document.getElementById("close${CONTRACT.CONTRACT_ID}");

                        btn${CONTRACT.CONTRACT_ID}.onclick = function () {
                            modal${CONTRACT.CONTRACT_ID}.style.display = "block";
                        }

                        span${CONTRACT.CONTRACT_ID}.onclick = function () {
                            modal${CONTRACT.CONTRACT_ID}.style.display = "none";
                        }
                    </script>
                    </div>
                    </span>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <!-- CREATE A NEW CONTRACT -->
        <div class="add-contract-button">
            <button id="myBtn"
                    class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-mini-footer__right-section">
                <i class="material-icons">add</i>
            </button>
            <!-- The Modal -->
            <div id="myModal" class="modal">

                <!-- Modal content -->
                <div class="modal-content">
                    <span id="close" class="close" style="padding-top: 10px; padding-right: 10px">&times;</span>
                    <form autocomplete="on" action="contracts_page" method="POST" style="margin-left: 60px">
                        <h1>Create a new contract</h1>
                        <div class="float-container">
                            <div class="drop-parent float-child"
                                 style="margin-top: 20px; margin-left: 40px; margin-bottom: 20px;">
                                <div id="1dropzoneActor" class="dropzone container mdl-shadow--4dp" ondragover="onDragOver(event);"
                                     ondrop="onDrop(event);">
                                    <%--@elvariable id="actors" type="java.util.List"--%>
                                    <c:forEach var="ACTOR" items="${actors}">
                                        <div id="dragActor${ACTOR.ACTOR_ID}" class="example-draggable" draggable="true"
                                             ondragstart="onDragStart(event);">
                                            <input type="hidden" id="actorId" name="" value=" ">

                                                ${ACTOR.LASTNAME} ${ACTOR.FIRSTNAME}
                                        </div>
                                    </c:forEach>
                                </div>

                                <div id="2dropzoneActor" class="dropzone container mdl-shadow--4dp" style="margin-left: 20px;"
                                     ondragover="onDragOver(event);" ondrop="onDrop(event);">

                                </div>
                            </div>

                            <div class="drop-parent float-child"
                                 style="margin-top: 20px; margin-bottom: 20px; margin-left: 40px;">
                                <div id="2dropzoneMovie" style="height: 50px" class="dropzone container mdl-shadow--4dp"
                                     ondragover="onDragOver(event);" ondrop="onDrop(event);">

                                </div>

                                <div id="1dropzoneMovie" class="dropzone container mdl-shadow--4dp" style="margin-left: 20px"
                                     ondragover="onDragOver(event);" ondrop="onDrop(event);">
                                    <%--@elvariable id="movies" type="java.util.List"--%>
                                    <c:forEach var="MOVIE" items="${movies}">
                                        <div id="dragMovie${MOVIE.MOVIE_ID}" class="example-draggable" draggable="true"
                                             ondragstart="onDragStart(event);">
                                            <input type="hidden" id="movieId" name="" value=" ">
                                                ${MOVIE.MOVIE_NAME}
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div style="margin-left: 240px">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?"
                                       id="paycheck" name="paycheck">
                                <label class="mdl-textfield__label" for="paycheck">Paycheck</label>
                                <span class="mdl-textfield__error">Input is not a number!</span>
                            </div>
                            <div class="mdl-textfield mdl-js-textfield" style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="date" id="date" name="date">
                                <label class="mdl-textfield__label" for="date"></label>
                            </div>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                                 style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="text" id="details" name="details">
                                <label class="mdl-textfield__label" for="details">Details</label>
                            </div>
                        </div>
                        <div class="center">
                            <button name="addContract"
                                    class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect edit-profile-button">
                                Create
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <script>
                var modal = document.getElementById("myModal");

                var btn = document.getElementById("myBtn");

                var span = document.getElementById("close");

                function removeChilds() {

                    let dropzoneActor1 = document.getElementById("1dropzoneActor");
                    let dropzoneMovie1 = document.getElementById("1dropzoneMovie");

                    let dropzoneActor2 = document.getElementById("2dropzoneActor");
                    let dropzoneMovie2 = document.getElementById("2dropzoneMovie");

                    while (dropzoneActor2.firstChild) {
                        dropzoneActor2.firstElementChild.firstElementChild.setAttribute("name", "");
                        dropzoneActor1.appendChild(dropzoneActor2.firstChild);
                    }

                    while (dropzoneMovie2.firstChild) {
                        dropzoneMovie2.firstElementChild.firstElementChild.setAttribute("name", "");
                        dropzoneMovie1.appendChild(dropzoneMovie2.firstChild);
                    }
                }
                btn.onclick = function () {
                    modal.style.display = "block";

                    removeChilds();
                }

                span.onclick = function () {
                    modal.style.display = "none";
                }
            </script>
        </div>
        <!-- END CREATE A NEW CONTRACT -->
    </main>
</div>
</body>

</html>