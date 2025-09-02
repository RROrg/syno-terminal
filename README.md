# syno-terminal

## 简介

syno-terminal 是一个为群晖 NAS 提供 Web 终端访问的套件，支持多架构（x86/ARM），可通过浏览器安全地访问 NAS 终端。

## 安装方法
1. 在套件中心手动安装 syno-terminal
2. 安装失败后，按提示 SSH 登录 DSM，执行：
   ```sh
   sudo sed 's/package/root/g' -i /var/packages/terminal/conf/privilege
   sudo synopkg start terminal
   ```
3. 通过 icon 启动窗口 或者 通过浏览器访问：`http(s)://<ip>:<port>/terminal/`

## 常见问题
- 启动失败：请确认已按安装说明修改 privilege 文件并以 root 启动

## 许可证
MIT License
