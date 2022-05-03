#Alexandro Bustamante
#Senior design code

#STandard libraries to use
import random
import pygame
from pygame import mixer
from os import listdir 
import smbus
import struct
import time 



#libraries needed to integrate with Application
#HAVE TO INCLUDE BOTH SUBSCRIBER AND PUBLISHER IN ONE PLACE
import paho.mqtt.client as mqtt
import paho.mqtt.publish as publish


#libraries needed to interact with Adafruit components 
import board
import adafruit_tpa2016
import adafruit_tca9548a


#two lines of code to be publisher
MQTT_SERVER = "localhost"
MQTT_PATH = "test_channel"



#include delaye to not have problems readin from I2C
bus = smbus.SMBus(1)
time.sleep(3)
address = 0x55


#Data I am sending to the App
v = bus.read_i2c_block_data(address, 0x08,2)
(voltage,) = struct.unpack('H', bytearray(v)[0:2])

if voltage < 3500:
    publish.single(MQTT_PATH, "Test", qos = 0, retain = True)
time.sleep(0.5)
print("Voltage: ", voltage, " mV")
publish.single(MQTT_PATH, "Voltage: ", voltage, " mV", hostname=MQTT_SERVER)



c = bus.read_i2c_block_data(address, 0x10,2)
(rem_cap,) = struct.unpack('H', bytearray(c)[0:2])
time.sleep(0.5)
print("Remaining Capacity: ", rem_cap, " mAh")
publish.single(MQTT_PATH, "Remaining Capacity: ", rem_cap, " mAh", hostname=MQTT_SERVER)


t = bus.read_i2c_block_data(address, 0x16,2)
(time_emp,) = struct.unpack('H', bytearray(t)[0:2])
time.sleep(0.5)
print("Time to empty: ",time_emp, " minutes")
publish.single(MQTT_PATH,"Time to empty: ",time_emp, " minutes", hostname=MQTT_SERVER)


pygame.mixer.init()


# Create I2C bus as normal
i2c = board.I2C()  # uses board.SCL and board.SDA

# Create the TCA9548A object and give it the I2C bus
tca = adafruit_tca9548a.TCA9548A(i2c)


# variable name and bus for each adafruit chip
tpa1 = adafruit_tpa2016.TPA2016(tca[0])
tpa2 = adafruit_tpa2016.TPA2016(tca[6])
tpa3 = adafruit_tpa2016.TPA2016(tca[7])





#TPA2016 controls this aspect
tpa1.amplifier_shutdown = False #equivalent to this line is right below
tpa2.amplifier_shutdown = False #equivalent to this line is right below
tpa3.amplifier_shutdown = False #equivalent to this line is right below



tpa1.speaker_enable_l = True #equivalent to this line is right below
tpa2.speaker_enable_l = True #equivalent to this line is right below
tpa3.speaker_enable_l = True #equivalent to this line is right below




tpa1.speaker_enable_r = True #equivalent to this line is right below
tpa2.speaker_enable_r = True #equivalent to this line is right below
tpa3.speaker_enable_r = True #equivalent to this line is right below






#same library music as the what the database system has
mp3_files = [ f for f in listdir('.') if f[-4:] == '.wav' ]
if not len(mp3_files) > 0:
    print("No mp3 files found!")
music_position_index = list(range(len(mp3_files)))
string_num_list = ['0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25']


initial_volume = 0.2
pygame.mixer.music.set_volume(initial_volume)





initial_song_pos = 0


#two def functions that make this portion of code the subscriber
def connectionStatus(client, userdata, flags, rc):
    mqttClient.subscribe("rpi/gpio")




    
def messageDecoder (client, userdata, msg):
    msg = msg.payload.decode(encoding = 'UTF-8')
    global initial_song_pos
    global initial_volume
    print(msg)
#Music controls
    if msg == "Play is pressed":
        
        mixer.music.unpause()
         
    elif msg in string_num_list:
        num_msg = int(msg)
        song = mp3_files[num_msg]
        print("\n\nYou have loaded ", song)
        pygame.mixer.music.load(song)
        mixer.music.play()

         
    elif msg == "Pause is pressed":
        mixer.music.pause()
        #
    elif msg == "Replay is pressed":
        mixer.music.rewind()
        mixer.music.play()
    
    elif msg == "Volume Up pressed":
        initial_volume = initial_volume + 0.1
        pygame.mixer.music.set_volume(initial_volume)

    elif msg == "Volume Down pressed":
        initial_volume = initial_volume - 0.1
        pygame.mixer.music.set_volume(initial_volume)

#Speaker 1 set controls
    elif msg == "speaker one set on":
        tpa1.amplifier_shutdown = False
        #print("speaker set 1 on") 
         
    elif msg == "speaker one set off":
        tpa1.amplifier_shutdown = True
        #print("speaker set 1 off")
         
    elif msg == "left speaker one off":
        tpa1.speaker_enable_l = False
        #print("Left speaker 1 off")
         
    elif msg == "right speaker one off":
        tpa1.speaker_enable_r = False
        #print("right speaker 1 off")
         
    elif msg == "right speaker one on":
        tpa1.speaker_enable_r = True
        #print("right speaker 1 on")
         
    elif msg == "left speaker one on":
        tpa1.speaker_enable_l = True
        #print("Left speaker 1 on")






#Speaker 2 set controls
    elif msg == "speaker two set on":
        tpa2.amplifier_shutdown = False
        #print("speaker set 2 on")
         
    elif msg == "speaker two set off":
        tpa2.amplifier_shutdown = True
        #print("speaker set 2 off")
         
    elif msg == "left speaker two off":
        tpa2.speaker_enable_l = False
        #print("Left speaker 2 off")
         
    elif msg == "right speaker two off":
        tpa2.speaker_enable_r = False
        #print("right speaker 2 off")
         
    elif msg == "right speaker two on":
        tpa2.speaker_enable_r = True
        #print("right speaker 2 on")
         
    elif msg == "left speaker two on":
        tpa2.speaker_enable_l = True
        #print("Left speaker 2 on")
        
        
        
        
        
        
#Speaker 3 set controls
    elif msg == "speaker three set on":
        tpa3.amplifier_shutdown = False
        #print("speaker set 3 on")
         
    elif msg == "speaker three set off":
        tpa3.amplifier_shutdown = True
        #print("speaker set 3 off")
         
    elif msg == "left speaker three off":
        tpa3.speaker_enable_l = False
        #print("Left speaker 3 off")
         
    elif msg == "right speaker three off":
        tpa3.speaker_enable_r = False
        #print("right speaker 3 off")
         
    elif msg == "right speaker three on":
        tpa3.speaker_enable_r = True
        #print("right speaker 3 on")
         
    elif msg == "left speaker three on":
        tpa3.speaker_enable_l = True
        #print("Left speaker 3 on")
         
    else:
        print("Invalid input, Choose another command")
         
 



clientName = "RPI4B"
serverAddress = "172.20.10.2"
mqttClient = mqtt.Client(clientName)
mqttClient.on_connect = connectionStatus
mqttClient.on_message= messageDecoder
mqttClient.connect(serverAddress)
mqttClient.loop_forever()