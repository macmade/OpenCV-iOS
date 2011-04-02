#-------------------------------------------------------------------------------
# Copyright (C) 2010 Jean-David Gadina (macmade@eosgarden.com)
# All rights reserved
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
#  -   Redistributions of source code must retain the above copyright notice,
#      this list of conditions and the following disclaimer.
#  -   Redistributions in binary form must reproduce the above copyright
#      notice, this list of conditions and the following disclaimer in the
#      documentation and/or other materials provided with the distribution.
#  -   Neither the name of 'Jean-David Gadina' nor the names of its
#      contributors may be used to endorse or promote products derived from
#      this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Path to directories
#-------------------------------------------------------------------------------
DIR_BUILD                       = ./build/
DIR_BUILD_IPHONE                = $(DIR_BUILD)$(IPHONE_ARCH_SDKNAME)/
DIR_BUILD_SIMULATOR             = $(DIR_BUILD)$(SIMULATOR_ARCH_SDKNAME)/
DIR_LIB                         = ./lib/
DIR_LIB_IPHONE                  = $(DIR_LIB)$(IPHONE_ARCH_SDKNAME)/
DIR_LIB_SIMULATOR               = $(DIR_LIB)$(SIMULATOR_ARCH_SDKNAME)/
DIR_PATCH                       = ./patch/
DIR_SRC                         = ./src/
DIR_TMP                         = ./tmp/
DIR_PLATFORMS                   = /Developer/Platforms/

#-------------------------------------------------------------------------------
# Software
#-------------------------------------------------------------------------------
MAKE                            = make
CD                              = cd
CP                              = cp
MKDIR                           = mkdir
RM                              = rm
TAR                             = tar
PATCH                           = patch

#-------------------------------------------------------------------------------
# Software arguments
#-------------------------------------------------------------------------------
ARGS_RM                         = -rf
ARGS_TAR                        = -xjf
ARGS_MAKE                       = 
ARGS_CP                         = -rf
ARGS_PATCH                      = -p0

#-------------------------------------------------------------------------------
# Software versions
#-------------------------------------------------------------------------------
VERSION_OPENCV                  = 2.0.0
VERSION_SDK                     = 3.2
VERSION_GCC                     = 4.2

#-------------------------------------------------------------------------------
# Source paths
#-------------------------------------------------------------------------------
SRC_OPENCV                      = $(DIR_SRC)OpenCV-$(VERSION_OPENCV).tar.bz2

#-------------------------------------------------------------------------------
# iPhone simulator settings
#-------------------------------------------------------------------------------
SIMULATOR_ARCH_SDKNAME          = iPhoneSimulator
SIMULATOR_PLATFORM              = $(DIR_PLATFORMS)$(SIMULATOR_ARCH_SDKNAME).platform
SIMULATOR_BIN                   = $(SIMULATOR_PLATFORM)/Developer/usr/bin
SIMULATOR_SDK                   = $(SIMULATOR_PLATFORM)/Developer/SDKs/$(SIMULATOR_ARCH_SDKNAME)$(VERSION_SDK).sdk
SIMULATOR_CC                    = $(SIMULATOR_BIN)/gcc-$(VERSION_GCC)
SIMULATOR_CXX                   = $(SIMULATOR_BIN)/g++-$(VERSION_GCC)
SIMULATOR_AR                    = $(SIMULATOR_BIN)/ar
SIMULATOR_ARCH_FLAGS            = -arch i686 -mmacosx-version-min=10.5
SIMULATOR_ARCH_HOST             = i686-apple-darwin9
SIMULATOR_CFLAGS                = $(SIMULATOR_ARCH_FLAGS) -isysroot $(SIMULATOR_SDK)
SIMULATOR_CXXFLAGS              = $(SIMULATOR_ARCH_FLAGS) -isysroot $(SIMULATOR_SDK) -I$(SIMULATOR_SDK)/usr/include/c++/4.2.1/$(SIMULATOR_ARCH_HOST)/

#-------------------------------------------------------------------------------
# iPhone OS settings
#-------------------------------------------------------------------------------
IPHONE_ARCH_SDKNAME             = iPhoneOS
IPHONE_PLATFORM                 = $(DIR_PLATFORMS)$(IPHONE_ARCH_SDKNAME).platform
IPHONE_BIN                      = $(IPHONE_PLATFORM)/Developer/usr/bin
IPHONE_SDK                      = $(IPHONE_PLATFORM)/Developer/SDKs/$(IPHONE_ARCH_SDKNAME)$(VERSION_SDK).sdk
IPHONE_CC                       = $(IPHONE_BIN)/gcc-$(VERSION_GCC)
IPHONE_CXX                      = $(IPHONE_BIN)/g++-$(VERSION_GCC)
IPHONE_CPP                      = $(IPHONE_BIN)/cpp
IPHONE_CXXCPP                   = $(IPHONE_BIN)/cpp
IPHONE_AR                       = $(IPHONE_BIN)/ar
IPHONE_ARCH_FLAGS               = -arch armv6 -miphoneos-version-min=$(VERSION_SDK)
IPHONE_ARCH_HOST                = armv6-apple-darwin9
IPHONE_CFLAGS                   = $(IPHONE_ARCH_FLAGS) -isysroot $(IPHONE_SDK)
IPHONE_CXXFLAGS                 = $(IPHONE_ARCH_FLAGS) -isysroot $(IPHONE_SDK) -I$(IPHONE_SDK)/usr/include/c++/4.2.1/$(IPHONE_ARCH_HOST)/

