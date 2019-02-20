package com.cn.connodity.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.cn.connodity.dto.ProductDTO;
import com.cn.connodity.model.Product;
import com.cn.connodity.service.ProductService;
import com.cn.connodity.util.UpLoadUtil;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ProductAction extends ActionSupport implements ModelDriven {
	@Resource
	private ProductService productService;
	private ProductDTO productDTO = new ProductDTO();
	private Product product;
	private List<Product> productlist;
	private HttpServletRequest request;
	private HttpServletRequest response;
	private int page;
	private int maxpage;
	private Product updateproduct;
	private long productId;
	
	public Product getUpdateproduct() {
		return updateproduct;
	}
	public void setUpdateproduct(Product updateproduct) {
		this.updateproduct = updateproduct;
	}
	public long getProductId() {
		return productId;
	}
	public void setProductId(long productId) {
		this.productId = productId;
	}
	public List<Product> getProductlist(){
		return productlist;
	}
	public void setProductlist(List<Product>productlist) {
		this.productlist = productlist;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getMaxpage() {
		return maxpage;
	}
	public void setMaxpage(int maxpage) {
		this.maxpage = maxpage;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public String addProduct() {
		product = new Product();
		String imagepath = UpLoadUtil.upload(productDTO.getFile());
		System.out.println(imagepath);
		product.setImageSrc(imagepath);
		product.setName(productDTO.getName());
		System.out.println(productDTO.getName());
		product.setPrice(productDTO.getPrice());
		System.out.println(productDTO.getPrice());
		product.setDescription(productDTO.getDescription());
		productService.addProduct(product);
		return "success";
	}
	public String productlist() {
		this.request = ServletActionContext.getRequest();
		int maxpage = this.productService.maxSize();
		int pageNo = 1;
		int pageSize = 5;
		if(page > 0) {
			pageNo = page;
		}
		productlist = this.productService.getByPage(pageNo, pageSize);
		request.setAttribute("page", pageNo);
		request.setAttribute("maxpage", maxpage);
		return "list";
	}
	public String UpdateProduct() {
		updateproduct = this.productService.getProduct(productId);
		return "update";
	}
	public String saveProduct() {
		String imagepath = UpLoadUtil.upload(productDTO.getFile());
		updateproduct.setDescription(productDTO.getDescription());
		updateproduct.setImageSrc(imagepath);
		updateproduct.setName(productDTO.getName());
		updateproduct.setPrice(productDTO.getPrice());
		this.productService.UpdateProduct(updateproduct);
		return "save";
		
	}
	public String deleteProduct() {
		this.productService.deleteProduct(productId);
		return "delete";
	}
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return productDTO;
	}

}
