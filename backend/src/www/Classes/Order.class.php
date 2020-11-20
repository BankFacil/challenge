<?php
namespace Creditas\Classes;

class Order
{
    
    public $customer;
    public $items;
    public $payment;
    public $address;
    public $shipping;
    public $closedAt;

    public function __construct(Customer $customer, $attributes = array())
    {
        $this->customer = $customer;
        $this->items = array();
        $this->address = isset($attributes['address']) ? $attributes['address'] : new Address('45678-979');
        $this->shipping = new Shipping($this);
    }

    public function addProduct(Product $product)
    {
        $space = 'Creditas\Classes';
        $spaceClass = sprintf('%s\OrderItemProductType\%s', $space, ucwords($product->type));
        $class = class_exists($spaceClass) ? $spaceClass : sprintf('%s\OrderItem', $space);
        array_push($this->items, new $class($this, $product));
    }

    public function totalAmount()
    {
        $total = 0;
        foreach ($this->items as $item) {
             $total += $item->total();
        }
        return $total;
    }

    public function close($closeAt)
    {
        foreach ($this->items as $item) {
            $item->close();
        }
        $this->closedAt = $closeAt;
    }
}
