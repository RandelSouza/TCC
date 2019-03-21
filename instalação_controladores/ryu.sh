# Getting Started
# What's Ryu
# Ryu is a component-based software defined networking framework.
# Ryu provides software components with well defined API's that make it easy for developers to create new network management and control
# applications. Ryu supports various protocols for managing network devices, such as OpenFlow, Netconf, OF-config, etc. About OpenFlow,
#Ryu supports fully 1.0, 1.2, 1.3, 1.4, 1.5 and Nicira Extensions.
# All of the code is freely available under the Apache 2.0 license. Ryu is fully written in Python.
# Quick Start
# Installing Ryu is quite easy:
sudo pip install ryu
# If you prefer to install Ryu from the source code:
git clone git://github.com/osrg/ryu.git
cd ryu; pip install .
# If you want to write your Ryu application, have a look at Writing ryu application document. After writing your application, just type:
ryu-manager yourapp.py
# Optional Requirements
# Some functions of ryu require extra packages:
# OF-Config requires lxml and ncclient
# NETCONF requires paramiko
# BGP speaker (SSH console) requires paramiko
# Zebra protocol service (database) requires SQLAlchemy
# If you want to use these functions, please install the requirements:
pip install -r tools/optional-requires
# Please refer to tools/optional-requires for details.
# Prerequisites
# If you got some error messages at the installation stage, please confirm dependencies for building the required Python packages.
# On Ubuntu(16.04 LTS or later):
