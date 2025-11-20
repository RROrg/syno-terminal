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

## Tmux 快捷键中英文对照表 (C = Ctrl, S = Shift, M = Alt)
| 快捷键         | 中文说明                       | 英文说明                                 |
|----------------|-------------------------------|------------------------------------------|
| C-b C-b        | 发送前缀键                     | Send the prefix key                      |
| C-b C-o        | 轮换面板                       | Rotate through the panes                 |
| C-b C-z        | 挂起当前客户端                 | Suspend the current client               |
| C-b Space      | 选择下一个布局                 | Select next layout                       |
| C-b !          | 拆分面板到新窗口               | Break pane to a new window               |
| C-b "          | 垂直分屏                       | Split window vertically                  |
| C-b #          | 列出所有粘贴缓冲区             | List all paste buffers                   |
| C-b $          | 重命名当前会话                 | Rename current session                   |
| C-b %          | 水平分屏                       | Split window horizontally                |
| C-b &          | 关闭当前窗口                   | Kill current window                      |
| C-b '          | 选择窗口索引                   | Prompt for window index to select        |
| C-b (          | 上一个客户端                   | Switch to previous client                |
| C-b )          | 下一个客户端                   | Switch to next client                    |
| C-b ,          | 重命名当前窗口                 | Rename current window                    |
| C-b -          | 删除最近的粘贴缓冲区           | Delete the most recent paste buffer      |
| C-b .          | 移动当前窗口                   | Move the current window                  |
| C-b /          | 显示按键绑定说明               | Describe key binding                     |
| C-b 0~9        | 选择窗口 0~9                   | Select window 0~9                        |
| C-b :          | 命令行模式                     | Prompt for a command                     |
| C-b ;          | 切换到上一个活动面板           | Move to the previously active pane       |
| C-b =          | 选择粘贴缓冲区                 | Choose a paste buffer from a list        |
| C-b ?          | 显示所有快捷键绑定             | List key bindings                        |
| C-b C          | 自定义选项                     | Customize options                        |
| C-b D          | 选择并分离客户端               | Choose and detach a client from a list   |
| C-b E          | 均匀分布面板                   | Spread panes out evenly                  |
| C-b L          | 切换到最后一个客户端           | Switch to the last client                |
| C-b M          | 清除标记面板                   | Clear the marked pane                    |
| C-b [          | 进入复制模式                   | Enter copy mode                          |
| C-b ]          | 粘贴最近的缓冲区               | Paste the most recent paste buffer       |
| C-b c          | 新建窗口                       | Create a new window                      |
| C-b d          | 分离当前客户端                 | Detach the current client                |
| C-b f          | 查找面板                       | Search for a pane                        |
| C-b i          | 显示窗口信息                   | Display window information               |
| C-b l          | 切换到上一个窗口               | Select the previously current window     |
| C-b m          | 标记/取消标记面板              | Toggle the marked pane                   |
| C-b n          | 下一个窗口                     | Select the next window                   |
| C-b o          | 下一个面板                     | Select the next pane                     |
| C-b p          | 上一个窗口                     | Select the previous window               |
| C-b q          | 显示面板编号                   | Display pane numbers                     |
| C-b r          | 重绘当前客户端                 | Redraw the current client                |
| C-b s          | 选择会话                       | Choose a session from a list             |
| C-b t          | 显示时钟                       | Show a clock                             |
| C-b w          | 选择窗口                       | Choose a window from a list              |
| C-b x          | 关闭当前面板                   | Kill the active pane                     |
| C-b z          | 放大/还原当前面板              | Zoom the active pane                     |
| C-b {          | 与上方面板交换                 | Swap the active pane with the pane above |
| C-b }          | 与下方面板交换                 | Swap the active pane with the pane below |
| C-b ~          | 显示消息                       | Show messages                            |
| C-b DC         | 重置窗口跟随光标               | Reset so the visible part follows cursor |
| C-b PPage      | 进入复制模式并向上滚动         | Enter copy mode and scroll up            |
| C-b Up         | 选择上一个面板                 | Select the pane above the active pane    |
| C-b Down       | 选择下一个面板                 | Select the pane below the active pane    |
| C-b Left       | 选择左一个面板                 | Select the pane to the left of the active pane    |
| C-b Right      | 选择右一个面板                 | Select the pane to the right of the active pane    |
| C-b M-1        | 均匀分布水平面板               | Spread panes out evenly horizontally    |
| C-b M-2        | 均匀分布垂直面板               | Spread panes out evenly vertically      |
| C-b M-3        | 主水平布局                     | Set the main-horizontal layout         |
| C-b M-4        | 主垂直布局                     | Set the main-vertical layout           |
| C-b M-5        | 平铺布局                       | Select the tiled layout                |
| C-b M-n        | 选择下一个窗口并显示警告      | Select the next window with an alert    |
| C-b M-o        | 旋转面板                       | Rotate through the panes in reverse     |
| C-b M-p        | 选择上一个窗口并显示警告      | Select the previous window with an alert |
| C-b M-Up       | 将窗格向上缩小 5 个单位       | Resize the pane up by 5                  |
| C-b M-Down     | 将窗格向下增大 5 个单位       | Resize the pane down by 5                |
| C-b M-Left     | 将窗格向左缩小 5 个单位       | Resize the pane left by 5                  |
| C-b M-Right    | 将窗格向右增大 5 个单位       | Resize the pane right by 5                |
| C-b C-Up       | 将窗格向上缩小 1 行           | Resize the pane up by 1 line                  |
| C-b C-Down     | 将窗格向下增大 1 行           | Resize the pane down by 1 line                |
| C-b C-Left     | 将窗格向左缩小 1 列           | Resize the pane left by 1 column                |
| C-b C-Right    | 将窗格向右增大 1 列           | Resize the pane right by 1 column             |
| C-b S-Up       | 将窗口向上移动 1 个单位       | Move the visible part of the window up             |
| C-b S-Down     | 将窗口向下移动 1 个单位       | Move the visible part of the window down           |
| C-b S-Left     | 将窗口向左移动 1 个单位       | Move the visible part of the window left           |
| C-b S-Right    | 将窗口向右移动 1 个单位       | Move the visible part of the window right          |
