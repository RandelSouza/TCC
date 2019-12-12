# -*- coding: utf-8
#!/usr/bin/python
#from mininet.node import Controller
from mininet.node import RemoteController
from mininet.log import setLogLevel, info
#from mn_wifi.cli import CLI_wifi
from mn_wifi.net import Mininet_wifi
from mn_wifi.sixLoWPAN.link import sixLoWPANLink
import os
import sys
import random
reload(sys)
sys.setdefaultencoding('utf-8')


def topology():
    "creating the scenarios and capturing the latency values for each scenario."

    os.system("sudo mn -c 2>> /dev/null")

    ip = sys.argv[1]
    port = int(sys.argv[2])
    controllerName = sys.argv[3]
    nodesQuantity = int(sys.argv[4])
    flag = sys.argv[5]
    repeat_number = int(sys.argv[6])

    number_of_samples = ['0']
    subscribers = []
    publishers = []
    #broker_ip = "mqtt.eclipse.org"
    broker_ip = "2001::101"
    broker_port = 1883

    stations = []
    experimentName = 'latencia_'
    ipv6_extension = 0

    light_topic = ""
    door_topic = ""

    house_light_topics = []
    house_door_topics = []
    index = -1

    net = Mininet_wifi(controller=None)
    c0 = net.addController('c0', controller=RemoteController, ip=ip, port=port)

    info("*** Creating nodes\n")

    for i in range(nodesQuantity+1):
        nodeName = 'node{}'.format(i+1)
        nodeIp = '2001::{}/64'.format(i+1)
        stations.append( { nodeName : net.add6LoWPAN(nodeName, ip=nodeIp, position='{},{},0'.format(random.randint( 0, 1000 ), random.randint(0,1000))) } )

    # Add MQTT broker server
    #broker = net.add6LoWPAN( 'node{}'.format(101), ip='2001::101/64', position='{},{},0'.format(random.randint( 0, 1000 ), random.randint( 0, 1000 ) ) )

    ap1 = net.addAccessPoint('ap1', ssid="simplewifi", mode="g", channel="5", failMode='standalone', position='875.0,476.0,0')
    net.setPropagationModel(model="logDistance", exp=3)

    info("*** Configuring wifi nodes\n")
    rsul = net.configureWifiNodes()
    print "o resultado {}".format(rsul)

    info("*** Associating Stations\n")
    for i in range(nodesQuantity+1):
        net.addLink(stations[i]['node{}'.format(i+1)], cls=sixLoWPANLink, panid='0xbeef')
        net.addLink(stations[i]['node{}'.format(i+1)], ap1)

    #net.addLink( broker, cls=sixLoWPANLink, panid='0xbeef')
    #net.addLink( broker, ap1 )

    info("*** Starting network\n")
    net.build()

    ap1.start([c0])
    net.start()

    #station1 = net.get('sta1')
    #result = station1.cmd('ping6 -c10000 -i 0.0 -s {} {} >> ~/TCC/Experimento/resultados_experimento/{}_Nos_{}/{}{}_Numero_de_Nos_{}.txt'.format(random.randint(599, 999), '2001::2', controllerName, nodesQuantity, experimentName, controllerName, nodesQuantity))
    #info(result)
    #info("IP sta1 {}".format(station1.IP()))

    # configurnado o broker MQTT
    server = nodesQuantity + 1 #random.randint( 1, nodesQuantity )
    broker_node = net.get('node{}'.format( str( server ) ) )
    broker_node.cmd('mosquitto &')
    os.system('sleep 10')

    # configurando os assinantes e a qual topicos estao assinando
    subscribers = random.sample( range( 1, nodesQuantity + 1), ( nodesQuantity / 2 ) )
    random.shuffle(subscribers)

    #if server in subscribers:
	#subscribers.remove(server)

    for node in range(1, nodesQuantity + 1):
	if node not in subscribers:
	    publishers.append(node)

    random.shuffle(publishers)

    #if server in publishers:
	#publishers.remove(server)

    for subscriber in subscribers:
        subscriber_node = net.get( "node{}".format( str( subscriber ) ) )

	light_topic = "houseqxdlightnode{}".format( str( subscriber ) )
	door_topic = "houseqxddoornode{}".format( str( subscriber ) )

    	subscriber_node.cmd('mosquitto_sub -h {} -t {} >> ~/TCC/Experimento/resultados_experimento/{}_Nos_{}/mqtt/node{}_light.txt &'.format('2001::{}'.format(str(server)), light_topic, controllerName, nodesQuantity, str(subscriber) ) )
    	subscriber_node.cmd('mosquitto_sub -h {} -t {} >> ~/TCC/Experimento/resultados_experimento/{}_Nos_{}/mqtt/node{}_door.txt &'.format('2001::{}'.format(str(server)), door_topic, controllerName, nodesQuantity, str(subscriber) ) )

	house_light_topics.append(light_topic)
	house_door_topics.append(door_topic)

    print house_light_topics
    print house_door_topics

    # configurando os publicadores
    # mudar configuração para ip porta e topic rever entradas do código mqtt_publisher
    for publisher in publishers:
	index += 1
        publisher_node = net.get("node{}".format( str( publisher ) ) )

        #publisher_node.cmd("echo {} >> {}".format(house_light_topics[index], "~/log_light_mqtt{}_{}_{}.txt".format(controllerName, nodesQuantity, index)))
        #publisher_node.cmd("echo {} >> {}".format(house_door_topics[index], "~/log_door_mqtt{}_{}_{}.txt".format(controllerName, nodesQuantity, index)))

	publisher_node.cmd('sudo ~/TCC/Experimento/./mqtt_publisher.sh 2001::{} {} &'.format( str(server), house_light_topics[ index ] ) )
	publisher_node.cmd('sudo ~/TCC/Experimento/./mqtt_publisher.sh 2001::{} {} &'.format( str(server), house_door_topics[ index ] ) )

	#publisher_node.cmd('mosquitto_pub -h {} -t {} -m `date`'.format('2001::{}'.format(str(server)), house_light_topics[ index ] ) )
	#publisher_node.cmd('mosquitto_pub -h {} -t {} -m `date`'.format('2001::{}'.format(str(server)), house_door_topics[ index ] ) )


    # Percorre para cada station
    for sta in range(nodesQuantity):
        station = net.get( "node{}".format( str( sta + 1 ) ) )
	ipv6_extension = sta + 2

        if ipv6_extension > nodesQuantity:
	    ipv6_extension = 1

        station.cmd('ping6 -c500 -i 0.0 -s {} {} >> ~/TCC/Experimento/resultados_experimento/{}_Nos_{}/{}{}_Numero_de_Nos_{}.txt'.format(9999, '2001::{}'.format(ipv6_extension), controllerName, nodesQuantity, experimentName, controllerName, nodesQuantity))


    #while True:
