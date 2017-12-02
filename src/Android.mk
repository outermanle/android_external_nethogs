LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	main.cpp \
	packet.cpp \
	connection.cpp \
	process.cpp \
	decpcap.c \
	cui.cpp \
	inode2prog.cpp \
	conninode.cpp \
	devices.cpp

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/../../android_external_libncurses/include/ \

VERSION:="0.8.5-37-g7093964"

LOCAL_CFLAGS += -Wall -Wextra -DVERSION=\"$(VERSION)\"
LOCAL_CPPFLAGS += -Wall -Wextra -Wno-missing-field-initializers -std=c++11 -DVERSION=\"$(VERSION)\"
LOCAL_LDFLAGS += -Wl,--no-fatal-warnings -Wno-unused-variable

LOCAL_STATIC_LIBRARIES := libpcap
# if you need to customize libncurses for display, goto android_external_libncurses
LOCAL_STATIC_LIBRARIES += libncurses

LOCAL_SHARED_LIBRARIES := \
	libcutils liblog libm

LOCAL_MODULE_TAGS := eng

LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)

LOCAL_MODULE := nethogs

include $(BUILD_EXECUTABLE)

