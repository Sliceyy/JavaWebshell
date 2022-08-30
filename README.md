# JavaWebshell
**描述**

内存马测试环境-Listener型


**测试**

payload.jsp：生成内存马。

upload.jsp：上传文件到服务器

访问 http://localhost:8080/payload.jsp 完成内存马注入

随后访问http://localhost:8080/?cmd=calc 可弹出计算器

****0830更新****
内存马测试环境-Filter型
filter_payload.jsp：生成内存马。
访问 http://localhost:8080/filter_payload.jsp 完成内存马注入

随后访问http://localhost:8080/?cmd=whoami 返回用户名

