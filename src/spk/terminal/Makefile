SPK_NAME = terminal
SPK_VERS = 3.0
SPK_REV = 1
SPK_ICON = src/$(SPK_NAME).png

DEPENDS = cross/tmux


UNSUPPORTED_ARCHS = $(OLD_PPC_ARCHS) $(ARMv5_ARCHS)

include ../../mk/spksrc.common.mk

MAINTAINER = RROrg/wjz304
DESCRIPTION = "Windowed terminal for Synology NAS, based on ttyd."

HOMEPAGE = https://www.kernel.org/
LICENSE  = GPLv2

SPK_DEPENDS = 

DSM_UI_DIR = app
DSM_UI_CONFIG = src/app/config
DSM_APP_NAME = SynoCommunity.Terminal.AppInstance

WIZARDS_DIR = src/wizard

STARTABLE = yes
SERVICE_SETUP = src/service-setup.sh
SSS_SCRIPT = src/start-stop-status.sh

#COPY_TARGET = nop
POST_STRIP_TARGET = terminal_strip_target


TERMINAL_ARCH =
ifeq ($(findstring $(ARCH),$(ARMv5_ARCHS) $(ARMv7L_ARCHS)),$(ARCH))
TERMINAL_ARCH = arm
endif
ifeq ($(findstring $(ARCH),$(ARMv7_ARCHS)),$(ARCH))
TERMINAL_ARCH = armhf
endif
ifeq ($(findstring $(ARCH),$(ARMv8_ARCHS)),$(ARCH))
TERMINAL_ARCH = aarch64
endif
ifeq ($(findstring $(ARCH),$(i686_ARCHS)),$(ARCH))
TERMINAL_ARCH = i686
endif
ifeq ($(findstring $(ARCH),$(x64_ARCHS)),$(ARCH))
TERMINAL_ARCH = x86_64
endif
#ifeq ($(findstring $(ARCH),$(PPC_ARCHS)),$(ARCH))
#TERMINAL_ARCH = powerpc
#endif
ifeq ($(strip $(TERMINAL_ARCH)),)
$(error Arch $(ARCH) not supported)
endif

include ../../mk/spksrc.spk.mk

.PHONY: terminal_strip_target
terminal_strip_target:
	install -m 755 -d $(STAGING_DIR)/app/
	install -m 644 src/app/config $(STAGING_DIR)/app/config
	install -m 644 src/app/helptoc.conf $(STAGING_DIR)/app/helptoc.conf
	install -m 644 src/app/terminal.js $(STAGING_DIR)/app/terminal.js

	install -m 755 -d $(STAGING_DIR)/bin/
	curl -kL https://github.com/tsl0922/ttyd/releases/latest/download/ttyd.$(TERMINAL_ARCH) -o $(STAGING_DIR)/bin/ttyd
	chmod a+x $(STAGING_DIR)/bin/ttyd
	install -m 755 -d $(STAGING_DIR)/etc/
	install -m 644 src/etc/terminal.conf $(STAGING_DIR)/etc/terminal.conf

	install -m 755 -d $(STAGING_DIR)/app/help
	for language in chs enu; do \
		install -m 755 -d $(STAGING_DIR)/app/help/$${language}; \
		install -m 644 src/app/help/$${language}/terminal_index.html $(STAGING_DIR)/app/help/$${language}/terminal_index.html; \
	done
	install -m 755 -d $(STAGING_DIR)/app/texts
	for language in chs enu; do \
		install -m 755 -d $(STAGING_DIR)/app/texts/$${language}; \
		install -m 644 src/app/texts/$${language}/strings $(STAGING_DIR)/app/texts/$${language}/strings; \
	done
	install -m 755 -d $(STAGING_DIR)/app/images/
	install -m 644 src/app/images/*.png $(STAGING_DIR)/app/images/