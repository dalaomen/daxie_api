package com.daxie.daxie_api.controller;
import com.daxie.daxie_api.core.Code;
import com.daxie.daxie_api.core.Result;
import com.daxie.daxie_api.core.ResultGenerator;
import com.daxie.daxie_api.core.UUIDS;
import com.daxie.daxie_api.model.ForumUser;
import com.daxie.daxie_api.service.ForumUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Properties;

/**
* Created by CodeGenerator on 2019/01/18.
*/
@RestController
@RequestMapping("/forum/user")
public class ForumUserController {
    @Resource
    private ForumUserService forumUserService;
    @Autowired
    private JavaMailSender jms;

    @PostMapping("/register")
    public Result register(ForumUser forumUser) {
        System.out.println(UUIDS.getDateUUID());
        System.out.println(UUIDS.getDateTime());
        forumUser.setUserid(UUIDS.getDateUUID());
        forumUser.setCreatedate(UUIDS.getDateTime());
        int code= Code.getCode();
        MimeMessage mMessage=jms.createMimeMessage();//创建邮件对象
        MimeMessageHelper mMessageHelper;
        Properties prop = new Properties();
        String from;
        try{
            //从配置文件中拿到发件人邮箱地址
            prop.load(this.getClass().getResourceAsStream("/mail.properties"));
            from = prop.get("mail.smtp.username")+"";
            mMessageHelper=new MimeMessageHelper(mMessage,true);
            mMessageHelper.setFrom(from);//发件人邮箱
            mMessageHelper.setTo(forumUser.getEmail());//收件人邮箱
            mMessageHelper.setSubject("用户验证码");//邮件的主题
            mMessageHelper.setText("<p style=\"font-size: 20px;font-weight: bold\">验证码为：" +code+"</p>",true);//邮件的文本内容，true表示文本以html格式打开
            jms.send(mMessage);//发送邮件
        } catch (Exception e) {
            e.printStackTrace();
        }
        forumUserService.save(forumUser);
        return ResultGenerator.genSuccessResult(code);
    }
    @PostMapping("/add")
    public Result add(ForumUser forumUser) {
        UUIDS.getDateUUID();
        int code= Code.getCode();
        MimeMessage mMessage=jms.createMimeMessage();//创建邮件对象
        MimeMessageHelper mMessageHelper;
        Properties prop = new Properties();
        String from;
        try{
            //从配置文件中拿到发件人邮箱地址
            prop.load(this.getClass().getResourceAsStream("/mail.properties"));
            from = prop.get("mail.smtp.username")+"";
            mMessageHelper=new MimeMessageHelper(mMessage,true);
            mMessageHelper.setFrom(from);//发件人邮箱
            mMessageHelper.setTo("1214895040@qq.com");//收件人邮箱
            mMessageHelper.setSubject("用户验证码");//邮件的主题
            mMessageHelper.setText("<p style=\"font-size: 20px;font-weight: bold\">验证码为：" +code+"</p>",true);//邮件的文本内容，true表示文本以html格式打开
            jms.send(mMessage);//发送邮件
        } catch (Exception e) {
            e.printStackTrace();
        }
        forumUserService.save(forumUser);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        forumUserService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/update")
    public Result update(ForumUser forumUser) {
        forumUserService.update(forumUser);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/detail")
    public Result detail(@RequestParam Integer id) {
        ForumUser forumUser = forumUserService.findById(id);
        return ResultGenerator.genSuccessResult(forumUser);
    }

    @PostMapping("/list")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<ForumUser> list = forumUserService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
