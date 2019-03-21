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

# Floodlight v1.2 and Below
# To download dependencies for Floodlight v1.2 and below:

sudo apt-get install build-essential openjdk-7-jdk ant maven python-dev eclipse

# Download And Build
