LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR),motorola-qcom)
ifeq ($(TARGET_BOARD_PLATFORM),msm8226)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
endif
