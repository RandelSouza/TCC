# Maestro is an “operating system” for orchestrating network control applications.
# Maestro provides interfaces for implementing modular network control applications
# to access and modify state of the network, and coordinate their interactions.
# Maestro is a platform for achieving automatic and programmatic network control
# functions using these modularized applications. Although this project focuses on building
# an OpenFlow controller using Maestro, Maestro is not only limited to OpenFlow networks.
# The programming framework of Maestro provides interfaces for:

# Introducing new customized control functions by adding modularized control components.
# Maintaining network state on behalf of the control components.
# Composing control components by specifying the execution sequencing and the shared network state of the components.
# Moreover, Maestro tries to exploit parallelism within a single machine to improve the system’s throughput performance.
# The fundamental feature of an OpenFlow network is that the controller is responsible for every flow’s initial establishment
# by contacting related switches. Thus the performance of the controller could be the bottleneck.
# In designing Maestro we try to require as little effort from programmers as possible to manage the parallelization.
# Instead Maestro handles most of the tedious and complicated job of managing work load distribution and worker threads scheduling. By design Maestro is both portable and scalable:

# Developed in Java (both the platform and the components) – Highly portable to various operating systems and architectures.
# Multi-threaded – Takes full advantage of multi-core processors.
# Maestro currently provides the control components for realizing either a learning switch network, or a routed network using OpenFlow switches. Some components such as the command line console, etc, are still not full-fledged. We plan to further enrich and enhance the functionality of Maestro in future releases. Notice that Maestro is licensed under the GNU Lesser General Public License version 2.1. Google-project’s LGPL directs only to the version 3, so we make it explicit here that Maestro # # is licensed under LGPL v2.1.
#----------------------------------------------------------------------------------------------------------------------------------------------#

# Introduction
# Thanks for trying Maestro! This short tutorial prepares you with the basic knowledge about how to use Maestro
# as an OpenFlow controller. Because it is an OpenFlow controller, this tutorial heavily relies on the latest OpenFlowTutorial.
# In this tutorial we are only going to shown you the most straight-forward way of setting up one such virtual environment using Ubuntu Linux 32bit
# to be able to run Maestro to control the switches inside it. For a complete explanation about setting setup a virtual machine
# and the emulated network topology, and for all other kinds of operating systems you are using, please check the OpenFlowTutorial
# to know more details. Of course if you are already very familiar with OpenFlow or you are already running your own OpenFlow network
# you can skip this OpenFlowTutorial section below and go directly with Maestro.

# The OpenFlowTutorial - Setup the Virtual OpenFlow Environment
# As a quick summary of the OpenFlowTutorial, you basically need to follow these steps below to setup
# an emulated virtual OpenFlow network environment:

# Download the VM image file from here. Then in your host machine, run:
# [host-machine]$ unzip OpenFlowTutorial-081910.vmware.zip

# and you will get a directory named "OpenFlowVM.vmwarevm", which we call the image directory from now on.

# Install VMPlayer. You need to register for an evaluation version. For example,
#  for the Ubuntu 32bit version, you will download the file named "VMware-Player-3.1.3-324285.i386.bundle". Then add execute permission to this file by:
# [host-machine]$ chmod +x VMware-Player-3.1.3-324285.i386.bundle

# Then, execute this file by:

# [host-machine]$ sudo ./VMware-Player-3.1.3-324285.i386.bundle

# It will pop up the dialog to finish the installation. Just default settings will work.

# Change directory to the image directory and start the virtual machine by:
# [host-machine]$ cd OpenFlowVM.vmwarevm [host-machine]$ vmplayer OpenFlowVM.vmx

# Both the username and the password are "openflow". After the virtual machine boots,
# you will get a window for the virtual machine with a shell terminal running. Run:

# [virtual-machine]$ ifconfig eth0

# to get the virtual machine's IP address. For example, you will get something like "192.168.212.128".
# This will be the IP address that you use SSH to connect to this virtual machine from the local host machine, by:

# [host-machine]$ ssh openflow@192.168.212.128

# Inside such a SSH terminal connected to the virtual machine (or the original windowed virtual machine terminal),
#  start a network topology using mininet by:
# v[virtual-machine]$ sudo mn --topo single,3 --mac --switch ovsk --controller remote

