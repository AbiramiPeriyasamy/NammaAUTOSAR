# This file is autogenerated, any hand modifications will be lost!

# Makefile Paths Definitions
CWD := D:/_E/projects/oss/NammaAUTOSAR
ROOT_PATH := D:/_E/projects/oss/NammaAUTOSAR
MCU_PATH := D:/_E/projects/oss/NammaAUTOSAR/submodules/MCAL/Mcu
MCU_STARTUP_PATH := D:/_E/projects/oss/NammaAUTOSAR/submodules/MCAL/Mcu/src/bsp/startup/rp2040
ECUM_PATH := D:/_E/projects/oss/NammaAUTOSAR/submodules/SL/EcuM
PORT_PATH := D:/_E/projects/oss/NammaAUTOSAR/submodules/MCAL/Port
DIO_PATH := D:/_E/projects/oss/NammaAUTOSAR/submodules/MCAL/Dio
SPI_PATH := D:/_E/projects/oss/NammaAUTOSAR/submodules/MCAL/Spi
LIN_PATH := D:/_E/projects/oss/NammaAUTOSAR/submodules/MCAL/Lin
ETH_PATH := D:/_E/projects/oss/NammaAUTOSAR/submodules/MCAL/Eth
OS_PATH := D:/_E/projects/oss/NammaAUTOSAR/submodules/SL/Os
OS_BUILDER_PATH := D:/_E/projects/oss/NammaAUTOSAR/tools/os_builder


# Link Archive File Path Definitions
LIBMCU := D:/_E/projects/oss/NammaAUTOSAR/submodules/MCAL/Mcu/libMcu.la
LIBMCU_STARTUP := D:/_E/projects/oss/NammaAUTOSAR/submodules/MCAL/Mcu/src/bsp/startup/rp2040/libMcu_Startup.la
LIBECUM := D:/_E/projects/oss/NammaAUTOSAR/submodules/SL/EcuM/libEcuM.la
LIBPORT := D:/_E/projects/oss/NammaAUTOSAR/submodules/MCAL/Port/libPort.la
LIBDIO := D:/_E/projects/oss/NammaAUTOSAR/submodules/MCAL/Dio/libDio.la
LIBSPI := D:/_E/projects/oss/NammaAUTOSAR/submodules/MCAL/Spi/libSpi.la
LIBLIN := D:/_E/projects/oss/NammaAUTOSAR/submodules/MCAL/Lin/libLin.la
LIBETH := D:/_E/projects/oss/NammaAUTOSAR/submodules/MCAL/Eth/libEth.la
LIBOS := D:/_E/projects/oss/NammaAUTOSAR/submodules/SL/Os/libOs.la
LIBNAMMATESTAPP := D:/_E/projects/oss/NammaAUTOSAR/submodules/AL/NammaTestApp/libNammaTestApp.la


# Link Archive Object List
LA_OBJS :=  $(LIBMCU) $(LIBMCU_STARTUP) $(LIBECUM) $(LIBPORT) $(LIBDIO) $(LIBSPI) $(LIBLIN) \
	     $(LIBETH) $(LIBOS) $(LIBNAMMATESTAPP)
