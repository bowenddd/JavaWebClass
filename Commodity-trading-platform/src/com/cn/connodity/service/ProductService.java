package com.cn.connodity.service;

import java.util.List;
import java.util.Map;

import com.cn.connodity.model.Product;

public interface ProductService {
	public Product getProduct(long productId);
	public List<Product>getAllProduct();
	public void addProduct(Product product);
	public void deleteProduct(long productId);
	public void UpdateProduct(Product product);
	
	public List<Product>getByPage(int pageNo,int pageSize);
	public int maxSize();
	
	public List<Product> find(Map<String,String>keymap,int pageNo,int pageSize);
	
	public int findNum(Map<String,String>keymap);
	
}
