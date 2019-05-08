#!/usr/bin/python

'This example show how to enable wifi and 6lowpan together'

from mininet.node import Controller
from mininet.node import RemoteController
from mininet.log import setLogLevel, info
from mn_wifi.cli import CLI_wifi
from mn_wifi.net import Mininet_wifi
from mn_wifi.sixLoWPAN.link import sixLoWPANLink
import os
import sys

def topology():
    "Create a network."    
    os.system("sudo mn -c 2>> /dev/null") # Por conta de um error
    ip = sys.argv[1]
    port = int(sys.argv[2])
    controllerName = sys.argv[3]
    nodesQuantity = int(sys.argv[4])
    stations = []
    #accessPoints = []

    net = Mininet_wifi(controller=None)
    net.addController('c0', controller=RemoteController, ip=ip, port=port)

    info("*** Creating nodes\n")

    for i in range(nodesQuantity):
        nodeName = 'sta{}'.format(i+1)
        nodeIp = '2001::{}/64'.format(i+1)
        stations.append( { nodeName : net.addStation( nodeName, sixlowpan=1, wpan_ip=nodeIp ) } )

    ap1 = net.addAccessPoint('ap1', ssid="simplewifi", mode="g", channel="5", failMode='standalone')

    #sta1 = net.addStation('sta1', sixlowpan=1, wpan_ip='2001::1/64')
    #sta2 = net.addStation('sta2', sixlowpan=1, wpan_ip='2001::2/64')
    #ap1 = net.addAccessPoint('ap1', ssid="simplewifi", mode="g", channel="5", failMode='standalone')

    info("*** Configuring wifi nodes\n")
    net.configureWifiNodes()

    info("*** Associating Stations\n")

    for i in range(nodesQuantity):
        #info('sta{}'.format(i+1))
        net.addLink(stations[i]['sta{}'.format(i+1)], cls=sixLoWPANLink, panid='0xbeef')
        net.addLink(stations[i]['sta{}'.format(i+1)], ap1)


    #net.addLink(sta1, cls=sixLoWPANLink, panid='0xbeef')
    #net.addLink(sta2, cls=sixLoWPANLink, panid='0xbeef')
    #net.addLink(sta1, ap1)
    #net.addLink(sta2, ap1)

    info("*** Starting network\n")
    net.build()
    ap1.start([])

    #info("*** Running CLI\n")
    #CLI_wifi(net)
    #station1 = net.get('sta1')
    station1 = net.get('sta1')
    #print sta2.IP()
    #result = station1.cmd('ping6 -c5 %s >> testPing.txt' % sta2.IP())
    result = station1.cmd('ping6 -c3 {} 2>> {}{}{}.txt'.format('2001::2','testPing', controllerName, nodesQuantity))
    print result
    print "IP sta1 {}".format(station1.IP())
    result = os.popen("ps -ef | grep \"jar target/floodlight.jar\" | head -n1").read()
    print result

    result = filter(None, result.split(" "))
    print result[1]

    cmd = "sudo kill -9 {}".format(result[1])
    os.system(cmd)

    info("*** Stopping network\n")
    net.stop()


if __name__ == '__main__':
    setLogLevel('info')
    topology()
