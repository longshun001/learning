package com.ls.admin.service;

import com.baomidou.mybatisplus.service.IService;
import com.ls.admin.entity.Role;
import com.ls.admin.entity.User;


import java.util.Map;
import java.util.Set;

/**
 * <p>
 *  服务类
 * </p>
 *
 */
public interface UserService extends IService<User> {

	User findUserByLoginName(String name);

	User findUserById(Long id);

	User saveUser(User user);

	User updateUser(User user);

	void saveUserRoles(Long id, Set<Role> roleSet);

	void dropUserRolesByUserId(Long id);

	int userCount(String param);

	void deleteUser(User user);

	Map selectUserMenuCount();
}
