# What is Beacon?
# Beacon is a fast, cross-platform, modular, Java-based OpenFlow controller that supports both event-based and threaded operation.

# Key features:

# Stable - Beacon has been in development since early 2010, and has been used in several research projects, networking classes, and trial deployments. Beacon currently powers a 100-vswitch, 20-physical switch experimental data center and has run for months without downtime.
# Cross-platform - Beacon is written in Java and runs on many platforms, from high end multi-core Linux servers to Android phones.
# Open source - Beacon is licensed under a combination of the GPL v2 license and the Stanford University FOSS License Exception v1.0.
# Dynamic - Code bundles in Beacon can be started/stopped/refreshed/installed at runtime, without interrupting other non-dependent bundles (ie replace your running Learning Switch application without disconnecting switches).
# Rapid Development - Beacon is easy to get up and running. Java and Eclipse simplify development and debugging of your applications.
# Fast - Beacon is multithreaded, check out performance benchmarks.
# Web UI - Beacon optionally embeds the Jetty enterprise web server and a custom extensible UI framework
# Frameworks - Beacon builds on mature Java frameworks such as Spring and Equinox (OSGi)

# Quick start

# encourage you to watch the screencast in fullscreen mode, with the video set to 720p or 1080p, it was recorded natively at 1080p.

# Checkout the OpenFlowJ and Beacon source
git clone https://bitbucket.org/openflowj/openflowj.git
git clone git://gitosis.stanford.edu/beacon.git
# For guide purposes we will assume these are checked out to ~/git/beacon and ~/git/openflowj

# Develop and build using Eclipse
# Prerequisites
# Java 6 JDK & JRE
# Eclipse for RCP and RAP Developers v3.7.0
# Setup
# Create a new Eclipse workspace if you are not starting from a fresh Eclipse install

# File ? Switch Workspace ? Other, pick a new folder to host the workspace
# Set Eclipse's compliance level to 1.6

# Window ? Preferences ? Java ? Compiler then under JDK Compliance, change Compiler compliance level to 1.6.
# Import the OpenFlowJ project

# File ? Import ? General ? Existing Projects into Workspace, Select ~/git/openflowj as the root directory, click ok, then select all the projects, ensure copy projects into workspace is not checked and click finish.
# Import the Beacon Eclipse projects

# File ? Import ? General ? Existing Projects into Workspace, Select ~/git/beacon as the root directory, click ok, then select all the projects, ensure copy projects into workspace is not checked and click finish.
# Set the target (runtime libraries)

# Open the Beacon Main Target project, double click the main.target file.
# Once opened, down in the right hand corner of Eclipse you should see a message saying Resolving Target Definition, wait for this to complete before proceeding.
# After the target has been resolved, click Set as Target Platform in the top right corner of the main.target window. (Note if you click before it has been resolved, you will receive an error). At this point all compilation errors should be gone.
# Import the Beacon code style settings

# Click Window ? Preferences. Then in the left column click Java ? Code Style ? Formatter, then click the Import button, and select ~/git/beacon/beacon_style_settings.xml and hit ok, then ensure the Active profile is Beacon.
# Running
# Launch Beacon in debug mode

# Run ? Debug Configurations
# Look for the OSGi Framework on the left, expand its children and select beacon, then click Debug
# Develop with your own editor and build using Maven
# Please note, Maven resolves, downloads, and caches all libraries needed for building at runtime, so the first build must download many libraries and its runtime is not representative of what you would see in your daily workflow.

# Prerequisites
# Java 6 JDK & JRE
# Maven 3.0
# Building OpenFlowJ
# Expected build time: ~3.5 seconds

# foo@bar:~/$ cd git/openflowj
# foo@bar:~/git/openflowj$ mvn install
# Building Beacon
# Expected build time: ~1 minute 10 seconds (full build, including tests)

# foo@bar:~/$ cd git/beacon/net.beaconcontroller.parent
# foo@bar:~/git/beacon/net.beaconcontroller.parent$ mvn integration-test
# Jars for each bundle are available under the bundle's target/ folder. Per-platform runnable instances of Beacon are available under beacon/net.beaconcontroller.product/target/products

# Next Steps
# Follow the Your First Bundle guide
# Check out the remaining Guides
# What is Beacon?
# Beacon is a fast, cross-platform, modular, Java-based OpenFlow controller that supports both event-based and threaded operation.

# Key features:

