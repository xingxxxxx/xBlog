package com.zzu.vueblog.service.impl;

import com.zzu.vueblog.entity.User;
import com.zzu.vueblog.mapper.UserMapper;
import com.zzu.vueblog.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author XingJingYe
 * @since 2021-08-03
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

}
