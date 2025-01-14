package com.algaworks.algafood.api.model.input;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import jakarta.validation.constraints.NotBlank;

@Setter
@Getter
public class CozinhaInput {

	@ApiModelProperty(example = "Brasileira", required = true)
	@NotBlank
	private String nome;
	
}
