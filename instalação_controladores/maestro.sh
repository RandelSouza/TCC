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
