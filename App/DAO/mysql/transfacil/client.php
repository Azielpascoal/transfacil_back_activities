<?php

    
namespace App\DAO\mysql\transfacil;
use App\models\mysql\transfacil\ClientModel;

class client extends connection{
     public function __construct() {
         parent:: __construct();
     }

     public function getAllClient():array{
         $clients = $this->pdo
         ->query('SELECT id_cliente,nome_cliente,email,n_bilhete,is_taxista,is_charger_taxista,password FROM cliente')
         ->fetchAll(\PDO::FETCH_ASSOC);

        // foreach ($clients as $client){
        //     var_dump($clients);
        // }
        return $clients;
        
     }
     public function insertClient(ClientModel $client):void{
        $statement = $this->pdo 
        ->prepare('INSERT INTO cliente VALUES(
            null,
            :nome_cliente,
            :email,
            :n_bilhete,
            :is_taxista,
            :is_charger_taxista,
            :password
        );');
        $statement->execute([
            'nome_cliente'=>$client->getName(),
            'email'=>$client->getEmail(),
            'n_bilhete'=>$client->getBI(),
            'is_taxista'=>$client->getTaxista(),
            'is_charger_taxista'=>$client->getChargerTaxista(),
            'password'=>$client->getPassword(),
        ]);

     }
 }