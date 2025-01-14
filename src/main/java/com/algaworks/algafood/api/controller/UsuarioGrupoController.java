package com.algaworks.algafood.api.controller;

import com.algaworks.algafood.api.assembler.GrupoModelAssembler;
import com.algaworks.algafood.api.model.GrupoModel;
import com.algaworks.algafood.api.openapi.controller.UsuarioGrupoControllerOpenApi;
import com.algaworks.algafood.domain.entity.Usuario;
import com.algaworks.algafood.domain.service.CadastroUsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/usuarios/{usuarioId}/grupos")
public class UsuarioGrupoController implements UsuarioGrupoControllerOpenApi {

	@Autowired
	private CadastroUsuarioService cadastroUsuario;
	
	@Autowired
	private GrupoModelAssembler grupoModelAssembler;
	
	@GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	public List<GrupoModel> listar(@PathVariable Long usuarioId) {
		Usuario usuario = cadastroUsuario.buscarOuFalhar(usuarioId);
		
		return grupoModelAssembler.toCollectionModel(usuario.getGrupos());
	}
	
	@DeleteMapping(path = "/{grupoId}",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void desassociar(@PathVariable Long usuarioId, @PathVariable Long grupoId) {
		cadastroUsuario.desassociarGrupo(usuarioId, grupoId);
	}
	
	@PutMapping(path = "/{grupoId}",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void associar(@PathVariable Long usuarioId, @PathVariable Long grupoId) {
		cadastroUsuario.associarGrupo(usuarioId, grupoId);
	}

}
