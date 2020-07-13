<?php

$link = oci_connect("scsips", "scsips", "192.168.0.200/xe");

if (!$link) {
    printf("Connection error\n");
}

/**
 * Generamos los registros de USUARIO_PROYECTO
 */
/*
foreach (getProjects($link) as $project) {

    $userList = generateRandomArray(getUsers($link));
    $roleList = generateRandomArray(getRoles($link));

    $lengthUsers = count($userList);
    $lengthRoles = count($roleList);

    $leader = false;

    for ($i = 0; $i < random_int(2, $lengthUsers); $i++) {

        $user = array_pop($userList);

        if (!$leader) {
            $query = sprintf("INSERT INTO
                              USUARIO_PROYECTO (identificador_proyecto, identificador_usuario, identificador_rol)
                              VALUES
                              (%d, %d, %d)", $project, $user, getRoles($link)[0]);
            $leader =  true;
        } else {
            $query = sprintf("INSERT INTO
                              USUARIO_PROYECTO (identificador_proyecto, identificador_usuario, identificador_rol)
                              VALUES
                              (%d, %d, %d)", $project, $user, getRoles($link)[random_int(1, $lengthRoles - 1)]);
        }

        $statement = oci_parse($link, $query);
        oci_execute($statement);
    }
}
*/

/**
 * Generamos los registros de INCIDENTE
 */
/*
foreach (getProjects($link) as $project) {

    $typeList = getIncidentTypes($link);
    $stateList = getIncidentStates($link);

    $userList = getUsersByProject($project, $link);

    for ($i = 0; $i < random_int(50, 250); $i++) {

        $type = $typeList[array_rand($typeList)];
        $state = $stateList[array_rand($stateList)];

        $user = $userList[array_rand($userList)];

        $title =  "Incident #" . generateRandomString(7);
        $description  = generateRandomParagraph(50);

        $query = sprintf("INSERT INTO 
                          INCIDENTE (identificador_tipo_incidente, identificador_estado_incidente, identificador_proyecto, identificador_usuario, titulo, descripcion)
                          VALUES
                          (%d, %d, %d, %d, '%s', '%s')", $type, $state, $project, $user, $title, $description);

        $statement = oci_parse($link, $query);
        oci_execute($statement);
    }
}
*/

/**
 * Generamos los registros de INCIDENTE
 */
/*
foreach (getIncidents($link) as $incident) {

    $year = random_int(2018, 2020);
    $month = random_int(1, 12);
    $day = random_int(1, 28);

    for ($i = 1; $i <= $incident["IDENTIFICADOR_ESTADO_INCIDENTE"]; $i++) {

        switch ($i) {
            case 1:

                $dateMAX = new DateTime("$year-$month-$day");
                $dateMAX->sub(new DateInterval("P" . random_int(14, 21) . "D"));

                $date =  $dateMAX->format('Y-m-d');

                $query = sprintf("INSERT INTO
                                  HISTORICO_INCIDENTE (identificador_incidente, identificador_usuario, identificador_estado_incidente, fecha)
                                  VALUES
                                  (%d, %d, %d, TO_DATE('%s', 'YYYY-MM-DD'))", $incident["IDENTIFICADOR"], $incident["IDENTIFICADOR_USUARIO"], $i, $date);

                $statement = oci_parse($link, $query);
                oci_execute($statement);

                break;

            case 2:
                $dateMED = new DateTime("$year-$month-$day");
                $dateMED->sub(new DateInterval("P" . random_int(7, 14) . "D"));

                $date =  $dateMED->format('Y-m-d');

                $query = sprintf("INSERT INTO
                                  HISTORICO_INCIDENTE (identificador_incidente, identificador_usuario, identificador_estado_incidente, fecha)
                                  VALUES
                                  (%d, %d, %d, TO_DATE('%s', 'YYYY-MM-DD'))", $incident["IDENTIFICADOR"], $incident["IDENTIFICADOR_USUARIO"], $i, $date);

                $statement = oci_parse($link, $query);
                oci_execute($statement);

                break;

            case 3:
                $dateMIN = new DateTime("$year-$month-$day");
                $dateMIN->sub(new DateInterval("P" . random_int(1, 7) . "D"));

                $date =  $dateMIN->format('Y-m-d');

                $query = sprintf("INSERT INTO
                                  HISTORICO_INCIDENTE (identificador_incidente, identificador_usuario, identificador_estado_incidente, fecha)
                                  VALUES
                                  (%d, %d, %d, TO_DATE('%s', 'YYYY-MM-DD'))", $incident["IDENTIFICADOR"], $incident["IDENTIFICADOR_USUARIO"], $i, $date);

                $statement = oci_parse($link, $query);
                oci_execute($statement);

                break;
        }
    }

}
*/

oci_close($link);

function getUsers($link)
{
    $list = array();

    $statement = oci_parse($link, "SELECT IDENTIFICADOR FROM USUARIO");
    oci_execute($statement);
    oci_fetch_all($statement, $list);
    oci_free_statement($statement);

    return $list["IDENTIFICADOR"];
}

function getProjects($link)
{
    $list = array();

    $statement = oci_parse($link, "SELECT IDENTIFICADOR FROM PROYECTO");
    oci_execute($statement);
    oci_fetch_all($statement, $list);
    oci_free_statement($statement);

    return $list["IDENTIFICADOR"];
}

function getRoles($link)
{
    $list = array();

    $statement = oci_parse($link, "SELECT IDENTIFICADOR FROM ROL");
    oci_execute($statement);
    oci_fetch_all($statement, $list);
    oci_free_statement($statement);

    return $list["IDENTIFICADOR"];
}

function getIncidentTypes($link)
{
    $list = array();

    $statement = oci_parse($link, "SELECT IDENTIFICADOR FROM TIPO_INCIDENTE");
    oci_execute($statement);
    oci_fetch_all($statement, $list);
    oci_free_statement($statement);

    return $list["IDENTIFICADOR"];
}

function getIncidentStates($link)
{
    $list = array();

    $statement = oci_parse($link, "SELECT IDENTIFICADOR FROM ESTADO_INCIDENTE");
    oci_execute($statement);
    oci_fetch_all($statement, $list);
    oci_free_statement($statement);

    return $list["IDENTIFICADOR"];
}

function getIncidents($link)
{
    $list = array();

    $statement = oci_parse($link, "SELECT * FROM INCIDENTE");
    oci_execute($statement);

    while (($row = oci_fetch_assoc($statement))) {
        $list[] = $row;
    }

    oci_free_statement($statement);
    return $list;
}

function getUsersByProject($project, $link)
{
    $list = array();

    $query = sprintf("SELECT IDENTIFICADOR_USUARIO FROM USUARIO_PROYECTO WHERE IDENTIFICADOR_PROYECTO = %d", $project);

    $statement = oci_parse($link, $query);
    oci_execute($statement);
    oci_fetch_all($statement, $list);
    oci_free_statement($statement);

    return $list["IDENTIFICADOR_USUARIO"];
}

function generateRandomArray($array)
{

    $random = array_rand($array, random_int(2, count($array)));
    $unique = array_unique($random);

    return $unique;
}

function generateRandomString($length)
{
    return substr(strtoupper(bin2hex(openssl_random_pseudo_bytes(32))), 0, $length);
}

function generateRandomParagraph($length)
{
    $list = array();

    for ($i = 0; $i < $length; $i++) {
        $list[] = decbin(random_int(1, 128));
    }

    return implode(" ", $list);
}
