package com.algaworks.algafood.api.model.input;

import lombok.Getter;
import lombok.Setter;

import jakarta.validation.constraints.NotBlank;

@Setter
@Getter
public class CozinhaInput {

	@NotBlank
	private String nome;
	
}
