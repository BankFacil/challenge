<?php
namespace Creditas\Classes;

class Shipping
{
    public $order;

    public function __construct(Order $order)
    {
        $this->order = $order;
    }

    public function label($notification = '')
    {
        return sprintf('%s %s %s', $this->order->customer->name, $this->order->address->zipcode, $notification);
    }
}
