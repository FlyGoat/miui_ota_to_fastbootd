@echo off
cd %~dp0

platform-tools-windows\adb %* reboot fastboot

platform-tools-windows\fastboot %* getvar is-userspace 2>&1 | findstr /r /c:"^is-userspace: *yes" || echo Not in fastbootd
platform-tools-windows\fastboot %* getvar is-userspace 2>&1 | findstr /r /c:"^is-userspace: *yes" || exit /B 1

platform-tools-windows\fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *venus" || echo Missmatching image and device
platform-tools-windows\fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *venus" || exit /B 1

platform-tools-windows\fastboot %* flash system_a images/system.img
platform-tools-windows\fastboot %* flash system_ext_a images/system_ext.img
platform-tools-windows\fastboot %* flash product_a images/product.img
platform-tools-windows\fastboot %* flash vendor_a images/vendor.img
platform-tools-windows\fastboot %* flash odm_a images/odm.img

platform-tools-windows\fastboot %* reboot bootloader

platform-tools-windows\fastboot %* flash vm-bootsys_a images\vm-bootsys.img
platform-tools-windows\fastboot %* flash dsp_a images\dsp.img
platform-tools-windows\fastboot %* flash xbl_config_a images\xbl_config.img
platform-tools-windows\fastboot %* flash boot_a images\boot.img
platform-tools-windows\fastboot %* flash modem_a images\modem.img
platform-tools-windows\fastboot %* flash vbmeta_system_a images\vbmeta_system.img
platform-tools-windows\fastboot %* flash tz_a images\tz.img
platform-tools-windows\fastboot %* flash vbmeta_a images\vbmeta.img
platform-tools-windows\fastboot %* flash bluetooth_a images\bluetooth.img
platform-tools-windows\fastboot %* flash abl_a images\abl.img
platform-tools-windows\fastboot %* flash cpucp_a images\cpucp.img
platform-tools-windows\fastboot %* flash dtbo_a images\dtbo.img
platform-tools-windows\fastboot %* flash featenabler_a images\featenabler.img
platform-tools-windows\fastboot %* flash vendor_boot_a images\vendor_boot.img
platform-tools-windows\fastboot %* flash keymaster_a images\keymaster.img
platform-tools-windows\fastboot %* flash uefisecapp_a images\uefisecapp.img
platform-tools-windows\fastboot %* flash qupfw_a images\qupfw.img
platform-tools-windows\fastboot %* flash xbl_a images\xbl.img
platform-tools-windows\fastboot %* flash devcfg_a images\devcfg.img
platform-tools-windows\fastboot %* flash hyp_a images\hyp.img
platform-tools-windows\fastboot %* flash imagefv_a images\imagefv.img
platform-tools-windows\fastboot %* flash shrm_a images\shrm.img
platform-tools-windows\fastboot %* flash aop_a images\aop.img

platform-tools-windows\fastboot %* set_active a
platform-tools-windows\fastboot %* reboot
