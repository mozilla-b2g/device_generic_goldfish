# Copyright (C) 2013 Mozilla Foundation
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

ADDITIONAL_BUILD_PROPERTIES += \
  ro.moz.ril.query_icc_count=true \
  ro.moz.ril.ipv6=true \
  $(NULL)

.PHONY: patch-init-goldfish-sh
patch-init-goldfish-sh: PRIVATE_INITSH := $(TARGET_OUT_ETC)/init.goldfish.sh
patch-init-goldfish-sh: PRIVATE_PATCH := $(LOCAL_PATH)/init.goldfish.sh.patch
patch-init-goldfish-sh: $(TARGET_OUT_ETC)/init.goldfish.sh \
                        $(LOCAL_PATH)/init.goldfish.sh.patch
	$(hide) if [ -n "`cat $(PRIVATE_INITSH) | grep '^route add'`" ]; then \
	  echo "patch: $(PRIVATE_INITSH) < $(notdir $(PRIVATE_PATCH))"; \
	  patch -s $(PRIVATE_INITSH) $(PRIVATE_PATCH); \
	fi

# INSTALLED_RAMDISK_TARGET have not been assigned at the time all Android.mk
# files are included.
$(PRODUCT_OUT)/ramdisk.img: patch-init-goldfish-sh
