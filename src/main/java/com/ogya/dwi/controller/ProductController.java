package com.ogya.dwi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ogya.dwi.domain.Product;
import com.ogya.dwi.repository.ProductRepository;

import javax.validation.Valid;

@Controller
public class ProductController {
    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/list-product")
    public String main(@RequestParam(required = false, defaultValue = "") String search,
                       Model model,
                       @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ) {
        Page<Product> products;

        if (search != null && !search.isEmpty()) {
        	System.out.print("search: " + search);
            products = productRepository.findByName(search, pageable);
            System.out.print("products: " + products);
        } else {
            products = productRepository.findAll(pageable);
        }
        
        model.addAttribute("active", "prod");
        model.addAttribute("products", products);
        model.addAttribute("search", search);

        return "product/list-product";
    }


    @GetMapping("/add-product")
    public String showSignUpForm(Product product) {
        return "product/add-product";
    }

    @PostMapping("/addproduct")
    public String addProduct(@Valid Product product, BindingResult result, Model model, Pageable pageable) {
        if (result.hasErrors()) {
            return "product/add-product";
        }

        productRepository.save(product);
        model.addAttribute("products", productRepository.findAll(pageable));
        return "redirect:/list-product";

    }

    // additional CRUD methods
    @GetMapping("/edit-product/{id}")
    public String showUpdateForm(@PathVariable("id") long id, Model model) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));

        model.addAttribute("product", product);
        return "product/update-product";
    }

    @PostMapping("/update-product/{id}")
    public String updateUser(@PathVariable("id") long id, @Valid Product product,
                             BindingResult result, Model model, Pageable pageable) {
        if (result.hasErrors()) {
            product.setId(id);
            return "product/update-product";
        }

        productRepository.save(product);
        model.addAttribute("products", productRepository.findAll(pageable));
        return "redirect:/list-product";
    }

    @GetMapping("/delete-product/{id}")
    public String deleteUser(@PathVariable("id") long id, Model model, Pageable pageable) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
        productRepository.delete(product);
        model.addAttribute("products", productRepository.findAll(pageable));
        return "redirect:/list-product";
    }

    @GetMapping("/filter-product")
    public String filterProducts(@RequestParam(value = "filter", required = false, defaultValue = "") String filterNeeded,
                            Model model,
                            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ) {
        Page<Product> products;

        if (filterNeeded.equals("")) {
            products = productRepository.findAll(pageable);
        } else if (filterNeeded.equals("true")) {
            products = productRepository.findByAvailable(true, pageable);
        } else {
            products = productRepository.findByAvailable(false, pageable);
        }

        model.addAttribute("active", "prod");
        model.addAttribute("products", products);
        model.addAttribute("filterNeeded", filterNeeded);

        return "product/list-product";
    }
}
