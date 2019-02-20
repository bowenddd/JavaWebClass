package com.cn.connodity.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.cn.connodity.common.Constants;
import com.cn.connodity.dao.BaseDAO;
import com.cn.connodity.model.Cart;
import com.cn.connodity.model.Order;
import com.cn.connodity.model.User;
import com.cn.connodity.service.OrderService;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport {
	@Resource
	private OrderService orderService;
	public OrderService getOrderService(){
		return orderService;
	}
	public void setOrderService(OrderService orderServic) {
		this.orderService = orderService;
	}
	private HttpServletRequest request;
	private HttpSession session;
	public String index() {
		String ret = "";
		this.request = ServletActionContext.getRequest();
		this.session = this.request.getSession();
		User user = (User) this.session.getAttribute(Constants.SESSION_USER);
		if(user == null) {
			ret = "login";
		}
		else {
			ret = "order";
		}
		return ret;	
	}
	public String postOrder() {
		this.request = ServletActionContext.getRequest();
		this.session = this.request.getSession();
		User user = (User) this.session.getAttribute(Constants.SESSION_USER);
		Cart cart = (Cart) this.session.getAttribute(Constants.SESSION_CART);
		Order order = new Order();
		order.setUser(user);
		order.setItems(cart.getItems());
		order.setStatus(Constants.ORDER_STATUS_POST);
		String orderNum = orderService.generateOrder(order);	
		System.out.println(orderNum);
		this.request.setAttribute(Constants.REQ_ORDER_NUMBER, orderNum);
		return "success";
	}
}
