#!/usr/bin/python

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

    os.system("sudo mn -c 2>> /dev/null")

    ip = sys.argv[1]
    port = int(sys.argv[2])
    controllerName = sys.argv[3]
    nodesQuantity = int(sys.argv[4])
    flag = sys.argv[5]
    loss = int(sys.argv[6])
    delay = sys.argv[7]
    stations = []
    experimentName = 'PerdaDePacotes_Latencia_'

    net = Mininet_wifi(controller=None)
    c0 = net.addController('c0', controller=RemoteController, ip=ip, port=port)

    info("*** Creating nodes\n")

    for i in range(nodesQuantity):
        nodeName = 'sta{}'.format(i+1)
        nodeIp = '2001::{}/64'.format(i+1)
        stations.append( { nodeName : net.add6LoWPAN(nodeName, ip=nodeIp) } )

    ap1 = net.addAccessPoint('ap1', ssid="simplewifi", mode="g", channel="5", failMode='standalone')

    info("*** Configuring wifi nodes\n")
    rsul = net.configureWifiNodes()
    print "o resultado {}".format(rsul)


    linkConf = {'bw':1,'delay': delay,'loss': loss, 'max_queue_size': 1000, 'use_htb': True}

    info("*** Associating Stations\n")
    for i in range(nodesQuantity):
	# modificado delay e loss
        net.addLink(stations[i]['sta{}'.format(i+1)], cls=sixLoWPANLink, panid='0xbeef')
        #net.addLink(stations[i]['sta{}'.format(i+1)], bw=1, loss=loss,  delay=delay)
	net.addLink(stations[i]['sta{}'.format(i+1)], ap1, **linkConf )

    info("*** Starting network\n")
    net.build()
    ap1.start([c0])
    net.start()

    station1 = net.get('sta1')

    result = station1.cmd('ping6 -c30 -i 0.1 -s 800 {} >> /home/randel/resultados_experimento/{}_Nos_{}/{}{}_Numero_de_Nos_{}_loss_{}_delay_{}.txt'.format('2001::2', controllerName, nodesQuantity, experimentName, controllerName, nodesQuantity, loss, delay))
    info(result)
    info("IP sta1 {}".format(station1.IP()))


    if controllerName == "Floodlight":
	if flag == "run":
        	info("{}.\n".format("runing"))
	else:
            result = os.popen("ps -ef | grep \"floodlight\" | head -n1").read()
            info(result)

            result = filter(None, result.split(" "))
            info(result[1])

            cmd = "sudo kill -9 {} 2>> /dev/null > /dev/null".format(result[1])
            os.system(cmd)

    if controllerName == "POX":
	if flag == "run":
            info("{}.\n".format("runing"))
	else:
	    info("{}.\n".format("stopping"))

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
	if flag == "run":
            info("{}.\n".format("runing"))
	else:
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

    info("*** Stopping network\n")
    net.stop()

if __name__ == '__main__':
    setLogLevel('info')
    topology()
