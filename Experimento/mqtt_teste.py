import paho.mqtt.client as mqtt
from threading import *
import sys
import Tkinter as tk
from time import *

class Mqtt_Light( object ):
    def __init__( self, label ):
        self.broker_url = "mqtt.eclipse.org"
        self.broker_port = 1883
        self.client = mqtt.Client()
        self.label = label
        self.light_state = 0
        self.client.on_connect = self.on_connect
        self.client.on_message = self.on_message

    def execute( self ):
        self.client.connect( self.broker_url, self.broker_port )
        self.client.subscribe( "houseqxd", qos=1 )

        try:
            self.client.loop_forever()
        except NameError:
            print "NameError"
        except TypeError:
            print "TypeError"
        except AttributeError:
            print "AttributeError"
        finally:
            print "Finally"

    def run( self ):
        self.t = Thread( target=self.execute, args=() )
        self.t.daemon = True
        self.t.start()

    def on_connect( self, client, userdata, flags, rc ):
        print( "Connected With Result Code " + rc )

    def on_message( self, client, userdata, message ):
        print ( "Message Recieved: " + message.payload.decode() )

        if message.payload.decode() == "1":
            if self.light_state != 1:
                print "Light on"
                self.light_state = 1
                self.label.update( self.label.light_on )
            else:
                print "The light is already on"

        if message.payload.decode() == "0":
            if self.light_state != 0:
                print "Light off"
                self.light_state = 0
                self.label.update( self.label.light_off )
            else:
                print "The light is already off"

        if message.payload.decode() == "exit":
            self.label.root.destroy()
            #self.t.stop()
            sys.exit(0)

class Label_Light( object ):
    def __init__( self ):
        self.root = tk.Tk()
        self.light_on = tk.PhotoImage( file="on.png" )
        self.light_off = tk.PhotoImage( file="off.png" )

        self.label = tk.Label( self.root, image=self.light_off )
        self.label.image = self.light_off
        self.label.pack()

    def update( self, image ):
        self.label.destroy()
        self.label = tk.Label( self.root, image=image )
        self.label.image = image
        self.label.pack()
        self.root.update_idletasks()

    def execute( self ):
        self.root.mainloop()


label_light = Label_Light()

mqtt_light = Mqtt_Light(label_light)
mqtt_light.run()

label_light.execute()
