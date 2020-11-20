<?php
namespace Creditas\Classes;

class Address
{
    public $zipcode;

    public function __construct($zipcode)
    {
        $this->zipcode = $zipcode;
    }
}
