package com.algaworks.algafood.api.model.input;

import lombok.Getter;
import lombok.Setter;

import jakarta.validation.constraints.NotNull;

@Setter
@Getter
public class CidadeIdInput {

	@NotNull
	private Long id;
	
}
