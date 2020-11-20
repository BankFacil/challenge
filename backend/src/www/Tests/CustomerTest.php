<?php
declare(strict_types=1);

use PHPUnit\Framework\TestCase;
use Creditas\Classes\Customer;

final class CustomerTest extends TestCase
{
    public function testCustomerAttributes()
    {
        $customer = new Customer('Juliana Apolo', 'julianaapolo@gmail.com');
        $this->assertEquals('Juliana Apolo', $customer->name);
        $this->assertEquals('julianaapolo@gmail.com', $customer->email);
    }
}
