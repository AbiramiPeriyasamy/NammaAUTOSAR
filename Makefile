# 
# Created on Thu Dec 22 2022 9:41:36 AM
# 
# The MIT License (MIT)
# Copyright (c) 2022 Aananth C N
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software
# and associated documentation files (the "Software"), to deal in the Software without restriction,
# including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all copies or substantial
# portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
# TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# 
include path_defs.mk # include the autogenerated file
include app_paths.mk # include the autogenerated file
include c_l_flags.mk # include the autogenerated file

COMPILER=arm-none-eabi-
CC=${COMPILER}gcc
LD=${COMPILER}ld
AS=${COMPILER}as
AR=${COMPILER}ar
RANLIB=${COMPILER}ranlib
OBJCOPY=${COMPILER}objcopy

TARGET := NammaAutosar

# AUTOSAR SoftWare Components list
autosar_swc_s := $(OS_PATH) $(ECUM_PATH) \
	$(MCU_STARTUP_PATH) $(MCU_PATH) \
	$(DIO_PATH) $(ETH_PATH) $(LIN_PATH) $(PORT_PATH) $(SPI_PATH) \
	$(APP_LIST)


.PHONY: all $(autosar_swc_s)
all: $(TARGET)


CC_VERS := $(shell ${CC} -dumpfullversion)
ifeq ($(OS),Windows_NT)
LIB_GCC_A_PATH=${MINGW_ROOT}/lib/gcc/arm-none-eabi/${CC_VERS}/thumb/v6-m/nofp/
else
LIB_GCC_A_PATH=/usr/lib/gcc/arm-none-eabi/${CC_VERS}/thumb/v6-m/nofp/
endif
GCC_LDFLAGS := -L${LIB_GCC_A_PATH} -lgcc 


# Build all AUTOSAR SWCs
$(autosar_swc_s):
	$(MAKE) --directory=$@ ROOT_DIR=$(CWD) COMPILER=$(COMPILER)


# The Main Target. Here LA_OBJS is constructed by uc_cgen.py python script. This
# script is a temporary work-around, will be moved to the right script later.
$(TARGET): $(autosar_swc_s)
	@echo ""
	@echo ╔════════════════════╗
	@echo ║ LINKING OBJECTS... ║
	@echo ╚════════════════════╝
	$(LD) ${LDFLAGS} $(LA_OBJS) -o ${TARGET}.elf -T $(LINK_DEF_F) -Map=${TARGET}.map ${GCC_LDFLAGS}
	$(OBJCOPY) -O binary ${TARGET}.elf ${TARGET}.bin
	@echo ""
	@echo ╔══════════════════════════════╗
	@echo ║ NammaAUTOSAR Build Complete! ║
	@echo ╚══════════════════════════════╝

# Clean Target
clean:
	for d in $(autosar_swc_s); 				\
	do							\
		$(MAKE) --directory=$$d ROOT_DIR=$(CWD) clean;	\
	done
	$(RM) ${TARGET}.elf ${TARGET}.bin ${TARGET}.map