# This creates a network with one OpenFlow switch and three hosts described in the Start Network section in the OpenFlowTutorial.
# For more explanations, please refer to the OpenFlowTutorial.

# In the mininet console, you can try to let host h2 ping h3 to see whether they can talk to each other by:
# [virtual-machine]mininet> h2 ping -c3 h3

# Of course, because now we don't have a working controller, the switch is not functioning, thus the ping will fail.

# After done all of these previous steps, you have already successfully created a virtual OpenFlow network environment!
# Now we are right at before the Start Controller and view Startup messages in Wireshark section in the OpenFlowTutorial.
# You can definitely continue following that tutorial and try their basic controller and NOX. But since this tutorial is about
#  Maestro, we will use this virtual OpenFlow network environment to try Maestro instead. Let's go~

# Run Maestro
# What we are going to do is to replace all the default controller and NOX part in the OpenFlowTutorial with Maestro.

# Maestro is based on Java, so to be able to run Maestro you first need to have a Java environment.
# What we suggest to do is download the latest JDK from here to the virtual machine. Choose the right binary according to what operating system you have. For the Ubuntu 32bit, you can first copy the url to the installation file "jdk-6u22-linux-i586.bin", and then do:

# [virtual-machine]$ wget THE_COPIED_URL [virtual-machine]$ chmod +x jdk-6u22-linux-i586.bin [virtual-machine]$ ./jdk-6u22-linux-i586.bin

# After expanding and installing the JDK binary, you should also set the $JAVA_HOME environment variable. For bash users, you can add

# export JAVA_HOME=/the/path/to/where/you/installed/your/JDK

# into your ~/.bashrc file.

# If you do not want to manually install JDK, you can also just run (for Debian OSes)

# [virtual-machine]$ sudo apt-get update [virtual-machine]$ sudo apt-get install openjdk-6-jdk

# or for RPM-compatible OSes, you can run

# [virtual-machine]$ sudo yum update [virtual-machine]$ sudo yum install java-1.6.0-openjdk

# Next, because Maestro relies on Apache Ant to manage compilation of the code, you need to install
# it before running Maestro. For Debian OSes, you can just run

# [virtual-machine]$ sudo apt-get update [virtual-machine]$ sudo apt-get install ant

# For RPM-compatible OSes, you can run

# [virtual-machine]$ sudo yum update [virtual-machine]$ sudo yum install ant

# For Windows users or you can choose to download and install it manually from here.

# Yes, that will be all the dependencies! The next step is downloading the Maestro code here. After done this,
# unzip it so you get the "Maestro-0.1.0" directory. This will be the Maestro working directory. To build the entire project, just run:

# [virtual-machine]$ cd Maestro-0.1.0 [virtual-machine]$ ant

# It will compile all the .java files and generate corresponding .class files in the "build/" directory.
# You can also build the javadoc webpage files by running

# [virtual-machine]$ ant javadoc

# These webpage files will be in the "javadoc/" directory, which you can open with a web browser to see all
#  the documentations of the code. To clean up the build, just run

# [virtual-machine]$ ant clean

# To run Maestro, you need to provide two configuration files. First one is a configuration
#  file which contains a bunch of parameter numbers. There is one example file which can also be used as default
# parameter settings, the "conf/openflow.conf" file. See Using and Programming in Maestro for detailed discussion.
# The second file is the DAG configuration file. Two examples are provided: "learningswitch.dag" and "routing.dag".
# As indicated by their names, in them applications related to build a learning-switch like network, and a routing
# network are composed to fulfill the correct # functionality. More details about this can also be found in the design
#  document of Maestro: Using and Programming in Maestro

# For example, if you want to run the learning-switch functionality, in the Maestro working directory, you just type

# [virtual-machine]$ $JAVA_HOME/bin/java -cp build/ sys.Main conf/openflow.conf conf/learningswitch.dag 1

# to start the system. The last argument, "1" means that we want to run Maestro in interactive mode.
# Then you will see the Maestro command console, which at this point has very limited functionalities.
#  (If the last argument is 0, then the command console will not be started.) For example, in the console, you can type

# [virtual-machine]Maestro> print Please input the name of the view instance: [virtual-machine]Maestro> switches
