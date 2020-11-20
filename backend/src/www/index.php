<?php

namespace Creditas;

require("vendor/autoload.php");

use Creditas\Classes\CreditCard;
use Creditas\Classes\Customer;
use Creditas\Classes\Order;
use Creditas\Classes\Payment;
use Creditas\Classes\Product;

$orders = array(
    array(
        new Customer("Cristiane Silva", "cristianesilva@gmail.com"),
        array(
            new Product('Assinatura Digital', 'membership')
        )
    ),
    array(
        new Customer("Lazaro Ramos", "lazaroramos@gmail.com"),
        array(
            new Product('Livro', 'book')
        )
    ),
    array(
        new Customer("Leonardo Carvalho", "leonardocarvalho@gmail.com"),
        array(
            new Product('Item Físico', 'physical')
        )
    ),
    array(
        new Customer("Flávio Oliveira", "flaviooliveira@gmail.com"),
        array(
            new Product('Mídia Digital', 'digital')
        )
    ),
    array(
        new Customer("Juliana Apolo", "julianaapolo@gmail.com"),
        array(
            new Product('Mídia Digital', 'digital'),
            new Product('Assinatura Digital', 'membership'),
            new Product('Livro', 'book'),
            new Product('Item Físico', 'physical')
        )
    )
);

foreach ($orders as $key => $order) {
    $order = new Order($orders[$key][0]);
    printf("<br>Customer: %s (%s)", $order->customer->name, $order->customer->email);
    foreach ($orders[$key][1] as $key => $product) {
        $order->addProduct($product);
        printf("<br>Product [%s]: %s (type: %s)", $key+1, $order->items[$key]->product->name, $order->items[$key]->product->type);
    }

    $attributes = array(
        'order' => $order,
        'paymentMethod' => CreditCard::fetchByHashed('43567890-987654367'),
    );
    $payment = new Payment($attributes);
    if ($payment->pay(time())) {
        if ($payment->isPaid()) {
            printf("<br>Paid at: %s<br>Actions:", date("d/m/Y H:i:s", $payment->paidAt));
        }
        $order->close(time());
    }
    print("<br>------------------<br>");
}
