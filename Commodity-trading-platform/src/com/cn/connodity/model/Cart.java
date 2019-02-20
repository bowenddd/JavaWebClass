package com.cn.connodity.model;

import java.util.HashMap;
import java.util.Map;





public class Cart {
	
	private Map<Long,Item> items = new HashMap<Long,Item>();
	public Map<Long,Item>getItems(){
		return items;
	}
	public void setItems(Map<Long,Item>items) {
		this.items = items;
	}
	//向购物车添加商品
	public void addItem (Product product , int number) {
		if(items.containsKey(product.getId())) {
			return;
		}
		Item item = new Item (number,product);
		items.put(product.getId(), item);
	}
	//修改数量
	public void changeItemNumber(long productId,int number) {
		Item item = items.get(productId);
		item.setNumber(number);
	}
	//删除商品
	public void deleteItem(long productId) {
		items.remove(productId);
	}
	//删除多个商品
	public void deleteItems(Long[]productIds) {
		for(Long id : productIds) {
			items.remove(id);
		}
	}
	//清空购物车
	public void clearCart() {
		items.clear();
	}
	//获得所有项目
	public Map<Long,Item>getCartItems(){
		return items;
	}
	//商品数量
	public int getItemNumber() {
		return items.size();
	}
	//判断购物车是否为空
	public boolean isEmpty() {
		return items.isEmpty();
	}
	//总价
	public Double getPrice() {
		double sum = 0;
		for(Long id : items.keySet()) {
			Item item = items.get(id);
			sum += item.getCost();
		}
		return sum;
		//0
	}
}
