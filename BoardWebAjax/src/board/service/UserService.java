package board.service;

import board.dto.UserDto;

public interface UserService {
	int userRegister(UserDto userDto);
	int userLogin(String username, String password);
}
