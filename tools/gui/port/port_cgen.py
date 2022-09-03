#
# Created on Sat Sep 03 2022 10:56:29 PM
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
import os

import arxml.port.arxml_port as arxml_port
import utils.search as search


def generate_headerfile(port_src_path, pins, pin_info):
    hf = open(port_src_path+"/cfg/Port_cfg.h", "w")
    hf.write("#ifndef NAMMA_AUTOSAR_PORT_CFG_H\n")
    hf.write("#define NAMMA_AUTOSAR_PORT_CFG_H\n\n")
    hf.write("// This file is autogenerated, any hand modifications will be lost!\n\n")
    hf.write("#include <Port_Types.h>\n\n\n")
    
    hf.write("typedef struct {\n")
    hf.write("\tPort_PinType pin_id;\n")
    hf.write("\tPort_PinDirectionType pin_dir;\n")
    hf.write("\tboolean pin_dir_changeable;\n")
    hf.write("\tPort_PinModeType pin_mode;\n")
    hf.write("\tPort_PinModeType pin_initial_mode;\n")
    hf.write("\tuint8 pin_level;\n")
    hf.write("\tboolean pin_mode_changeable;\n")
    hf.write("} PortPin;\n\n")
    
    hf.write("\n#define PORT_NUM_OF_PINS  ("+str(pins)+")\n")
    
    hf.write("typedef struct {\n")
    hf.write("\tPort_PinType num_pins;\n")
    hf.write("\tPortPin pin[PORT_NUM_OF_PINS];\n")
    hf.write("} Port_ConfigType;\n\n")
    
    hf.write("\n\n#endif\n")
    hf.close()


def generate_code(gui):
    cwd = os.getcwd()
    port_src_path = search.find_dir("Port", cwd+"/submodules/MCAL/")
    pins, pin_info = arxml_port.parse_arxml(gui.arxml_file)
    generate_headerfile(port_src_path, pins, pin_info)
    
