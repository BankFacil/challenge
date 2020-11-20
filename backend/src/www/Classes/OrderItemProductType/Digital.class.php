<?php
namespace Creditas\Classes\OrderItemProductType;

use Creditas\Classes\OrderItem;
use Creditas\Classes\Voucher;
use Creditas\Classes\Helpers\Mail;

class Digital extends OrderItem
{
    public function close()
    {
        parent::close();

        $voucher = new Voucher($this->order->customer);
        $voucher->generate();
        printf("<br>Voucher gerado: ".$voucher->voucher);
        
        $msg = sprintf('Detalhes da sua compra e voucher \'%s\'...', $voucher->voucher);
        $email = $this->order->customer->email;
        $mailHelper = new Mail($msg, $email);
        if ($mailHelper->sendEmail()) {
            printf('<br>Um e-mail com a mensagem \'%s\' foi enviado para \'%s\'', $msg, $email);
        }
    }
}
