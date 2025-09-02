SPK_NAME = terminal
SPK_VERS = 2.0
SPK_REV = 3
SPK_ICON = src/$(SPK_NAME).png

DEPENDS = 


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

COPY_TARGET = nop
POST_STRIP_TARGET = terminal_strip_target

include ../../mk/spksrc.spk.mk

.PHONY: terminal_strip_target
terminal_strip_target:
	install -m 755 -d $(STAGING_DIR)/app/
	install -m 644 src/app/config $(STAGING_DIR)/app/config
	install -m 644 src/app/helptoc.conf $(STAGING_DIR)/app/helptoc.conf
	install -m 644 src/app/terminal.js $(STAGING_DIR)/app/terminal.js

	install -m 755 -d $(STAGING_DIR)/bin/
	install -m 755 src/bin/ttyd* $(STAGING_DIR)/bin/
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