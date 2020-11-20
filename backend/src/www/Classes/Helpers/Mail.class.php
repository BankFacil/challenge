<?php
namespace Creditas\Classes\Helpers;

class Mail
{
    public $msg;
    public $to;

    public function __construct($msg, $to)
    {
        $this->msg = $msg;
        $this->to = $to;
    }

    public function sendEmail()
    {
        return true;
    }
}
