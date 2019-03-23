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
