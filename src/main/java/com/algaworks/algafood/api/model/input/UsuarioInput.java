package com.algaworks.algafood.api.model.input;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

@Setter
@Getter
public class UsuarioInput {

	@ApiModelProperty(example = "João da Silva", required = true)
	@NotBlank
	private String nome;

	@ApiModelProperty(example = "joao.ger@algafood.com.br", required = true)
	@NotBlank
	@Email
	private String email;

}
