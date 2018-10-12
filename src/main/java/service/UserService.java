package service;

import java.util.*;

import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.TypeDao;
import dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private TypeDao typeDao;

	public User findUser(String name, String password) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("password", password);
		User user = userDao.findUser(map);
		return user;

	}



	public List<YearTest> findAll() {
		List<YearTest> years = userDao.findAll();
		return years;
	}

	public List<Area> findArea() {
		List<Area> areas = userDao.findArea();
		return areas;
	}

	public void register(User user) {
		userDao.saveUser(user);
	}


	//分配订单
	public void findBuyer(Order order, int sellerId) {

		List<User> users = userDao.findUserByAreaAndIdentity(order);
		LinkedList<HashMap<String, Object>> list = new LinkedList<>();
		if (users.size() > 0) {
			for (User user : users) {
				HashMap<String, Object> map = new HashMap<>();
				map.put("id", user.getId());
				map.put("time", order.getTime());
				int num = userDao.findOrderNum(map);
				map.put("num", num);
				list.add(map);
			}
		} else {
			throw new RuntimeException("该地区没有废品收购员");
		}

		//查找最小订单数的用户
		HashMap<String, Object> minMap = new HashMap<>();
		minMap.put("num", 999999);//给个默认值
		for (HashMap<String, Object> map : list) {
			if ((int) map.get("num") < (int) minMap.get("num")) {
				minMap = map;
			}
		}

		//补充订单信息
		order.setNo(UUID.randomUUID().toString());
		order.setState(0);
		order.setSeller(sellerId);
		//更新订单
		order.setBuyer((int) minMap.get("id"));
		userDao.saveOrder(order);
	}

	//查找用户订单
	public List<Order> findOrderByUserId(Integer id) {
		List<Order> orders = userDao.findOrderBySeller(id);
		return orders;
	}

	//根据buyer查找订单
	public List<Order> findOrderByIdAndState(Integer id, Integer state) {


		List<Order> orders = userDao.findOrderByBuyer(id, state);
		return orders;
	}

	public Order findOrderById(Integer id) {
		Order order = userDao.findOrderById(id);
		//查找user
		User user = userDao.findUserById(order.getSeller());
		order.setSellerName(user.getName());
		order.setTel(user.getTel());
		//查找area
		Area area = userDao.findAreaById(Integer.valueOf(order.getArea()));
		order.setAreaName(area.getArea());
		return order;
	}

	public void finishOrder(Integer id) {
		userDao.changeOrderState(id);
	}

	//增加Type
	public void saveType(Type type){
		userDao.saveType(type);
	}


	//删除Type
	public void deleteType(int id) {
		userDao.deleteType(id);
	}

	public User findUserById(int id){
		return userDao.findUserById(id);
	}
	//查询Type
	public List<Type> findAllType(){
		return userDao.listType();
	}

	//根据id查询类型
	public Type findTypeById(int id){
		return userDao.findTypeById(id);
	}

	//更新类型
	public void updateTypeById(Type type){
		userDao.updateTypeById(type);
	}
	//查询所有的用户
	public List<User> findUserList(){
		return userDao.findUserList();
	}

	//添加用户
	public void saveUser(User user){
		userDao.saveUser(user);
	}

	//更改用户的状态
	public void changeUserState(Integer id,Integer state){
		userDao.changeUserState(id,state);
	}



}