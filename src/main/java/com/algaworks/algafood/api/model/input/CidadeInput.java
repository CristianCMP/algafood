package com.algaworks.algafood.api.model.input;

import lombok.Getter;
import lombok.Setter;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Setter
@Getter
public class CidadeInput {

	@NotBlank
	private String nome;
	
	@Valid
	@NotNull
	private EstadoIdInput estado;
	
}
