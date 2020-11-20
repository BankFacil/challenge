<?php
namespace Creditas\Classes;

use Creditas\Classes\CreditCard;

class CreditCard
{
    public static function fetchByHashed($code)
    {
        return new CreditCard();
    }
}
