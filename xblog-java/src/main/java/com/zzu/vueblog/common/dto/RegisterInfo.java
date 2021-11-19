package com.zzu.vueblog.common.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class RegisterInfo implements Serializable {
    String username;
    String email;
    String password;
    String confirmPassword;
}
