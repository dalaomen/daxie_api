package com.daxie.daxie_api.service.impl;

import com.daxie.daxie_api.dao.ForumUserMapper;
import com.daxie.daxie_api.model.ForumUser;
import com.daxie.daxie_api.service.ForumUserService;
import com.daxie.daxie_api.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019/01/18.
 */
@Service
@Transactional
public class ForumUserServiceImpl extends AbstractService<ForumUser> implements ForumUserService {
    @Resource
    private ForumUserMapper forumUserMapper;

}
