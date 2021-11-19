package com.zzu.vueblog.shiro;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zzu.vueblog.entity.User;
import com.zzu.vueblog.service.UserService;
import com.zzu.vueblog.util.JWTUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AccountRealm extends AuthorizingRealm {

    @Autowired
    JWTUtils jwtUtils;

    @Autowired
    UserService userService;

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JwtToken;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken Token) throws AuthenticationException {
        JwtToken jwtToken = (JwtToken)Token;
        String userId = jwtUtils.getClaimByToken(jwtToken.getPrincipal().toString()).getSubject();
        User user = userService.getById(Long.valueOf(userId));
        AccountProfile profile = new AccountProfile();
        BeanUtil.copyProperties(user,profile);
        return new SimpleAuthenticationInfo(profile,jwtToken.getCredentials(),this.getName());
    }
}
