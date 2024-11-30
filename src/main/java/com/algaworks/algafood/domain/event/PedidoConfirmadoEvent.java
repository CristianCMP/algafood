package com.algaworks.algafood.domain.event;

import com.algaworks.algafood.domain.entity.Pedido;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PedidoConfirmadoEvent {

	private Pedido pedido;
	
}
