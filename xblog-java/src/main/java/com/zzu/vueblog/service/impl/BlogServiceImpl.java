package com.zzu.vueblog.service.impl;

import com.zzu.vueblog.entity.Blog;
import com.zzu.vueblog.mapper.BlogMapper;
import com.zzu.vueblog.service.BlogService;
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
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements BlogService {

}
