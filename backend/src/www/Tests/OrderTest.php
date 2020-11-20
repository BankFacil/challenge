<?php
declare(strict_types=1);

use PHPUnit\Framework\TestCase;
use Creditas\Classes\Order;
use Creditas\Classes\Customer;
use Creditas\Classes\Product;

final class OrderTest extends TestCase
{
    public function testAddProduct()
    {
        $customer = new Customer("Juliana Apolo", "julianaapolo@gmail.com");
        $product = new Product("Livro", "book");
        $order = new Order($customer);
        $order->addProduct($product);
        $this->assertEquals('Livro', $order->items[0]->product->name);
        $this->assertEquals('book', $order->items[0]->product->type);
        return $order;
    }

    /**
     * @depends testAddProduct
     */
    public function testAddSecondProduct(Order $order)
    {
        $product = new Product("Assinatura Digital", "membership");
        $order->addProduct($product);

        $this->assertEquals(2, count($order->items));
        $this->assertEquals('Assinatura Digital', $order->items[1]->product->name);
        $this->assertEquals('membership', $order->items[1]->product->type);
    }

    /**
     * @depends testAddProduct
     */
    public function testTotalAmount(Order $order)
    {
        $this->assertEquals(20, $order->totalAmount());
    }

    /**
     * @depends testAddProduct
     */
    public function testClose(Order $order)
    {
        $time = time();
        $order->close($time);
        $this->assertEquals($time, $order->closedAt);
        $this->expectOutputString('<br>Shipping label: Juliana Apolo 45678-979 Item isento de impostos conforme disposto na Constituição Art. 150, VI, d.<br>Um e-mail com a mensagem \'Dados da sua assinatura...\' foi enviado para \'julianaapolo@gmail.com\'');
    }
}
