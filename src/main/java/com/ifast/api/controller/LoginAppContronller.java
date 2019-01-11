package com.ifast.api.controller;

import com.ifast.common.annotation.Log;
import com.ifast.common.utils.JSONUtils;
import com.ifast.common.utils.Result;
import com.ifast.quotation.domain.EntryDO;
import com.ifast.sys.domain.UserDO;
import com.ifast.sys.service.UserService;
import net.sf.json.JSON;
import net.sf.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import springfox.documentation.spring.web.json.Json;

/**
 * Created by zuohao on 2019/1/9.
 */
@Controller
@RequestMapping("/api/users/")
public class LoginAppContronller {
    @Autowired
    UserService userService;
    @Log("登录小程序")
    @ResponseBody
    @RequestMapping("/login")
    public Result<UserDO> save(String openId, Model model) {
        try{
            UserDO byOpenId = userService.findByOpenId(openId);
            int status = 0;
            if(byOpenId==null){
                return Result.fail();
            }
            return Result.build(status,"登录成功", byOpenId);
        }catch (Exception e){
            e.printStackTrace();
            return Result.fail();
        }
    }

    @Log("绑定账户")
    @ResponseBody
    @RequestMapping("/boundAccount")
    public Result<UserDO> boundAccount(UserDO userDO,Model model) {
        String openId = userDO.getOpenId();
        String mobile = userDO.getMobile();
        UserDO byPhone = userService.findByPhone(mobile);
        int status = 0;
        if(byPhone != null){
            byPhone.setOpenId(openId);
            int i = userService.updatePersonal(byPhone);
            if (i > 0){
                return Result.build(status,"账号绑定成功",byPhone);
            }else{
                status = 2;
                return Result.build(status,"账号绑定失败");
            }
        }else{
            status = 1;
            return Result.build(status,"员工不存在，请先注册！");
        }
    }
}
