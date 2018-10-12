package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.google.gson.Gson;

import service.UserService;
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/toLogin")
	public String index(String name,String password,Model model,HttpSession session){
		User user = userService.findUser(name,password);
		if(user!=null){
			if(user.getState()!=1){
				session.setAttribute("user", user);
				if(user.getIdentity()==0){
					return "manager.jsp";
				}
				else if(user.getIdentity()==1){
					return "redirect:buyerIndex";
				}
				else{
					return "redirect:index";
				}
			}else{
					model.addAttribute("msg", "该用户已经被禁用");
					return "login.jsp";
				}
		}else{
				model.addAttribute("msg", "账号或者用户名错误");
				return "login.jsp";
			}
	}
	

	
	@RequestMapping(value="/login")
	public String login(String name,Model model){
		return "login.jsp";
	}
	
	@RequestMapping(value="/buyerIndex")
	public String buyerIndex(String name,Model model){
		return "buyerIndex.jsp";
	}

    @RequestMapping(value="/index")
    public String index(String name,Model model){
        return "index.jsp";
    }

	//退出登陆
	@RequestMapping(value="/exit")
	public String exit(HttpSession session){
		session.removeAttribute("user");
		return "login.jsp";
	}
	
	@RequestMapping(value="/test")
	public String test(HttpSession session){
		session.removeAttribute("user");
		return "test.jsp";
	}


	@RequestMapping(value="/search")
	@ResponseBody
	public String search(){
		List<YearTest> types = userService.findAll();
		Gson gson = new Gson();
		String jsonString = gson.toJson(types);
		return jsonString;
	}


	//跳转到注册页
	@RequestMapping(value = "/toRegisterPage")
	public String toRegisterPage(){
		return "register.jsp";
	}

	//查找所有地区
	@ResponseBody
	@RequestMapping(value = "/findArea")
	public String findArea(){
		List<Area> areas = userService.findArea();
		return new Gson().toJson(areas);
	}

	//注册
	@RequestMapping(value = "/register")
	public String register(User user){
		userService.register(user);
		return "registerSuccess.jsp";
	}

	//跳转到订单填写页
	@RequestMapping(value = "/writeOrder")
	public String writeOrder(String type,Model model,HttpSession session){

		User user = (User)session.getAttribute("user");
		if(user!=null){
			model.addAttribute("type",type);
			model.addAttribute("user",user);
			return "order.jsp";
		}else {
			return "/login.jsp";
		}

	}

	//提交订单
	@RequestMapping(value = "/saveOrder")
	public String saveOrder(Order order,HttpSession session){
		User user = (User)session.getAttribute("user");
		userService.findBuyer(order,user.getId());
		return "orderSuccess.jsp";
	}

	//订单
	@RequestMapping(value = "/order")
    public String order(){
        return "orderList.jsp";
    }

	//按照userid查找订单
	@ResponseBody
	@RequestMapping(value = "findOrderByUserId")
	public String findOrderByUserId(Integer id){
		List<Order> orders = userService.findOrderByUserId(id);
		return new Gson().toJson(orders);
	}

    @ResponseBody
    @RequestMapping(value = "findOrderByBuyer")
    public String findOrderByBuyer(Integer id,Integer state){
        List<Order> orders = userService.findOrderByIdAndState(id,state);
        return new Gson().toJson(orders);
    }



    //订单详情
    @RequestMapping(value = "findOrderDetailById")
    public String findOrderDetailById(Integer id,Model model){
        Order order = userService.findOrderById(id);
        model.addAttribute("order",order);
        return "orderDetail.jsp";
    }

    //订单详情
    @RequestMapping(value = "findOrderDetailById1")
    public String findOrderDetailById1(Integer id,Model model){
        Order order = userService.findOrderById(id);
        model.addAttribute("order",order);
        return "orderDetail1.jsp";
    }

    //完成订单finishOrder
    @RequestMapping(value = "finishOrder")
    public String finishOrder(Integer id){
       userService.finishOrder(id);
        return "redirect:buyerIndex";
    }

    @RequestMapping(value="/historyOrder")
    public String historyOrder(){
        return "historyOrder.jsp";
    }

    //增加Type

	@RequestMapping(value ="/saveload")
	public String saveload(){

		return "saveType.jsp";
	}

	@RequestMapping(value = "/saveType",method = RequestMethod.POST)
	public String saveType(@RequestParam("name") String name, @RequestParam("url") String url){
		Type type = new Type();
		type.setName(name);
		type.setUrl(url);
		userService.saveType(type);
		return "redirect:findAllType";
	}
    //删除Type
    @RequestMapping(value = "/deleteType")
    public String deleteType(Integer id,Model model){
		userService.deleteType(id);
		return "type_list.jsp";
	}


	@RequestMapping(value="/findAllType3")
	@ResponseBody
	public String index3(){
		List<Type> types = userService.findAllType();
		Gson gson = new Gson();
		String jsonString = gson.toJson(types);
		return jsonString;
	}


	@RequestMapping(value = "/findAllType")
	public String findAllType(){
		return "type_list.jsp";
	}

	@RequestMapping(value="/findAllType1")
	@ResponseBody
	public String index(){
		List<Type> types = userService.findAllType();
		Gson gson = new Gson();
		String jsonString = gson.toJson(types);
		return jsonString;
	}

	@RequestMapping(value = "/showType")
	public String showType(Integer id,Model model){
        Type type=userService.findTypeById(id);
        model.addAttribute("type",type);
		return "showType.jsp";
	}

	@ResponseBody
	@RequestMapping(value = "/updateTypeById")
	public String updateTypeById(Type type){
		userService.updateTypeById(type);

		return "redirect:findAllType";
	}

	@RequestMapping(value = "/saveuserload")
	public String saveuserload(){
		return "saveUser.jsp";
	}

	@RequestMapping(value = "/saveUser")
	public String saveUser(User user){
		userService.saveUser(user);
		return "user_list.jsp";
	}

	@RequestMapping("/loginManager")
	public String loginManager(){
		return "manager.jsp";
	}


	@RequestMapping(value = "/findUserList")
	//查询用户列表
	public String findUserList(){

		return "user_list.jsp";
	}

	@ResponseBody
	@RequestMapping(value = "/findUserList1")
	//查询用户列表
	public String findUserList1(){

		List<User> userlist=userService.findUserList();
		return new Gson().toJson(userlist);
	}

	//删除用户，就是把状态变为1
	@RequestMapping(value = "/deleteUser")
	public String deleteUser(Integer id){
		userService.changeUserState(id,1);
		return "user_list.jsp";
	}

	@RequestMapping(value = "/showUser")
	public String showUser(Integer id,Model model){
		User user=userService.findUserById(id);
		model.addAttribute("user",user);
		return "showUser.jsp";
	}

	@RequestMapping(value = "/returnManager")
	public String returnManager(){
		return "manager.jsp";
	}




}
