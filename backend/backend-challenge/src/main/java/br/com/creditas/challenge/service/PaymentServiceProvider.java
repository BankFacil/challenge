package br.com.creditas.challenge.service;

import br.com.creditas.challenge.model.Payment;
import br.com.creditas.challenge.model.enums.PaymentStatus;

public class PaymentServiceProvider {

	public static PaymentStatus process(Payment payment) {
		// TODO logica para transa��o com cart�o de cr�dito
		return PaymentStatus.APPROVED;
	}
	
}
