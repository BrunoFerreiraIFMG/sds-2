package com.ifmg.bruno.bfdeliver.services;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ifmg.bruno.bfdeliver.dto.ProductDTO;
import com.ifmg.bruno.bfdeliver.entities.Product;
import com.ifmg.bruno.bfdeliver.repositories.ProductRepository;

@Service
public class ProductService {

	@Autowired
	private ProductRepository repository;
	
	@Transactional(readOnly = true)
	public List<ProductDTO> findAll(){
		//List<Product> list = repository.findAll();
		List<Product> list = repository.findAllByOrderByNameAsc();
		return list.stream().map(x -> new ProductDTO(x))
				 .collect(Collectors.toList());
		
	}
}
