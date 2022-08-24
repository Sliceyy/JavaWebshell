package com.agent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

@Controller
public class UploadController {
    //    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public String fileUpload(HttpServletRequest request, MultipartFile file) throws Exception {
        if (!file.isEmpty()) {
            try {
            System.out.println("File Uploading...");

            //上传位置
            String realPath = request.getSession().getServletContext().getRealPath("/uploads/");

            File dir = new File(realPath + File.separator);
            System.out.println("dir:"+dir);
            if (!dir.exists())
                dir.mkdirs();
            // 写文件到服务器
            File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
            file.transferTo(serverFile);
            return "You successfully uploaded file=" +  file.getOriginalFilename();
        } catch (Exception e) {
            return "You failed to upload " +  file.getOriginalFilename() + " => " + e.getMessage();
        }
    } else {
            return "You failed to upload " +  file.getOriginalFilename() + " because the file was empty.";
            }
    }
}
