<?php
namespace Creditas\Classes;

class OrderItem
{
    
    public $order;
    public $product;

    public function __construct(Order $order, Product $product)
    {
        $this->order = $order;
        $this->product = $product;
    }

    public function total()
    {
        return 10;
    }

    public function close()
    {
        return true;
    }
}
