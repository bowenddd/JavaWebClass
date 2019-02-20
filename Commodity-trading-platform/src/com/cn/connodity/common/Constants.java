package com.cn.connodity.common;

public class Constants {
	public static final int ORDER_STATUS_POST = 1; //�������ύ
	public static final int ORDER_STATUS_SEND = 2; //��Ʒ�ѷ���
	public static final int ORDER_STATUS_RECEIVE = 3; //�û��Ѿ��ջ�
	public static final int ORDER_STATUS_END = 4; // ���������
	
	public static final String SESSION_CART = "cart";//������session �еĹ��ﳵ
	public static final String SESSION_USER = "user";//������session �е��û�
	
	public static final String REQ_PRODUCTS = "products";//�������������Ʒ
	public static final String REQ_ORDER_NUMBER = "orderNum";//����������ж�����
	public static final String REQ_ORDERS = "orders";//����������ж���
	
	public static String OrderStatus(int status) {
		String text = null;
		switch(status) {
		case Constants.ORDER_STATUS_POST:
			text = "�������ύ";
			break;
		case Constants.ORDER_STATUS_SEND:
			text = "��Ʒ�ѷ���";
			break;
		case Constants.ORDER_STATUS_RECEIVE:
			text = "�û����ջ�";
			break;
		case Constants.ORDER_STATUS_END:
			text = "���������";
			break;
		default:
			break;
		}
		return text;
	}
}
