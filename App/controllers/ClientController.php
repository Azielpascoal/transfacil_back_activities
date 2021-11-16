<?php

namespace App\controllers;

use App\DAO\mysql\transfacil\client;
use App\models\mysql\transfacil\ClientModel;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;


    final class ClientController{
        public function getClient(Request $request,Response $response, array $arg):Response
        {
           $client = new client();
           $client->getAllClient();
           $response = $response->withJson($client);
            return $response;
        }
        public function insertClient(Request $request,Response $response, array $arg):Response
        {
            $data = $request->getParsedBody();
            $client = new Client();
            $clientModel = new ClientModel();
            $clientModel->setName($data['nome_cliente']);
            $clientModel->setEmail($data['email']);
            $clientModel->setBI($data['n_bilhete']);
            $clientModel->setTaxista($data['is_taxista']);
            $clientModel->setChargerTaxista($data['is_charger_taxista']);
            $clientModel->setPassword($data['password']);
            $client->insertClient($clientModel);

            $response = $response->withJson([
                "message"=>"Novo Cliente Adicionado !"
            ]);
            return $response;
        }
        public function updateClient(Request $request,Response $response, array $arg):Response
        {
            return $response;
        }
        public function deleteClient(Request $request,Response $response, array $arg):Response
        {
            return $response;
        }
    }