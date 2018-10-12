package dao;

import java.util.HashMap;
import java.util.List;

import entity.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {

	User findUser(HashMap<String, String> map);

	List<YearTest> findAll();

	//查找所有地区
    List<Area> findArea();

    //注册
	void saveUser(User user);

	//保存订单
	void saveOrder(Order order);



	//根据状态查找用户
	List<User> findUserList();

	//按照id查找user
	User  findUserById(int id);

	//更改用户状态
	void changeUserState(@Param("id") int id,@Param("state") int state);

	//查询废品种类
	List<Type> listType();

	//根据id查询类型
	Type findTypeById(Integer id);

	//增加废品种类
	void saveType(Type type);

	//删除废品种类
	void deleteType(Integer id);

	//更新废品的种类
	void updateTypeById(Type type);

	//根据地区查找收废品人员
	List<User> findUserByAreaAndIdentity(Order order);

	//查找当天订单数量
	int findOrderNum(HashMap<String,Object> map);

	//根据用户查找订单
	List<Order> findOrderBySeller(int id);

	//根据收购员查找订单
	List<Order> findOrderByBuyer(@Param("id") Integer id,@Param("state")Integer state);

	//根据id查找订单
	Order findOrderById(Integer id);


	void changeOrderState(Integer id);

	Area findAreaById(Integer id);
}