# Stable - Beacon has been in development since early 2010, and has been used in several research projects, networking classes, and trial deployments. Beacon currently powers a 100-vswitch, 20-physical switch experimental data center and has run for months without downtime.
# Cross-platform - Beacon is written in Java and runs on many platforms, from high end multi-core Linux servers to Android phones.
# Open source - Beacon is licensed under a combination of the GPL v2 license and the Stanford University FOSS License Exception v1.0.
# Dynamic - Code bundles in Beacon can be started/stopped/refreshed/installed at runtime, without interrupting other non-dependent bundles (ie replace your running Learning Switch application without disconnecting switches).
# Rapid Development - Beacon is easy to get up and running. Java and Eclipse simplify development and debugging of your applications.
# Fast - Beacon is multithreaded, check out performance benchmarks.
# Web UI - Beacon optionally embeds the Jetty enterprise web server and a custom extensible UI framework
# Frameworks - Beacon builds on mature Java frameworks such as Spring and Equinox (OSGi)

# Quick start

# encourage you to watch the screencast in fullscreen mode, with the video set to 720p or 1080p, it was recorded natively at 1080p.

# Checkout the OpenFlowJ and Beacon source
git clone https://bitbucket.org/openflowj/openflowj.git
git clone git://gitosis.stanford.edu/beacon.git
# For guide purposes we will assume these are checked out to ~/git/beacon and ~/git/openflowj

# Develop and build using Eclipse
# Prerequisites
# Java 6 JDK & JRE
# Eclipse for RCP and RAP Developers v3.7.0
# Setup
# Create a new Eclipse workspace if you are not starting from a fresh Eclipse install

# File ? Switch Workspace ? Other, pick a new folder to host the workspace
# Set Eclipse's compliance level to 1.6

# Window ? Preferences ? Java ? Compiler then under JDK Compliance, change Compiler compliance level to 1.6.
# Import the OpenFlowJ project

# File ? Import ? General ? Existing Projects into Workspace, Select ~/git/openflowj as the root directory, click ok, then select all the projects, ensure copy projects into workspace is not checked and click finish.
# Import the Beacon Eclipse projects

# File ? Import ? General ? Existing Projects into Workspace, Select ~/git/beacon as the root directory, click ok, then select all the projects, ensure copy projects into workspace is not checked and click finish.
# Set the target (runtime libraries)

# Open the Beacon Main Target project, double click the main.target file.
# Once opened, down in the right hand corner of Eclipse you should see a message saying Resolving Target Definition, wait for this to complete before proceeding.
# After the target has been resolved, click Set as Target Platform in the top right corner of the main.target window. (Note if you click before it has been resolved, you will receive an error). At this point all compilation errors should be gone.
# Import the Beacon code style settings

# Click Window ? Preferences. Then in the left column click Java ? Code Style ? Formatter, then click the Import button, and select ~/git/beacon/beacon_style_settings.xml and hit ok, then ensure the Active profile is Beacon.
# Running
# Launch Beacon in debug mode

# Run ? Debug Configurations
# Look for the OSGi Framework on the left, expand its children and select beacon, then click Debug
# Develop with your own editor and build using Maven
# Please note, Maven resolves, downloads, and caches all libraries needed for building at runtime, so the first build must download many libraries and its runtime is not representative of what you would see in your daily workflow.

# Prerequisites
# Java 6 JDK & JRE
# Maven 3.0
# Building OpenFlowJ
# Expected build time: ~3.5 seconds

# foo@bar:~/$ cd git/openflowj
# foo@bar:~/git/openflowj$ mvn install
# Building Beacon
# Expected build time: ~1 minute 10 seconds (full build, including tests)

# foo@bar:~/$ cd git/beacon/net.beaconcontroller.parent
# foo@bar:~/git/beacon/net.beaconcontroller.parent$ mvn integration-test
# Jars for each bundle are available under the bundle's target/ folder. Per-platform runnable instances of Beacon are available under beacon/net.beaconcontroller.product/target/products

# Next Steps
# Follow the Your First Bundle guide
# Check out the remaining Guides
# What is Beacon?
# Beacon is a fast, cross-platform, modular, Java-based OpenFlow controller that supports both event-based and threaded operation.

# Key features:

# Stable - Beacon has been in development since early 2010, and has been used in several research projects, networking classes, and trial deployments. Beacon currently powers a 100-vswitch, 20-physical switch experimental data center and has run for months without downtime.
# Cross-platform - Beacon is written in Java and runs on many platforms, from high end multi-core Linux servers to Android phones.
# Open source - Beacon is licensed under a combination of the GPL v2 license and the Stanford University FOSS License Exception v1.0.
# Dynamic - Code bundles in Beacon can be started/stopped/refreshed/installed at runtime, without interrupting other non-dependent bundles (ie replace your running Learning Switch application without disconnecting switches).
# Rapid Development - Beacon is easy to get up and running. Java and Eclipse simplify development and debugging of your applications.
# Fast - Beacon is multithreaded, check out performance benchmarks.
# Web UI - Beacon optionally embeds the Jetty enterprise web server and a custom extensible UI framework
# Frameworks - Beacon builds on mature Java frameworks such as Spring and Equinox (OSGi)

