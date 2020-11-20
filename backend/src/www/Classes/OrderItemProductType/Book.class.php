<?php
namespace Creditas\Classes\OrderItemProductType;

use Creditas\Classes\OrderItem;

class Book extends OrderItem
{
    public function close()
    {
        parent::close();
        $label = $this->order->shipping->label('Item isento de impostos conforme disposto na Constituição Art. 150, VI, d.');
        printf('<br>Shipping label: %s', $label);
    }
}
