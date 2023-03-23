package board.service;

import board.dao.UserDao;
import board.dao.UserDaoImpl;
import board.dto.UserDto;

public class UserServiceImpl implements UserService {
	private static UserServiceImpl instance = new UserServiceImpl();
	
	private UserServiceImpl() {}
	
	public static UserServiceImpl getInstance() {
		return instance;
	}

	UserDao userDao = UserDaoImpl.getInstance();
	
	@Override
	public int userRegister(UserDto userDto) {
	
		return userDao.userRegister(userDto);
	}
	
	@Override
	public int userLogin(String userName, String password) {
	
		return userDao.userLogin(userName, password);
	}
	
}
