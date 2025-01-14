package com.algaworks.algafood.api.model.input;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import java.math.BigDecimal;

@Setter
@Getter
public class RestauranteInput {

	@ApiModelProperty(example = "Thai Gourmet", required = true)
	@NotBlank
	private String nome;

	@ApiModelProperty(example = "12.00", required = true)
	@NotNull
	@PositiveOrZero
	private BigDecimal taxaFrete;

	@Valid
	@NotNull
	private CozinhaIdInput cozinha;
	
	@Valid
	@NotNull
	private EnderecoInput endereco;
	
}
