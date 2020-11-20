<?php
namespace Creditas\Classes;

class Product
{

    public $name = null;

    # use type to distinguish each kind of product: physical, book, digital, membership, etc.
    public $type = null;

    public function __construct($name, $type)
    {
        $this->name = $name;
        $this->type = $type;
    }
}
