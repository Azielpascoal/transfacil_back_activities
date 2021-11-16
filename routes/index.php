<?php


use function src\slimConfiguration;
$app = new \Slim\App(slimConfiguration());
use App\controllers\ClientController;
// ====================================

$app->get('/client' ,ClientController ::class .':getClient');
$app->post('/client',ClientController ::class .':insertClient');
$app->put('/client',ClientController ::class .':upadteClient');
$app->delete('/client',ClientController ::class .':deleteClient');


// ====================================
$app->run();