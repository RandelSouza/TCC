# Trema
# Full-Stack OpenFlow Framework in Ruby and C
# Download this project as a .zip fileDownload this project as a tar.gz file
# Trema is a full-stack, easy-to-use framework for developing OpenFlow controllers in Ruby and C.
# “ I poked through Trema recently. It looks like a *great* project. Very clean. ”
# -Martin Casado, Nicira CTO



# Install
# Installation is very easy. Run gem install trema and straight away you have a working Trema installation.

# $ gem install trema
# If you prefer manual installation, download .tgz or .zip from the link in the upper right corner and build it as follows:

# $ tar xzvf trema-xyz.tar.gz
# $ cd trema-xyz/
# $ bundle install
# $ ./build.rb
# Writing Your Own Controller
# Trema OpenFlow Controller are simple Ruby scripts. Write your own OpenFlow controller by adding message handlers to your controller class just like Rails.

# class MyController < Controller
#   def packet_in dpid, message  # packet_in message handler
# ...
# end

# def features_reply dpid, message  # features_reply message handler
#     ...
# end
# ...
# end
# Running Your Controller
# You can test your controller right away without compilation:

# $ ./trema run mycontroller.rb
# This one simple trema run command enables the closed loop of "Coding, run, and debug".

# Network Emulator
# With Trema network DSL, you can describe the network topology in which the controller is executed.

# One virtual switch + two virtual hosts.
#vswitch { dpid "0xabc" }
# vhost "host1"
# vhost "host2"
# link "0xabc", "host1"
# link "0xabc", "host2"
# # Then you can pass the network configuration to trema run.

# $ ./trema run mycontroller.rb -c network.conf
# Sample Code
# [trema]/src/examples/ directory includes some simple samples demonstrating Trema API usage. They are good references for understanding both Ruby and C APIs.
# Trema Apps repository includes practical/experimental controllers developed on top of Trema. It is a good starting point for developing real-world controllers.# 
# Trema
# Trema
# Full-Stack OpenFlow Framework in Ruby and C
# Download this project as a .zip fileDownload this project as a tar.gz file
# Trema is a full-stack, easy-to-use framework for developing OpenFlow controllers in Ruby and C.
# “ I poked through Trema recently. It looks like a *great* project. Very clean. ”
# -Martin Casado, Nicira CTO



# Install
# Installation is very easy. Run gem install trema and straight away you have a working Trema installation.

# $ gem install trema
# If you prefer manual installation, download .tgz or .zip from the link in the upper right corner and build it as follows:

# $ tar xzvf trema-xyz.tar.gz
# $ cd trema-xyz/
# $ bundle install
# $ ./build.rb
# Writing Your Own Controller
# Trema OpenFlow Controller are simple Ruby scripts. Write your own OpenFlow controller by adding message handlers to your controller class just like Rails.

# class MyController < Controller
#   def packet_in dpid, message  # packet_in message handler
# ...
# end

# def features_reply dpid, message  # features_reply message handler
#     ...
# end
# ...
# end
# Running Your Controller
# You can test your controller right away without compilation:

# $ ./trema run mycontroller.rb
# This one simple trema run command enables the closed loop of "Coding, run, and debug".

# Network Emulator
# With Trema network DSL, you can describe the network topology in which the controller is executed.

# One virtual switch + two virtual hosts.
