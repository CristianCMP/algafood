package com.algaworks.algafood.api.model.input;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Setter
@Getter
public class CidadeInput {

	@ApiModelProperty(example = "Uberlândia", required = true)
	@NotBlank
	private String nome;

	@Valid
	@NotNull
	private EstadoIdInput estado;

}
