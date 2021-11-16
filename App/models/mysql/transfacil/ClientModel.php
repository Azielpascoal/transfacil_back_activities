<?php
   namespace App\models\mysql\transfacil;

   final class  ClientModel{

    /**
     * @var int
     */
        private $id_cliente;
    /**
     * @var string
     */
        private $nome_cliente;
    /**
     * @var string
     */
        private $email;
    /**
     * @var string
     */
        private $n_bilhete;
    /**
     * @var string
     */
        private $is_taxista;
    /**
     * @var string
     */
        private $is_charger_taxista;
    /**
     * @var string
     */
        private $password;

    public function getId():int
    {
        return $this->id_cliente;
    }
    public function getName():string
    {
        return $this->nome_cliente;
    }
    public function setName( $nome_cliente) :ClientModel
    {
        $this->nome_cliente = $nome_cliente;
        return $this;
    }
    public function getEmail():string
    {
        return $this->email;
    }
    public function setEmail( $email) :ClientModel
    {
        $this->email = $email;
        return $this;
    }
    public function getBI():string
    {
        return $this->n_bilhete;
    }
    public function setBI( $n_bilhete) :ClientModel
    {
        $this->n_bilhete = $n_bilhete;
        return $this;
    }
    public function getTaxista():string
    {
        return $this->is_taxista;
    }
    public function setTaxista( $is_taxista) :ClientModel
    {
        $this->is_taxista = $is_taxista;
        return $this;
    }
    public function getChargerTaxista():string
    {
        return $this->is_charger_taxista;
    }
    public function setChargerTaxista( $is_charger_taxista) :ClientModel
    {
        $this->is_charger_taxista = $is_charger_taxista;
        return $this;
    }
    public function getPassword():string
    {
        return $this->password;
    }
    public function setPassword( $password) :ClientModel
    {
        $this->password = $password;
        return $this;
    }


   }