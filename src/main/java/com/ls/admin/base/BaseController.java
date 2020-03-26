package com.ls.admin.base;


//import com.mysiteforme.admin.service.*;
import com.ls.admin.realm.AuthRealm;
import com.ls.admin.service.LogService;
import com.ls.admin.service.MenuService;
import com.ls.admin.service.RoleService;
import com.ls.admin.service.UserService;
import com.ls.admin.entity.User;
import com.ls.admin.service.*;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseController {
	
	public User getCurrentUser() {
		AuthRealm.ShiroUser shiroUser = (AuthRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
		if(shiroUser == null) {
			return null;
		}
		User loginUser = userService.selectById(shiroUser.getId());
		return loginUser;
	}

	@Autowired
	protected UserService userService;

	@Autowired
	protected MenuService menuService;

	@Autowired
	protected RoleService roleService;

	@Autowired
	protected LogService logService;

}
