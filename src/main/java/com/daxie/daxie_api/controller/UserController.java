package com.daxie.daxie_api.controller;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.daxie.daxie_api.configurer.PassToken;
import com.daxie.daxie_api.core.Code;
import com.daxie.daxie_api.core.Result;
import com.daxie.daxie_api.core.ResultGenerator;
import com.daxie.daxie_api.core.UUIDS;
import com.daxie.daxie_api.model.User;
import com.daxie.daxie_api.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * Created by 代码生成器 on 2019/01/19.
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService UserService;
    @Autowired
    private JavaMailSender jms;
    //注册 添加用户
    @PostMapping("/register")
    public Result register(User User) {
        System.out.println(UUIDS.getDateUUID());
        System.out.println(UUIDS.getDateTime());
        User.setUserid(UUIDS.getDateUUID());
        User.setCreatedate(UUIDS.getDateTime());
        UserService.save(User);
        return ResultGenerator.genSuccessResult(User);
    }
    //获取验证码，返回前台
    @PostMapping("/getCode")
    public Result getCode(String email){
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
            mMessageHelper.setTo(email);//收件人邮箱
            mMessageHelper.setSubject("用户验证码");//邮件的主题
            mMessageHelper.setText("<p style=\"font-size: 20px;font-weight: bold\">验证码为：" +code+"</p>",true);//邮件的文本内容，true表示文本以html格式打开
            jms.send(mMessage);//发送邮件
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
        return ResultGenerator.genSuccessResult(code);
    }
    @PassToken
    @PostMapping("/login")
    public Result login(User User) {
        User u =UserService.findBy("username",User.getUsername());
        if (u==null){
            return ResultGenerator.genFailResult("用户名不存在");
        }else if(u.getPassword()==User.getPassword() || u.getPassword().equals(User.getPassword())){
            u.setLastdate(UUIDS.getDateTime());
            UserService.update(u);
            String token="";
            token= JWT.create().withAudience(u.getUserid())// 将 user id 保存到 token 里面
                    .sign(Algorithm.HMAC256(u.getPassword()));// 以 password 作为 token 的密钥
            ArrayList list=new ArrayList();
            list.add(u);
            list.add(token);
            return ResultGenerator.genSuccessResult(u);
        }else{
            return ResultGenerator.genFailResult("密码不正确");
        }
    }

    @ResponseBody
    @PostMapping(value = "/uploadIamae")
    public Result uploadIamae(MultipartFile img,User user){
        //文件上传
        System.out.println(user.getUsername());
        if(img==null){
            return ResultGenerator.genFailResult("图片上传失败！0");
        }
        if (!img.isEmpty()) {
            try {
                //图片命名
                String newCompanyImageName = "tx"+user.getUserid()+".jpg";
                //user.setUserimage();
                String newCompanyImagepath = "D:\\image\\"+newCompanyImageName;
                File newFile = new File(newCompanyImagepath);
                System.out.println(newCompanyImagepath);
                if (!newFile.exists()) {
                    newFile.createNewFile();
                }
                BufferedOutputStream out = new BufferedOutputStream(
                        new FileOutputStream(newFile));
                out.write(img.getBytes());
                out.flush();
                out.close();
                user.setUserimage(newCompanyImagepath);
                UserService.update(user);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                return ResultGenerator.genFailResult("图片上传失败！1");
            } catch (IOException e) {
                e.printStackTrace();
                return ResultGenerator.genFailResult("图片上传失败！2");
            }
        }

        return ResultGenerator.genSuccessResult("头像上传成功！");

    }

    @PostMapping("/add")
    public Result add(User User) {
        UserService.save(User);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        UserService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/update")
    public Result update(User User) {
        UserService.update(User);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/detail")
    public Result detail(@RequestParam Integer id) {
        User User = UserService.findById(id);
        return ResultGenerator.genSuccessResult(User);
    }

    @PostMapping("/list")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<User> list = UserService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
