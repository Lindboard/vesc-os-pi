################################################################################
#
# vesc-tool
#
################################################################################

VESC_TOOL_VERSION = 9ee74f5451536e07e653bc5179a6ed6be805bc1a
VESC_TOOL_SITE = $(call github,vedderb,vesc_tool,$(VESC_TOOL_VERSION))
VESC_TOOL_LICENSE = GPLv3
VESC_TOOL_LICENSE_FILES = LICENSE

VESC_TOOL_CONF_OPTS += -config release "CONFIG += release_lin build_original exclude_fw"

define VESC_TOOL_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/build/lin/vesc_tool_* $(TARGET_DIR)/usr/bin/vesc_tool
endef

$(eval $(qmake-package))
