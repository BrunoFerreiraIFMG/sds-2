package com.ifmg.bruno.bfdeliver.controllers;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.jaxb.SpringDataJaxb.OrderDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.ifmg.bruno.bfdeliver.dto.OrderDTO;
import com.ifmg.bruno.bfdeliver.dto.ProductDTO;
import com.ifmg.bruno.bfdeliver.services.OrderService;
import com.ifmg.bruno.bfdeliver.services.ProductService;

@RestController
@RequestMapping(value = "/orders")
public class OrderController {

	@Autowired
	private OrderService service;
	
	
	@GetMapping
	public ResponseEntity<List<OrderDTO>> findAll(){
		List<OrderDTO> list = service.findAll();
		return ResponseEntity.ok().body(list);
	}
	
	@PostMapping
	public ResponseEntity<OrderDTO> insert(@RequestBody OrderDTO dto){
		dto = service.insert(dto);
		
		//objeto usado para retornar o código 201 (created) e a url de acesso
		// ao objeto recém criado.
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
				              .path("/{id}")
				              .buildAndExpand(dto.getId())
				              .toUri();
		
		return ResponseEntity.created(uri).body(dto);
	}
	
	
	@PutMapping("/{id}/delivered")
	public ResponseEntity<OrderDTO> setDelivered(@PathVariable Long id){
		OrderDTO dto = service.setDelivered(id);
		return ResponseEntity.ok().body(dto);
	}	
	
}
