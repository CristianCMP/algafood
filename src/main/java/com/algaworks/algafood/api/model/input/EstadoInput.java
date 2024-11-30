package com.algaworks.algafood.api.model.input;

import lombok.Getter;
import lombok.Setter;

import jakarta.validation.constraints.NotBlank;

@Setter
@Getter
public class EstadoInput {

	@NotBlank
	private String nome;
	
}
