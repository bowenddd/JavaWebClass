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
	//���ﳵ�����Ʒ
	public void addItem (Product product , int number) {
		if(items.containsKey(product.getId())) {
			return;
		}
		Item item = new Item (number,product);
		items.put(product.getId(), item);
	}
	//�޸�����
	public void changeItemNumber(long productId,int number) {
		Item item = items.get(productId);
		item.setNumber(number);
	}
	//ɾ����Ʒ
	public void deleteItem(long productId) {
		items.remove(productId);
	}
	//ɾ�������Ʒ
	public void deleteItems(Long[]productIds) {
		for(Long id : productIds) {
			items.remove(id);
		}
	}
	//��չ��ﳵ
	public void clearCart() {
		items.clear();
	}
	//���������Ŀ
	public Map<Long,Item>getCartItems(){
		return items;
	}
	//��Ʒ����
	public int getItemNumber() {
		return items.size();
	}
	//�жϹ��ﳵ�Ƿ�Ϊ��
	public boolean isEmpty() {
		return items.isEmpty();
	}
	//�ܼ�
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
