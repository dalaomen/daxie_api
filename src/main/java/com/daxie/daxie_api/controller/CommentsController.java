package com.daxie.daxie_api.controller;
import com.daxie.daxie_api.core.Result;
import com.daxie.daxie_api.core.ResultGenerator;
import com.daxie.daxie_api.core.UUIDS;
import com.daxie.daxie_api.model.Comments;
import com.daxie.daxie_api.service.CommentsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import tk.mybatis.mapper.entity.Condition;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by 代码生成器 on 2019/01/21.
*/
@RestController
@RequestMapping("/comments")
public class CommentsController {
    @Resource
    private CommentsService commentsService;

    @PostMapping("/add")
    public Result add(Comments comments) {
        comments.setCreatetime(UUIDS.getDateTime());
        commentsService.save(comments);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/getCommentList")
    public Result getCommentList(String forid) {
        Condition condition = new Condition(Comments.class);
        condition.createCriteria().andCondition("forid ="+forid);
        condition.setOrderByClause("createtime desc");
        List<Comments> list=commentsService.findByCondition(condition);
        return ResultGenerator.genSuccessResult(list);
    }

    @PostMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        commentsService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/update")
    public Result update(Comments comments) {
        commentsService.update(comments);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/detail")
    public Result detail(@RequestParam Integer id) {
        Comments comments = commentsService.findById(id);
        return ResultGenerator.genSuccessResult(comments);
    }

    @PostMapping("/list")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<Comments> list = commentsService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