#	number_of_samples = os.popen("cat ~/TCC/Experimento/resultados_experimento/{}_Nos_{}/{}{}_Numero_de_Nos_{}.txt | grep rtt | wc -l".format(controllerName, nodesQuantity, experimentName, controllerName, nodesQuantity)).read().splitlines()
#	print int(number_of_samples[0])

#	if repeat_number * nodesQuantity == int(number_of_samples[0]):
#	    break

    if controllerName == "Floodlight":
	if flag == "run":
            info("{}.\n".format("runing"))
	else:
           # result = os.popen("ps -ef | grep \"java -jar target/floodlight.jar\" | head -n1").read()
           # info(result)

            #result = filter(None, result.split(" "))
            #info(result[1])

            cmd = "sudo pkill {} 2>> /dev/null > /dev/null".format("java")
            os.system(cmd)
	    os.system("sudo kill $(ps aux | awk '/mosquitto/ {print $2}')")
	    os.system("sudo kill $(ps aux | awk '/floodlight/ {print $2}')")

    if controllerName == "POX":
	if flag == "run":
            info("{}.\n".format("runing"))
	else:
	    os.system("echo {} >> ~/pox/log".format("stopping"))

            result = os.popen("ps -ef | grep \"pox.py pox.forwarding.hub openflow.of_01\" | grep -v color=auto | head -n1").read()
            result = filter(None, result.split(" "))
            process1 = result[1]

            result = os.popen("ps -ef | grep \"pox.py pox.forwarding.hub openflow.of_01\"| head -n2 | grep -v color=auto | tail -n1").read()
            result = filter(None, result.split(" "))
            process2 = result[1]

            cmd = "sudo kill -9 {} 2>> /dev/null > /dev/null".format(process1)
            os.system(cmd)
            #os.system("echo Matando o Primeiro Proceso {} >> ~/pox/log".format(process1))

            cmd = "sudo kill -9 {} 2>> /dev/null > /dev/null".format(process2)
            os.system(cmd)
            #os.system("echo Matando o Segundo Proceso {} >> ~/pox/log".format(process2))
	    os.system("sudo kill $(ps aux | awk '/mosquitto/ {print $2}')")
	    os.system("sudo kill $(ps aux | awk '/pox/ {print $2}')")

    if controllerName == "Ryu":
	if flag == "run":
            info("{}.\n".format("runing"))
	else:

	    result = os.popen("ps -ef | grep \"sudo PYTHONPATH=. ./bin/ryu run --observe-links ryu/app/gui_topology/gui_topology.py --ofp-tcp-listen-port=6636\" | grep -v color=auto | head -n1" ).read()
	    result = filter(None, result.split(" "))
	    process1 = result[1]

	    result = os.popen("ps -ef | grep \"python ./bin/ryu run --observe-links ryu/app/gui_topology/gui_topology.py --ofp-tcp-listen-port=6636\" | grep -v color=auto | head -n1").read()
	    result = filter(None, result.split(" "))
	    process2 = result[1]

	    cmd = "sudo kill -9 {} 2>> /dev/null > /dev/null".format(process1)
	    os.system(cmd)
	    #info("Matando o Primeiro Proceso {}.\n".format(process1))

	    cmd = "sudo kill -9 {} 2>> /dev/null > /dev/null".format(process2)
	    os.system(cmd)
#	    info("Matando o Segundo Proceso {}.\n".format(process2))
	    os.system("sudo kill $(ps aux | awk '/mosquitto/ {print $2}')")
	    os.system("sudo kill $(ps aux | awk '/ryu/ {print $2}')")

    info("*** Stopping network\n")
    net.stop()

if __name__ == '__main__':
    setLogLevel('info')
    topology()
