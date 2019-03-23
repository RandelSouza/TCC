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
