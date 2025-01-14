package com.algaworks.algafood.api.model.input;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import jakarta.validation.constraints.NotBlank;

@Setter
@Getter
public class UsuarioComSenhaInput extends UsuarioInput {

	@ApiModelProperty(example = "123", required = true)
	@NotBlank
	private String senha;
	
}
