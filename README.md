# FreeAUTOSAR
A project repo to create and learn AUTOSAR stack



What is NammaAUTOSAR?
---

NammaAUTOSAR is a intended to provide a free to use with no liability licensed (MIT) software, writen against AUTOSAR specification R2020-11. This is created to learn AUTOSAR standards practically. And therefore setting a path towards learning as well as teaching AUTOSAR core skills.

What is Namma? Namma means our in Tamil and Kannada. We used to say "Avan namma friendu" in Tamil. Which means "he is our friend". So, this is (y)our OSEK, free to use with no liability.

**Start date: 27 June 2021, Sunday**<br>
Motivation to create an OS came from Ashokkumar Narayanan (one of my best buddies in Visteon Chennai).


<br>

Getting Started
===

Prerequisites
----
* Ubuntu 20.04 OS (either on Linux or on WSL2 inside Windows)
  * Install following packages inside Ubuntu
    * `apt install gcc-arm-none-eabi qemu-system-arm gdb-multiarch python3`
* Windows 10 + MSYS2
  * Follow the instructions given in "Installation" section in https://www.msys2.org/
  * Install following packages by starting the **MSYS2 MSYS** terminal:
    * `pacman -Suy` 
    * `pacman -S mingw-w64-x86_64-python mingw-w64-x86_64-tk mingw-w64-x86_64-python-pip`
    * `pip install colorama`
    * `pacman -S mingw-w64-x86_64-arm-none-eabi-gcc mingw-w64-x86_64-qemu`
  * Create envirnomental variable with **VARIABLE NAME** as **MINGW_ROOT** and **VARIABLE VALUE** as **installation path**

<br>

Cloning the Repo
----
As NammaAUTOSAR uses git submodules, please use the following command to clone the main and submodules
* `git clone --recurse-submodules -j4 https://github.com/aananthcn/NammaAUTOSAR.git`


Starting the NammaAUTOSAR Builder
----
* To start the NammaAUTOSAR Builder GUI, first open the **MSYS2 MINGW64** terminal
* Navigate to the cloned repository
* Run this command in the **MSYS2 MINGW64** terminal - `py tools/autosar-gui.py`
* **NammaAUTOSAR Builder** GUI will open


Importing ARXML
----
* To import ARXML, go to File --> Import ARXML File. It will give 3 different ARXML like below
![image](https://user-images.githubusercontent.com/61110156/201695803-adf3e135-035e-4a83-ad0b-58f7b60012d9.png)
<img src="https://user-images.githubusercontent.com/61110156/201695803-adf3e135-035e-4a83-ad0b-58f7b60012d9.png" width="100" height="100">
* **NOTE:** It is advised to go with RaspberryPi-Pico.arxml for now, as it is tested and working well
* Select RaspberryPi-Pico.arxml and click on Open. AUTOSAR Layered Architecture view will open
* **NOTE:** Since this project in initial phase, only few modules are presented in the layered view


Configuration
----
* Click on the module, another window will open for configuration of various parameters
* Once all the configuration is done, the click on **Save Config** to update the changes and close the module specific window
* Repeat the steps for all the necessary modules


Importing NammaTestApp
----
* Click on **Applications** (1)
* Mention how many number of applications you want to import. In this case, I have given as 1
* Provide the **NammaTestApp** repository path in the App 0 - `https://github.com/aananthcn/NammaTestApp.git`
![image](https://user-images.githubusercontent.com/61110156/201701405-ca438c64-213a-4328-83c3-a1bc4ccc4ead.png)
<img src="https://user-images.githubusercontent.com/61110156/201701405-ca438c64-213a-4328-83c3-a1bc4ccc4ead.png" width="100" height="100">
* This will automatically import the NammaTestApp into respective folder


Code Generation
----
* Once all the configuration is done, click on the **Generate --> Generate Source**
* If all the changes are proper, then a popup with this message will be shown **Code Generated Successfully!**
![image](https://user-images.githubusercontent.com/61110156/201702795-53388e7c-2f6d-419f-aefd-8f6f7f6b61b2.png)
<img src="https://user-images.githubusercontent.com/61110156/201702795-53388e7c-2f6d-419f-aefd-8f6f7f6b61b2.png" width="100" height="100">
* Close the NammaAUTOSAR Builder GUI


Generate the ELF File
----
* In the MSYS2 MINGW64 terminal, type **make**
* This process will take sometime as it needs to compile all the source files and link them to generate the ELF file
