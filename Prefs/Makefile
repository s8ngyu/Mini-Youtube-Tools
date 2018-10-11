include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = MiniYoutubeToolsPrefs
MiniYoutubeToolsPrefs_FILES = MYTRootListController.m
MiniYoutubeToolsPrefs_INSTALL_PATH = /Library/PreferenceBundles
MiniYoutubeToolsPrefs_FRAMEWORKS = UIKit
MiniYoutubeToolsPrefs_PRIVATE_FRAMEWORKS = Preferences
$(BUNDLE_NAME)_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/MiniYoutubeToolsPrefs.plist$(ECHO_END)
