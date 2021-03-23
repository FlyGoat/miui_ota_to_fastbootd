# miui_ota_to_fastbootd
Generate fastbootd flashable images from OTA package for MIUI devices

## 前言
小米11使用了 [Android动态分区机制](https://source.android.google.cn/devices/tech/ota/dynamic_partitions/implement) 取消了传统的Recovery分区，导致无法通过传统方式刷入`.zip` OTA包。而小米也不再提供提供内测版本的fastboot包。此项目提供了一个工具将`.zip`OTA包转换为可以通过[fastbootd](https://source.android.google.cn/devices/bootloader/fastbootd)机制刷入的镜像。方便用户在没有内测帐号的情况下体验MIUI内测版本。

## 使用

你可以选择从本项目的[Release](https://github.com/FlyGoat/miui_ota_to_fastbootd/releases/)中获取作者制作的镜像 (针对Xiaomi Mi11 venus), 或者自己生成镜像。

### 生成镜像 (可选)

- 通过其他工具 (例如[Xiaomi Firmware Updater by yshalsager](https://xiaomifirmwareupdater.com/miui/venus/)) 从MIUI OTA服务器获取`.zip`(或称Recovery) OTA包。

- 运行 `./gen_image.py <path-to-zip-package>`

- 生成的镜像在`out`目录中

### 刷入

- 生成镜像后进入本项目的`out`目录，或者解压下载的镜像。

- 让手机进入`sideload`模式，并通过USB连接电脑。(对于Mi11来说，可以通过在关机状态下同时长按`音量上`以及`电源键`进入恢复模式，并选择进入`连接小米手机助手`模式来启动`sideload`)。

- 对于Windows x86 PC，请双击运行`windows_flash.bat`刷入，对Linux AMD64 PC，请在终端下运行`./linux_flash.sh`刷入。

- 刷入完成后手机会自动重启，如过遇到问题可尝试强制关机进入恢复模式清除数据。

注意，`fastbootd`与传统的`fastboot`的模式不同，请务必按照指引先进入`sideload`模式。

## TODO

- 使用GitHub Action自动生成镜像

## 鸣谢

- [PySIMG](https://github.com/dlenski/PySIMG)
- [extract_android_ota_payload](https://github.com/cyxx/extract_android_ota_payload)
- [Android Open Source Project](https://source.android.com/)