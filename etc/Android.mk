# Copyright (C) 2012 Mozilla Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

.PHONY: patch-init-goldfish-rc
patch-init-goldfish-rc: PRIVATE_INITRC := $(TARGET_ROOT_OUT)/init.goldfish.rc
patch-init-goldfish-rc: PRIVATE_PATCH := $(LOCAL_PATH)/init.goldfish.rc.patch
patch-init-goldfish-rc: $(TARGET_ROOT_OUT)/init.goldfish.rc \
                        $(LOCAL_PATH)/init.goldfish.rc.patch
	$(hide) if [ -z "`cat $(PRIVATE_INITRC) | grep init.goldfish.rc.patch-applied`" ]; then \
	  echo "patch: $(PRIVATE_INITRC) < $(notdir $(PRIVATE_PATCH))"; \
	  patch -s $(PRIVATE_INITRC) $(PRIVATE_PATCH); \
	fi

# INSTALLED_RAMDISK_TARGET have not been assigned at the time all Android.mk
# files are included.
$(PRODUCT_OUT)/ramdisk.img: patch-init-goldfish-rc
