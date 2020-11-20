<?php
namespace Creditas\Classes;

class Invoice
{
    public $billingAddress;
    public $shippingAddress;
    public $order;

    public function __construct($attributes)
    {
        $this->billingAddress = $attributes['billingAddress'];
        $this->shippingAddress = $attributes['shippingAddress'];
        $this->order = $attributes['order'];
    }
}
