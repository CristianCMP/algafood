package com.algaworks.algafood.api.model.input;

import lombok.Getter;
import lombok.Setter;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Setter
@Getter
public class EnderecoInput {

	@NotBlank
	private String cep;
	
	@NotBlank
	private String logradouro;
	
	@NotBlank
	private String numero;
	
	private String complemento;
	
	@NotBlank
	private String bairro;
	
	@Valid
	@NotNull
	private CidadeIdInput cidade;
	
}