#-------------------------------------------------------------------------------
# OpenCV build settings
#-------------------------------------------------------------------------------
BUILD_CONFIG_OPTIONS            = --enable-static --disable-shared --disable-sse --disable-apps --without-python --without-ffmpeg --without-1394libs --without-v4l --without-imageio --without-quicktime --without-carbon --without-gtk --without-gthread
BUILD                           = i686-apple-darwin

#-------------------------------------------------------------------------------
# Targets
#-------------------------------------------------------------------------------

# Phony targets
.PHONY: clean all opencv opencv_simulator opencv_iphone

# Complete build
all: opencv opencv_simulator opencv_iphone

# Clean-up
clean:
	@echo "    *** Cleaning all build files..."
	@$(RM) $(ARGS_RM) $(DIR_BUILD_IPHONE)*
	@$(RM) $(ARGS_RM) $(DIR_BUILD_SIMULATOR)*
	@echo "    *** Cleaning all destination files..."
	@$(RM) $(ARGS_RM) $(DIR_LIB_IPHONE)*
	@$(RM) $(ARGS_RM) $(DIR_LIB_SIMULATOR)*
	@echo "    *** Cleaning all temporary files..."
	@$(RM) $(ARGS_RM) $(DIR_TMP)*
	
# Source un-archiving
opencv:
	@echo "    *** Unpacking OpenCV ($(VERSION_OPENCV))..."
	@if [ ! -d $(DIR_TMP)OpenCV-$(VERSION_OPENCV) ]; then $(TAR) $(ARGS_TAR) $(SRC_OPENCV) -C $(DIR_TMP); if [ -f $(DIR_PATCH)OpenCV-$(VERSION_OPENCV).patch ]; then $(CD) $(DIR_TMP)OpenCV-$(VERSION_OPENCV)/; $(PATCH) $(ARGS_PATCH) < ../../$(DIR_PATCH)OpenCV-$(VERSION_OPENCV).patch; fi  fi

# iPhone simulator build
opencv_simulator:
	@echo "    *** Configuring  OpenCV ($(VERSION_OPENCV) - $(SIMULATOR_ARCH_SDKNAME))..."
	@$(CD) $(DIR_BUILD_SIMULATOR) && exec ../../$(DIR_TMP)OpenCV-$(VERSION_OPENCV)/configure --prefix=`pwd`/../../$(DIR_LIB_SIMULATOR) --build=$(BUILD) --host=$(SIMULATOR_ARCH_HOST) $(BUILD_CONFIG_OPTIONS) CC=$(SIMULATOR_CC) CXX=$(SIMULATOR_CXX) CPP=$(SIMULATOR_CPP) CXXCPP=$(SIMULATOR_CXXCPP) AR=$(SIMULATOR_AR) CFLAGS="$(SIMULATOR_CFLAGS)" CXXFLAGS="$(SIMULATOR_CXXFLAGS)"
	@echo "    *** Building  OpenCV ($(VERSION_OPENCV) - $(SIMULATOR_ARCH_SDKNAME))..."
	@$(CD) $(DIR_BUILD_SIMULATOR) && $(MAKE)
	@echo "    *** Copying the build files to their final destination..."
	@$(CD) $(DIR_BUILD_SIMULATOR) && $(MAKE) install

# iPhone OS build
opencv_iphone:
	@echo "    *** Configuring  OpenCV ($(VERSION_OPENCV) - $IPHONE_ARCH_SDKNAME))..."
	@$(CD) $(DIR_BUILD_IPHONE) && exec ../../$(DIR_TMP)OpenCV-$(VERSION_OPENCV)/configure --prefix=`pwd`/../../$(DIR_LIB_IPHONE) --build=$(BUILD) --host=$(IPHONE_ARCH_HOST) $(BUILD_CONFIG_OPTIONS) CC=$(IPHONE_CC) CXX=$(IPHONE_CXX) CPP=$(IPHONE_CPP) CXXCPP=$(IPHONE_CXXCPP) AR=$(IPHONE_AR) CFLAGS="$(IPHONE_CFLAGS)" CXXFLAGS="$(IPHONE_CXXFLAGS)"
	@echo "    *** Building  OpenCV ($(VERSION_OPENCV) - $(IPHONE_ARCH_SDKNAME))..."
	@$(CD) $(DIR_BUILD_IPHONE) && $(MAKE)
	@echo "    *** Copying the build files to their final destination"
	@$(CD) $(DIR_BUILD_IPHONE) && $(MAKE) install
