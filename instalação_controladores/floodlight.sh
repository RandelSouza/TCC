#!/bin/bash

# https://floodlight.atlassian.net/wiki/spaces/floodlightcontroller/pages/1343544/Installation+Guide#InstallationGuide-Installation

# Installation

# Prerequisites
# Linux
  # Your favorite flavor of Linux
  # Java development kit
	# JDK 8 for Floodlight master and above
	# JDK 7 for Floodlight v1.2 and below
  # Ant or Maven to build
  # Python development package
  # Eclipse IDE (Eclipse Luna Preferred)

# Floodlight Master and Above

# To download Java 8, please refer to these instructions. Please download the latest version of Eclipse, making sure the version you choose supports Java 8. To download remaining dependencies for Floodlight master and above:

# Eclipse Luna version is recommended to successfully import Floodlight project. Other Eclipse version would work as well, just people sometimes might have trouble on configuring those versions(most of time, JDK issues and "unresolved compilation problem"). This tutorial is written and tested with Eclipse Luna version so that version is recommended. For Floodlight master branch, you should still ensure to have Java 8 installed in your environment and JDK 1.8 is correctly configured at Eclipse. 

sudo apt-get install build-essential ant maven python-dev eclipse

# Install Oracle Java 8 on Ubuntu
# You need to enable additional repository to your system to install Java 8 on Ubuntu VPS. After that install Oracle Java 8 on an Ubuntu system using apt-get. This repository contains a package named oracle-java8-installer, Which is not an actual Java package. Instead of that, this package contains a script to install Java on Ubuntu.

# Run below commands to install Java 8 on Ubuntu and LinuxMint.

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

sudo su

cat >> /etc/environment <<EOL
JAVA_HOME=/usr/lib/jvm/java-8-oracle
JRE_HOME=/usr/lib/jvm/java-8-oracle/jre
EOL

exit

# Download And Build

# Floodlight is simple to download from Github and build. Please follow the following steps to either download and install a new copy of Floodlight or update an existing installation of Floodlight:

# Installing Floodlight from Scratch

# The "git clone" step below uses the master version of Floodlight. To use a specific version, specify the version branch in the "git clone" step by appending "-b <branch-name>", e.g. "-b v1.2".

git clone git://github.com/floodlight/floodlight.git
cd floodlight
git submodule init
git submodule update
ant

sudo mkdir /var/lib/floodlight
sudo chmod 777 /var/lib/floodlight

# Running Floodlight in the Terminal
# Assuming java is in your path, you can directly run the floodlight.jar file produced by ant from within the floodlight directory:

# testing controller run
java -jar target/floodlight.jar

# -------------------------------------------------------------- 

# Updating an Existing Floodlight Installation
# The following steps show how to update Floodlight to master. Substitute "master" in the "git pull" step with your desired version's branch, e.g. "v1.1", "v1.2", etc. if you would like to switch to a different version.

# cd floodlight
# git pull origin master
# git submodule init
# git submodule update

# If you are upgrading from Floodlight v1.2 or below to a newer version or the master branch, you should update to Java 8 at this point. Others should already have Java 8 installed or do not require it (if downgrading to v1.2 or below). Once you have satisfied this requirement, proceed with re-building the controller:


# Simulating A Network
# Now that Floodlight is running, you need to attach it to an OpenFlow network. One of the best tools for this is Mininet, a network simulation tool.

# Download the Floodlight VM. It includes Floodlight and Mininet.
# Start it in VMware Fusion or VirtualBox
Login (username is floodlight and password is floodlight)
Its possible to run Mininet against the locally running Floodlight (just type "sudo mn") but you can also run it against a remote controller you built as well.  To do that, type:
