GO_EASY_ON_ME = 1
#xport TARGET = iphoneos:clang:10.3:11.2
SDKVERSION = 11.2
SYSROOT = $(THEOS)/sdks/iPhoneOS11.2.sdk 
TARGET = iphone::10.3:11.2

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = SnapBack
SnapBack_FILES =  $(wildcard Source/*.m) $(wildcard JGProgressHUD/*.m) Snappy/libsnappy.c
SnapBack_FRAMEWORKS = UIKit CoreGraphics IOKit
SnapBack_EXTRA_FRAMEWORKS = iAmGRoot
SnapBack_PRIVATE_FRAMEWORKS = Preferences
SnapBack_CFLAGS = -fobjc-arc
SnapBack_LDFLAGS += -FFrameworks/
SnapBack_CODESIGN_FLAGS = -Sent.xml

include $(THEOS_MAKE_PATH)/application.mk

after-install::
	install.exec "killall \"SnapBack\" && uicache" || true
