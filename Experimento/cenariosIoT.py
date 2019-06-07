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

    net = Mininet_wifi(controller=None)
    c0 = net.addController('c0', controller=RemoteController, ip=ip, port=port)

    info("*** Creating nodes\n")

    for i in range(nodesQuantity):
        nodeName = 'sta{}'.format(i+1)
        nodeIp = '2001::{}/64'.format(i+1)
        #stations.append( { nodeName : net.addStation( nodeName, sixlowpan=1, wpan_ip=nodeIp ) } )
        stations.append( { nodeName : net.add6LoWPAN(nodeName, ip=nodeIp) } )
        #print stations[i][nodeName]

    ap1 = net.addAccessPoint('ap1', ssid="simplewifi", mode="g", channel="5", failMode='standalone')

    info("*** Configuring wifi nodes\n")
    rsul = net.configureWifiNodes()
    print "o resultado {}".format(rsul)

    info("*** Associating Stations\n")

    for i in range(nodesQuantity):
        net.addLink(stations[i]['sta{}'.format(i+1)], cls=sixLoWPANLink, panid='0xbeef')
        net.addLink(stations[i]['sta{}'.format(i+1)], ap1)

    info("*** Starting network\n")
    net.build()
    ap1.start([c0])
    net.start()

    #info("*** Running CLI\n")
    #CLI_wifi(net)

    station1 = net.get('sta1')

    #result = station1.cmd('ping6 -c5 %s >> testPing.txt' % sta2.IP())
    result = station1.cmd('ping6 -c2000 {} >> {}{}{}.txt'.format('2001::2','testPing', controllerName, nodesQuantity))
    info(result)
    info("IP sta1 {}".format(station1.IP()))

    if controllerName == "Floodlight":
        result = os.popen("ps -ef | grep \"floodlight\" | head -n1").read()
        info(result)

        result = filter(None, result.split(" "))
        info(result[1])

        cmd = "sudo kill -9 {} 2>> /dev/null > /dev/null".format(result[1])
        os.system(cmd)

    if controllerName == "POX":
        result = os.popen("ps -ef | grep \"pox.py pox.forwarding.hub openflow.of_01\"| head -n1").read()
        result = filter(None, result.split(" "))
        process1 = result[1]

        result = os.popen("ps -ef | grep \"pox.py pox.forwarding.hub openflow.of_01\"| head -n2 | tail -n1").read()
        result = filter(None, result.split(" "))
        process2 = result[1]

        cmd = "sudo kill -9 {} 2>> /dev/null > /dev/null".format(process1)
        os.system(cmd)
        info("Matando o Primeiro Proceso {}.\n".format(process1))

        cmd = "sudo kill -9 {} 2>> /dev/null > /dev/null".format(process2)
        os.system(cmd)
        info("Matando o Segundo Proceso {}.\n".format(process2))

    if controllerName == "Ryu":
        result = os.popen("ps -ef | grep \"ryu\"| head -n1").read()
        result = filter(None, result.split(" "))
        process1 = result[1]

        result = os.popen("ps -ef | grep \"ryu\"| head -n2 | tail -n1").read()
        result = filter(None, result.split(" "))
        process2 = result[1]

        cmd = "sudo kill -9 {} 2>> /dev/null > /dev/null".format(process1)
        os.system(cmd)
        info("Matando o Primeiro Proceso {}.\n".format(process1))

        cmd = "sudo kill -9 {} 2>> /dev/null > /dev/null".format(process2)
        os.system(cmd)
        info("Matando o Segundo Proceso {}.\n".format(process2))

        #result = os.popen("ps -ef | grep \"ryu\"| head -n1").read()
        #result = filter(None, result.split(" "))
        #process3 = result[1]

        #cmd = "sudo kill -9 {} 2>> /dev/null > /dev/null".format(process3)
        #os.system(cmd)
        #info("Matando o Terceiro Proceso {}.\n".format(process3))


    info("*** Stopping network\n")
    net.stop()

if __name__ == '__main__':
    setLogLevel('info')
    topology()
