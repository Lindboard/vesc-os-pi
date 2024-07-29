################################################################################
#
# vesc-tool
#
################################################################################

VESC_TOOL_VERSION = eb3fa48a39b9516fca840b3df98a84359d51e9c2
VESC_TOOL_SITE = $(call github,r3n33,vesc_tool,$(VESC_TOOL_VERSION))
VESC_TOOL_LICENSE = GPLv3
VESC_TOOL_LICENSE_FILES = LICENSE

VESC_TOOL_CONF_OPTS += -config release "CONFIG += release_lin build_original exclude_fw"

define VESC_TOOL_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/build/lin/vesc_tool_* $(TARGET_DIR)/usr/bin/vesc_tool
endef

$(eval $(qmake-package))
