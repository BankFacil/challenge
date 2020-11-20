<?php
namespace Creditas\Classes\OrderItemProductType;

use Creditas\Classes\OrderItem;

class Physical extends OrderItem
{
    public function close()
    {
        parent::close();
        $label = $this->order->shipping->label();
        printf('<br>Shipping label: %s', $label);
    }
}
