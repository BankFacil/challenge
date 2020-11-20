<?php
namespace Creditas\Classes\OrderItemProductType;

use Creditas\Classes\OrderItem;
use Creditas\Classes\Subscription;
use Creditas\Classes\Helpers\Mail;

class Membership extends OrderItem
{
    public function close()
    {
        parent::close();
        $subscription = new Subscription();
        $msg = 'Dados da sua assinatura...';
        $email = $this->order->customer->email;
        $mailHelper = new Mail($msg, $email);
        if ($subscription->activate() && $mailHelper->sendEmail()) {
            printf('<br>Um e-mail com a mensagem \'%s\' foi enviado para \'%s\'', $msg, $email);
        }
    }
}
