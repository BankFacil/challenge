<?php
declare(strict_types=1);

use PHPUnit\Framework\TestCase;
use Creditas\Classes\Customer;
use Creditas\Classes\Order;
use Creditas\Classes\Payment;
use Creditas\Classes\CreditCard;

final class PaymentTest extends TestCase
{
    public function testPay()
    {
        $customer = new Customer("Juliana Apolo", "julianaapolo@gmail.com");
        $order = new Order($customer);
        $attributes = array(
            'order' => $order,
            'paymentMethod' => CreditCard::fetchByHashed('43567890-987654367'),
        );
        $payment = new Payment($attributes);
        $this->assertTrue($payment->pay(time()));
        return $payment;
    }

    /**
     * @depends testPay
     */
    public function testIsPaid($payment)
    {
        $this->assertTrue($payment->isPaid());
    }
}
