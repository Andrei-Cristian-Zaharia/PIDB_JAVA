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
        width: 300px;
    }

    .buttons-container {
        width: 400px;
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

    .check-label {
        text-align: right;
        width: 0px;
        clear: both;
        float: left;
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
        width: 512px;
    }

    .demo-card-wide > .mdl-card__title {
        color: #fff;
        height: 176px;
        background: url("https://dspncdn.com/a1/media/692x/96/99/10/969910d8419c0feb6d811391dfb5041b.jpg") center / cover;
    }

    .demo-card-wide > .mdl-card__menu {
        color: #fff;
    }
</style>
<body>

<!-- NAVBAR -->
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
    <main class="mdl-layout__content background-color">
        <!-- END NAVBAR -->

        <!-- EDIT ACTOR DIALOG -->
        <!-- The Modal -->
        <div id="myModalE" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span id="closeE" class="close" style="padding-right: 10px; padding-top: 10px">&times;</span>
                <form autocomplete="on" action="actors_page" method="POST" style="margin-right: 60px;">
                    <h1>Edit actor</h1>
                    <select style="display: none" type="none" class="form-control" name="selected_editActor"
                            id="selected_editActor">
                        <option id="setEditId" value=" "></option>
                    </select>
                    <div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                             style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="text" id="Elastname" name="Elastname" value=" ">
                            <label class="mdl-textfield__label" for="Elastname">Lastname</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                             style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="text" id="Efirstname" name="Efirstname" value=" ">
                            <label class="mdl-textfield__label" for="Efirstname">Firstname</label>
                        </div>
                    </div>
                    <div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                             style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="text" id="Eemailaddress" name="Eemailaddress"
                                   value=" ">
                            <label class="mdl-textfield__label" for="Eemailaddress">Email Address</label>
                        </div>
                    </div>
                    <div>
                        <div class="mdl-textfield mdl-js-textfield" style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="text" pattern="[0-9]*" id="Ephone" name="Ephone"
                                   value="0">
                            <label class="mdl-textfield__label" for="Ephone">Phone Number</label>
                            <span class="mdl-textfield__error">Digits only</span>
                        </div>
                    </div>
                    <div>
                        <div class="mdl-textfield mdl-js-textfield" style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="date" id="Ebirthdate" name="Ebirthdate">
                            <label class="mdl-textfield__label" for="Ebirthdate"></label>
                        </div>
                    </div>
                    <div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                             style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="text" id="Enationality" name="Enationality"
                                   value=" ">
                            <label class="mdl-textfield__label" for="Enationality">Nationality</label>
                        </div>
                    </div>
                    <div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                             style="margin-left: 40px">
                            <input class="mdl-textfield__input" type="text" id="Eprefered_role" name="Eprefered_role"
                                   value=" ">
                            <label class="mdl-textfield__label" for="Eprefered_role">Prefered Role</label>
                        </div>
                    </div>
                    <div style="margin-left: 40px">
                        <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect check-label" for="Echeckbox">
                            <input type="checkbox" id="Echeckbox" class="mdl-switch__input" name="Echeckbox"
                                   value="yes">
                            <span class="mdl-switch__label"></span>
                        </label>
                        <p style="color: black; padding-left: 40px">Check this box if he is available for a new
                            role.</p>
                    </div>
                    <div class="center">
                        <button name="editActor"
                                class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect edit-profile-button">
                            Edit
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <!-- END EDIT ACTOR DIALOG -->

        <div style="padding-bottom: 20px">
            <div>
                <h1>List of actors</h1>
            </div>
            <div class="list-container">
                <!-- List with avatar and controls -->
                <ul class="list-control mdl-list">
                    <%--@elvariable id="actors" type="java.util.List"--%>
                    <c:forEach var="ACTOR" items="${actors}">
                        <li class="mdl-list__item">
    <span class="mdl-list__item-primary-content">
      <i class="material-icons mdl-list__item-avatar">person</i>
        <div class="person-container">
            ${ACTOR.LASTNAME} ${ACTOR.FIRSTNAME}
        </div>
        <div class="buttons-container">
            <button id="myBtnE${ACTOR.ACTOR_ID}"
                    class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect edit-profile-button">Edit Profile</button>
            <script>
            var modalE = document.getElementById("myModalE");

            var btnE${ACTOR.ACTOR_ID} = document.getElementById("myBtnE${ACTOR.ACTOR_ID}");

            var spanE${ACTOR.ACTOR_ID} = document.getElementById("closeE");

            btnE${ACTOR.ACTOR_ID}.onclick = function () {
                modalE.style.display = "block";

                var lastnameEdit = document.getElementById("Elastname");
                var firstnameEdit = document.getElementById("Efirstname");
                var emailaddressEdit = document.getElementById("Eemailaddress");
                var phonenumberEdit = document.getElementById("Ephone");
                var dateEdit = document.getElementById("Ebirthdate");
                var nationalityEdit = document.getElementById("Enationality");
                var preferedRoleEdit = document.getElementById("Eprefered_role");
                var checkEdit = document.getElementById("Echeckbox");
                var ID = document.getElementById("setEditId");

                lastnameEdit.value = "${ACTOR.LASTNAME}";
                firstnameEdit.value = "${ACTOR.FIRSTNAME}";
                emailaddressEdit.value = "${ACTOR.EMAIL_ADDRESS}";
                phonenumberEdit.value = "0${ACTOR.PHONE_NUMBER}";
                dateEdit.value = "${ACTOR.BIRTHDATE}";
                nationalityEdit.value = "${ACTOR.NATIONALITY}";
                preferedRoleEdit.value = "${ACTOR.PREFERED_ROLE}";

                var isOccupied = "${ACTOR.OCCUPIED}";

                if (isOccupied === "true" && checkEdit.checked === false) {
                    checkEdit.click();
                }

                if (isOccupied === "false" && checkEdit.checked === true) {
                    checkEdit.click();
                }

                ID.value = "${ACTOR.ACTOR_ID}";
            }

            spanE${ACTOR.ACTOR_ID}.onclick = function () {
                modalE.style.display = "none";
            }
        </script>
            <button id="myBtn${ACTOR.ACTOR_ID}"
                    class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect">View Profile</button>
            <form role="form" action="actors_page" method="POST" style="margin-right: 60px;">
                <select style="display: none" type="none" class="form-control" name="selected_deleteActor"
                        aria-label="Select judecator" id="selected_deleteActor">
                    <option value="${ACTOR.ACTOR_ID}"></option>
                </select>
                <button type="submit" name="deleteActor"
                        class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored"><i class="material-icons">delete</i></button>
            </form>

            <!-- The Modal -->
        <div id="myModal${ACTOR.ACTOR_ID}" class="modal">
                        <!-- Modal content -->

            <div class="demo-card-wide mdl-card mdl-shadow--2dp modal-content">
            <div class="mdl-card__title">
                <h2 class="mdl-card__title-text"
                    style="color: white; font-weight: bold; font-size: 40px">${ACTOR.LASTNAME} ${ACTOR.FIRSTNAME}</h2>
            </div>
            <div class="mdl-card__supporting-text">
                    <p class="info-text-a">Personal information:</p>
                    <p class="info-text-p"> Birthdate: ${ACTOR.BIRTHDATE.format(DateTimeFormatter.ofPattern("dd.MM.yyyy"))} </p>
                    <p class="info-text-p"> Nationality: ${ACTOR.NATIONALITY} </p>
                    <p class="info-text-p"> Prefered role: ${ACTOR.PREFERED_ROLE} </p>
                    <p class="info-text-a">Contact information:</p>
                    <p class="info-text-p"> Email address: ${ACTOR.EMAIL_ADDRESS} </p>
                    <p class="info-text-p"> Phone number: 0${ACTOR.PHONE_NUMBER} </p>
                    <c:if test="${ACTOR.OCCUPIED == false}">
                        <p class="info-text-a" style="text-align: center;"> Available for new movies !</p>
                    </c:if>
                    <c:if test="${ACTOR.OCCUPIED == true}">
                        <p class="info-text-a" style="text-align: center;"> ${ACTOR.LASTNAME} has a role in a new movie right now.</p>
                    </c:if>
            </div>
            <div class="mdl-card__actions mdl-card--border">
                <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" id="close${ACTOR.ACTOR_ID}">
                    Close
                </a>
            </div>
            </div>
        </div>

        <script>
            var modal${ACTOR.ACTOR_ID} = document.getElementById("myModal${ACTOR.ACTOR_ID}");

            var btn${ACTOR.ACTOR_ID} = document.getElementById("myBtn${ACTOR.ACTOR_ID}");

            var span${ACTOR.ACTOR_ID} = document.getElementById("close${ACTOR.ACTOR_ID}");

            btn${ACTOR.ACTOR_ID}.onclick = function () {
                modal${ACTOR.ACTOR_ID}.style.display = "block";
            }

            span${ACTOR.ACTOR_ID}.onclick = function () {
                modal${ACTOR.ACTOR_ID}.style.display = "none";
                console.log(${ACTOR.ACTOR_ID});
            }
        </script>
        </div>
    </span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <!-- ADD NEW ACTOR -->
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
                    <form autocomplete="on" action="actors_page" method="POST" style="margin-right: 60px;">
                        <h1>Add a new actor</h1>
                        <div>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                                 style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="text" id="lastname" name="lastname">
                                <label class="mdl-textfield__label" for="lastname">Lastname</label>
                            </div>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                                 style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="text" id="firstname" name="firstname">
                                <label class="mdl-textfield__label" for="firstname">Firstname</label>
                            </div>
                        </div>
                        <div>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                                 style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="text" id="emailaddress" name="emailaddress">
                                <label class="mdl-textfield__label" for="emailaddress">Email Address</label>
                            </div>
                        </div>
                        <div>
                            <div class="mdl-textfield mdl-js-textfield" style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="text" pattern="[0-9]*" id="phone"
                                       name="phone">
                                <label class="mdl-textfield__label" for="phone">Phone Number</label>
                                <span class="mdl-textfield__error">Digits only</span>
                            </div>
                        </div>
                        <div>
                            <div class="mdl-textfield mdl-js-textfield" style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="date" id="birthdate"
                                       name="birthdate">
                                <label class="mdl-textfield__label" for="birthdate"></label>
                            </div>
                        </div>
                        <div>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                                 style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="text" id="nationality" name="nationality">
                                <label class="mdl-textfield__label" for="nationality">Nationality</label>
                            </div>
                        </div>
                        <div>
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                                 style="margin-left: 40px">
                                <input class="mdl-textfield__input" type="text" id="prefered_role" name="prefered_role">
                                <label class="mdl-textfield__label" for="prefered_role">Prefered Role</label>
                            </div>
                        </div>
                        <div style="margin-left: 40px">
                            <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect check-label" for="checkbox">
                                <input type="checkbox" id="checkbox" class="mdl-switch__input" name="checkbox" checked>
                                <span class="mdl-switch__label"></span>
                            </label>
                            <p style="color: black; padding-left: 40px">Check this box if he is available for a new
                                role.</p>
                        </div>
                        <div class="center">
                            <button name="addActor"
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
        <!-- END ADD NEW ACTOR -->

    </main>
</div>
</body>