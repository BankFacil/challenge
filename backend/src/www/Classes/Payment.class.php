<?php
namespace Creditas\Classes;

class Payment
{
    public $authorizationNumber;
    public $amount;
    public $invoice;
    public $order;
    public $paymentMethod;
    public $paidAt;

    public function __construct(array $attributes)
    {
        $this->authorizationNumber = $attributes['authorizationNumber'];
        $this->amount = $attributes['amount'];
        $this->invoice = $attributes['invoice'];
        $this->order = $attributes['order'];
        $this->paymentMethod = $attributes['paymentMethod'];
    }

    public function pay($paidAt)
    {
        $this->amount = $this->order->totalAmount;
        $this->authorizationNumber = intval(time());
        $attributes = array(
            'billingAddress' => $this->order->address,
            'shippingAddress' => $this->order->address,
            'order' => $this->order
        );
        $this->invoice = new Invoice($attributes);
        $this->paidAt = $paidAt;
        return true;
    }

    public function isPaid()
    {
        return isset($this->paidAt);
    }
}