# Quick start

# encourage you to watch the screencast in fullscreen mode, with the video set to 720p or 1080p, it was recorded natively at 1080p.

# Checkout the OpenFlowJ and Beacon source
git clone https://bitbucket.org/openflowj/openflowj.git
git clone git://gitosis.stanford.edu/beacon.git
# For guide purposes we will assume these are checked out to ~/git/beacon and ~/git/openflowj

# Develop and build using Eclipse
# Prerequisites
# Java 6 JDK & JRE
# Eclipse for RCP and RAP Developers v3.7.0
# Setup
# Create a new Eclipse workspace if you are not starting from a fresh Eclipse install

# File ? Switch Workspace ? Other, pick a new folder to host the workspace
# Set Eclipse's compliance level to 1.6

# Window ? Preferences ? Java ? Compiler then under JDK Compliance, change Compiler compliance level to 1.6.
# Import the OpenFlowJ project

# File ? Import ? General ? Existing Projects into Workspace, Select ~/git/openflowj as the root directory, click ok, then select all the projects, ensure copy projects into workspace is not checked and click finish.
# Import the Beacon Eclipse projects

# File ? Import ? General ? Existing Projects into Workspace, Select ~/git/beacon as the root directory, click ok, then select all the projects, ensure copy projects into workspace is not checked and click finish.
# Set the target (runtime libraries)

# Open the Beacon Main Target project, double click the main.target file.
# Once opened, down in the right hand corner of Eclipse you should see a message saying Resolving Target Definition, wait for this to complete before proceeding.
# After the target has been resolved, click Set as Target Platform in the top right corner of the main.target window. (Note if you click before it has been resolved, you will receive an error). At this point all compilation errors should be gone.
# Import the Beacon code style settings

# Click Window ? Preferences. Then in the left column click Java ? Code Style ? Formatter, then click the Import button, and select ~/git/beacon/beacon_style_settings.xml and hit ok, then ensure the Active profile is Beacon.
# Running
# Launch Beacon in debug mode

# Run ? Debug Configurations
# Look for the OSGi Framework on the left, expand its children and select beacon, then click Debug
# Develop with your own editor and build using Maven
# Please note, Maven resolves, downloads, and caches all libraries needed for building at runtime, so the first build must download many libraries and its runtime is not representative of what you would see in your daily workflow.

# Prerequisites
# Java 6 JDK & JRE
# Maven 3.0
# Building OpenFlowJ
# Expected build time: ~3.5 seconds

# foo@bar:~/$ cd git/openflowj
# foo@bar:~/git/openflowj$ mvn install
# Building Beacon
# Expected build time: ~1 minute 10 seconds (full build, including tests)

# foo@bar:~/$ cd git/beacon/net.beaconcontroller.parent
# foo@bar:~/git/beacon/net.beaconcontroller.parent$ mvn integration-test
# Jars for each bundle are available under the bundle's target/ folder. Per-platform runnable instances of Beacon are available under beacon/net.beaconcontroller.product/target/products

# Next Steps
# Follow the Your First Bundle guide
# Check out the remaining Guides
# What is Beacon?
# Beacon is a fast, cross-platform, modular, Java-based OpenFlow controller that supports both event-based and threaded operation.

# Key features:

# Stable - Beacon has been in development since early 2010, and has been used in several research projects, networking classes, and trial deployments. Beacon currently powers a 100-vswitch, 20-physical switch experimental data center and has run for months without downtime.
# Cross-platform - Beacon is written in Java and runs on many platforms, from high end multi-core Linux servers to Android phones.
# Open source - Beacon is licensed under a combination of the GPL v2 license and the Stanford University FOSS License Exception v1.0.
# Dynamic - Code bundles in Beacon can be started/stopped/refreshed/installed at runtime, without interrupting other non-dependent bundles (ie replace your running Learning Switch application without disconnecting switches).
# Rapid Development - Beacon is easy to get up and running. Java and Eclipse simplify development and debugging of your applications.
# Fast - Beacon is multithreaded, check out performance benchmarks.
# Web UI - Beacon optionally embeds the Jetty enterprise web server and a custom extensible UI framework
# Frameworks - Beacon builds on mature Java frameworks such as Spring and Equinox (OSGi)

# Quick start

# encourage you to watch the screencast in fullscreen mode, with the video set to 720p or 1080p, it was recorded natively at 1080p.

# Checkout the OpenFlowJ and Beacon source
git clone https://bitbucket.org/openflowj/openflowj.git
git clone git://gitosis.stanford.edu/beacon.git
# For guide purposes we will assume these are checked out to ~/git/beacon and ~/git/openflowj

# Develop and build using Eclipse
# Prerequisites
# Java 6 JDK & JRE
# Eclipse for RCP and RAP Developers v3.7.0
# Setup
# Create a new Eclipse workspace if you are not starting from a fresh Eclipse install

