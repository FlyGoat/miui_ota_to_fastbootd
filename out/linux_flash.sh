cd `dirname $0`

# Device should in sideload mode
platform-tools-linux/adb $* reboot fastboot

# Ensure we'are in fastbootd
platform-tools-linux/fastboot $* getvar is-userspace 2>&1 | grep -w "^is-userspace: *yes"
if [ $? -ne 0 ]; then echo "Not in fastbootd"; exit 1; fi

platform-tools-linux/fastboot $* getvar product 2>&1 | grep -w "^product: *venus"
if [ $? -ne 0 ]; then echo "Missmatching image and device"; exit 1; fi

platform-tools-linux/fastboot $* flash vm-bootsys_a images/vm-bootsys.img
platform-tools-linux/fastboot $* flash dsp_a images/dsp.img
platform-tools-linux/fastboot $* flash xbl_config_a images/xbl_config.img
platform-tools-linux/fastboot $* flash boot_a images/boot.img
platform-tools-linux/fastboot $* flash modem_a images/modem.img
platform-tools-linux/fastboot $* flash vbmeta_system_a images/vbmeta_system.img
platform-tools-linux/fastboot $* flash tz_a images/tz.img
platform-tools-linux/fastboot $* flash vbmeta_a images/vbmeta.img
platform-tools-linux/fastboot $* flash bluetooth_a images/bluetooth.img
platform-tools-linux/fastboot $* flash abl_a images/abl.img
platform-tools-linux/fastboot $* flash cpucp_a images/cpucp.img
platform-tools-linux/fastboot $* flash dtbo_a images/dtbo.img
platform-tools-linux/fastboot $* flash featenabler_a images/featenabler.img
platform-tools-linux/fastboot $* flash vendor_boot_a images/vendor_boot.img
platform-tools-linux/fastboot $* flash keymaster_a images/keymaster.img
platform-tools-linux/fastboot $* flash uefisecapp_a images/uefisecapp.img
platform-tools-linux/fastboot $* flash qupfw_a images/qupfw.img
platform-tools-linux/fastboot $* flash xbl_a images/xbl.img
platform-tools-linux/fastboot $* flash devcfg_a images/devcfg.img
platform-tools-linux/fastboot $* flash hyp_a images/hyp.img
platform-tools-linux/fastboot $* flash imagefv_a images/imagefv.img
platform-tools-linux/fastboot $* flash shrm_a images/shrm.img
platform-tools-linux/fastboot $* flash aop_a images/aop.img

# cust doesn't exist in OTA package
# platform-tools-linux/fastboot $* flash cust images/cust.img

# supper will be splited
# platform-tools-linux/fastboot $* flash super images/super.img

platform-tools-linux/fastboot $* flash system_a images/system.img
platform-tools-linux/fastboot $* flash system_ext_a images/system_ext.img
platform-tools-linux/fastboot $* flash product_a images/product.img
platform-tools-linux/fastboot $* flash vendor_a images/vendor.img
platform-tools-linux/fastboot $* flash odm_a images/odm.img

# Uncomment if you want to erase all data
# platform-tools-linux/fastboot $* erase metadata

platform-tools-linux/fastboot $* set_active a
platform-tools-linux/fastboot $* reboot
