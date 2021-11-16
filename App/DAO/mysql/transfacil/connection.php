<?php 

 namespace App\DAO\mysql\transfacil;

 abstract class connection{
     //USEI PDO PARA CONEXÃO ISSO USANDO ORIENTAÇÃO A OBJETOS

     /**
      * @var \PDO
      */
      protected $pdo;

      public function __construct(){
          $host =getenv('TRANSFACIL_DB_MYSQL_HOST');
          $port =getenv('TRANSFACIL_DB_MYSQL_PORT');
          $user = getenv('TRANSFACIL_DB_MYSQL_USER');
          $pass=getenv('TRANSFACIL_DB_MYSQL_PASSWORD');
          $dbname = getenv('TRANSFACIL_DB_MYSQL_DBNAME');

          $dsn = "mysql:host={$host};dbname={$dbname};port={$port};";

          $this->pdo = new \PDO($dsn, $user, $pass);
          $this->pdo->setAttribute(
              \PDO::ATTR_ERRMODE,
              \PDO::ERRMODE_EXCEPTION
          );
      }
 }