package com.zzu.vueblog.controller;

import cn.hutool.core.map.MapUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.zzu.vueblog.common.dto.LoginDto;
import com.zzu.vueblog.common.dto.RegisterInfo;
import com.zzu.vueblog.common.lang.Result;
import com.zzu.vueblog.entity.User;
import com.zzu.vueblog.service.UserService;
import com.zzu.vueblog.util.JWTUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@RestController
public class AccountController {

    @Autowired
    UserService userService;

    @Autowired
    JWTUtils jwtUtils;

    @PostMapping("/login")
    public Result login(@Validated @RequestBody LoginDto loginDto, HttpServletResponse response){
        User user = userService.getOne(new QueryWrapper<User>().eq("username",loginDto.getUsername()));
        Assert.notNull(user,"用户不存在");
        if(!user.getPassword().equals(SecureUtil.md5(loginDto.getPassword()))) {
            return Result.fail("密码不正确");
        }
        userService.update(new UpdateWrapper<User>().set("last_login",LocalDateTime.now()));
        String jwt = jwtUtils.generateToken(user.getId());
        response.setHeader("Authentication",jwt);
        response.setHeader("Access-control-Expose-Headers","Authentication");
        return Result.succ(MapUtil.builder()
                .put("id",user.getId())
                .put("username",user.getUsername())
                .put("email",user.getEmail())
                .map());
    }

    @PostMapping("/register")
    public Result register(@Validated @RequestBody RegisterInfo registerInfo) {
        if(!registerInfo.getPassword().equals(registerInfo.getConfirmPassword())) {
            return Result.fail("两次输入密码不一致");
        }
        User user = new User();
        user.setUsername(registerInfo.getUsername());
        user.setPassword(SecureUtil.md5(registerInfo.getPassword()));
        user.setEmail(registerInfo.getEmail());
        user.setCreated(LocalDateTime.now());
        userService.saveOrUpdate(user);
        return Result.succ(MapUtil.builder()
                .put("id",user.getId())
                .put("username",user.getUsername())
                .put("email",user.getEmail())
                .map());
    }

    @RequiresAuthentication
    @GetMapping("/logout")
    public Result logout(){
        SecurityUtils.getSubject().logout();
        return Result.succ(null);
    }
}
