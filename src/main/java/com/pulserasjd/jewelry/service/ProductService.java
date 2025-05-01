package com.pulserasjd.jewelry.service;

import com.pulserasjd.jewelry.Product;
import com.pulserasjd.jewelry.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;

    public List<Product> saveAll(List<Product> products) {
        return this.productRepository.saveAll(products);
    }

    public Page<Product> findAllProducts(int page, int size) {
        PageRequest pageRequest = PageRequest.of(page, size);
        return this.productRepository.findAll(pageRequest);
    }

}