# File ? Switch Workspace ? Other, pick a new folder to host the workspace
# Set Eclipse's compliance level to 1.6

# Window ? Preferences ? Java ? Compiler then under JDK Compliance, change Compiler compliance level to 1.6.
# Import the OpenFlowJ project

# File ? Import ? General ? Existing Projects into Workspace, Select ~/git/openflowj as the root directory, click ok, then select all the projects, ensure copy projects into workspace is not checked and click finish.
# Import the Beacon Eclipse projects

# File ? Import ? General ? Existing Projects into Workspace, Select ~/git/beacon as the root directory, click ok, then select all the projects, ensure copy projects into workspace is not checked and click finish.
# Set the target (runtime libraries)

# Open the Beacon Main Target project, double click the main.target file.
# Once opened, down in the right hand corner of Eclipse you should see a message saying Resolving Target Definition, wait for this to complete before proceeding.
# After the target has been resolved, click Set as Target Platform in the top right corner of the main.target window. (Note if you click before it has been resolved, you will receive an error). At this point all compilation errors should be gone.
# Import the Beacon code style settings

# Click Window ? Preferences. Then in the left column click Java ? Code Style ? Formatter, then click the Import button, and select ~/git/beacon/beacon_style_settings.xml and hit ok, then ensure the Active profile is Beacon.
# Running
# Launch Beacon in debug mode

# Run ? Debug Configurations
# Look for the OSGi Framework on the left, expand its children and select beacon, then click Debug
# Develop with your own editor and build using Maven
# Please note, Maven resolves, downloads, and caches all libraries needed for building at runtime, so the first build must download many libraries and its runtime is not representative of what you would see in your daily workflow.

# Prerequisites
# Java 6 JDK & JRE
# Maven 3.0
# Building OpenFlowJ
# Expected build time: ~3.5 seconds

# foo@bar:~/$ cd git/openflowj
# foo@bar:~/git/openflowj$ mvn install
# Building Beacon
# Expected build time: ~1 minute 10 seconds (full build, including tests)

# foo@bar:~/$ cd git/beacon/net.beaconcontroller.parent
# foo@bar:~/git/beacon/net.beaconcontroller.parent$ mvn integration-test
# Jars for each bundle are available under the bundle's target/ folder. Per-platform runnable instances of Beacon are available under beacon/net.beaconcontroller.product/target/products

# Next Steps
# Follow the Your First Bundle guide
# Check out the remaining Guides
# What is Beacon?
# What is Beacon?
# Beacon is a fast, cross-platform, modular, Java-based OpenFlow controller that supports both event-based and threaded operation.

# Key features:

# Stable - Beacon has been in development since early 2010, and has been used in several research projects, networking classes, and trial deployments. Beacon currently powers a 100-vswitch, 20-physical switch experimental data center and has run for months without downtime.
# Cross-platform - Beacon is written in Java and runs on many platforms, from high end multi-core Linux servers to Android phones.
# Open source - Beacon is licensed under a combination of the GPL v2 license and the Stanford University FOSS License Exception v1.0.
# Dynamic - Code bundles in Beacon can be started/stopped/refreshed/installed at runtime, without interrupting other non-dependent bundles (ie replace your running Learning Switch application without disconnecting switches).
# Rapid Development - Beacon is easy to get up and running. Java and Eclipse simplify development and debugging of your applications.
# Fast - Beacon is multithreaded, check out performance benchmarks.
# Web UI - Beacon optionally embeds the Jetty enterprise web server and a custom extensible UI framework
# Frameworks - Beacon builds on mature Java frameworks such as Spring and Equinox (OSGi)

# Quick start

# encourage you to watch the screencast in fullscreen mode, with the video set to 720p or 1080p, it was recorded natively at 1080p.

# Checkout the OpenFlowJ and Beacon source
git clone https://bitbucket.org/openflowj/openflowj.git
git clone git://gitosis.stanford.edu/beacon.git
# For guide purposes we will assume these are checked out to ~/git/beacon and ~/git/openflowj

# Develop and build using Eclipse
# Prerequisites
# Java 6 JDK & JRE
# Eclipse for RCP and RAP Developers v3.7.0
# Setup
# Create a new Eclipse workspace if you are not starting from a fresh Eclipse install

# File ? Switch Workspace ? Other, pick a new folder to host the workspace
# Set Eclipse's compliance level to 1.6

# Window ? Preferences ? Java ? Compiler then under JDK Compliance, change Compiler compliance level to 1.6.
# Import the OpenFlowJ project

# File ? Import ? General ? Existing Projects into Workspace, Select ~/git/openflowj as the root directory, click ok, then select all the projects, ensure copy projects into workspace is not checked and click finish.
