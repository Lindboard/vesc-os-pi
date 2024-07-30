################################################################################
#
# openocd-custom
#
################################################################################

OPENOCD_CUSTOM_VERSION = 0.12.0
OPENOCD_CUSTOM_SOURCE = openocd-$(OPENOCD_CUSTOM_VERSION).tar.bz2
OPENOCD_CUSTOM_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_CUSTOM_VERSION)
OPENOCD_CUSTOM_LICENSE = GPL-2.0+
OPENOCD_CUSTOM_LICENSE_FILES = COPYING
 
OPENOCD_CUSTOM_CONF_OPTS = \
	--oldincludedir=$(STAGING_DIR)/usr/include \
	--includedir=$(STAGING_DIR)/usr/include \
	--disable-doxygen-html \
	--disable-internal-jimtcl \
	--disable-shared \
	--enable-dummy \
	--disable-werror \
	--enable-sysfsgpio \
    --enable-bcm2835gpio \
    --enable-linuxgpiod

OPENOCD_CUSTOM_DEPENDENCIES = \
	host-pkgconf \
	jimtcl \
	$(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \
	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
	$(if $(BR2_PACKAGE_LIBHID),libhid) \
	$(if $(BR2_PACKAGE_HIDAPI),hidapi) \
	$(if $(BR2_PACKAGE_LIBGPIOD),libgpiod)

HOST_OPENOCD_CUSTOM_CONF_OPTS = \
	--enable-ftdi \
	--enable-stlink \
	--enable-ti-icdi \
	--enable-ulink \
	--enable-usb-blaster-2 \
	--enable-jlink \
	--enable-osbdm \
	--enable-opendous \
	--enable-aice \
	--enable-vsllink \
	--enable-usbprog \
	--enable-rlink \
	--enable-armjtagew \
	--enable-parport \
	--enable-jtag_vpi \
	--enable-usb-blaster \
	--enable-amtjtagaccel \
	--enable-gw16012 \
	--enable-presto \
	--enable-openjtag \
	--enable-buspirate \
	--enable-sysfsgpio \
	--oldincludedir=$(HOST_DIR)/include \
	--includedir=$(HOST_DIR)/include \
	--disable-doxygen-html \
	--disable-internal-jimtcl \
	--disable-shared \
	--enable-dummy \
	--disable-werror

HOST_OPENOCD_CUSTOM_DEPENDENCIES = host-jimtcl host-libftdi host-libusb host-libusb-compat

$(eval $(autotools-package))