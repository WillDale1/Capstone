#Need to commment out these libraries for right now, does work when coding on RPi

#import time
#import board
#import adafruit_tpa2016
#import adafruit_tca9548a
#import adafruit_max9744
import pygame
from pygame import mixer




# Starting the mixer

# Create I2C bus as normal
#i2c = board.I2C()  # uses board.SCL and board.SDA

# Create the TCA9548A object and give it the I2C bus
#tca = adafruit_tca9548a.TCA9548A(i2c)


# For each sPEAKER
#tpa1 = adafruit_tpa2016.TPA2016(tca[2])
#tpa2 = adafruit_tpa2016.TPA2016(tca[3])
#tpa3 = adafruit_tpa2016.TPA2016(tca[4])
#max1 = adafruit_max9744.MAX9744(tca[5])






#TPA2016 controls this aspect:


#Want to set all the amplifiers to ON when first running the code (Also when you run it again. Messes up if you do not initialize it with False)
#tpa1.amplifier_shutdown = False #equivalent to this line is right below
#tpa2.amplifier_shutdown = False #equivalent to this line is right below
#tpa3.amplifier_shutdown = False #equivalent to this line is right below
amplifier_state = False


#tpa1.speaker_enable_l = True #equivalent to this line is right below
#tpa2.speaker_enable_l = True #equivalent to this line is right below
#tpa3.speaker_enable_l = True #equivalent to this line is right below
left_speaker_state = True

#tpa1.speaker_enable_r = True #equivalent to this line is right below
#tpa2.speaker_enable_r = True #equivalent to this line is right below
#tpa3.speaker_enable_r = True #equivalent to this line is right below
right_speaker_state = True



def RightOrientationInstructions():
    print("1:Adjust Gain\n2:Turn off/on Amplifier\n3:Disable/Enable Left Orientation Speaker\n4:Disable/Enable Right Orientation Speaker\n5:Exit to main menu")



    user_select = int(input())
    if user_select == 1:
        #Fixed Gain settings
        print("Set Fixed Gain Between: -28 to 30")
        set_user_fixed_gain = int(input())
        #tpa1.fixed_gain = set_user_fixed_gain
        print("Fixed gain set at:", set_user_fixed_gain)


        #Max Gain settings
        print("\n\nSet Max Gain Between: 18 to 30")
        set_user_max_gain = int(input())
        #tpa1.max_gain = set_user_max_gain
        print("Max gain set at:", set_user_max_gain)


    elif user_select == 2:
        print("Press '+' to turn ON Amplifier\nPress '-' to turn OFF Amplifier")
        user_amplifier_condition = input(" ")
        if user_amplifier_condition == '+':
            #tpa1.amplifier_shutdown = False
            amplifier_state = False
        elif user_amplifier_condition == '-':
            #tpa1.amplifier_shutdown = True
            amplifier_state = True
        #print("Current state of Amplifier:", tpa1.amplifier_shutdown)          #might not work,lets see what amplifier_shutdown prints out
        print (amplifier_state)

    elif user_select == 3:
        print("Press '+' to turn enable Left Speaker\nPress '-' to disable Left Speaker")
        user_left_speaker_select = input(" ")
        if user_left_speaker_select == '+':
            #tpa1.speaker_enable_l = True
            left_speaker_state = True
        elif user_left_speaker_select == '-':
            #tpa1.speaker_enable_l = False
            left_speaker_state = False
        #print("Current state of Left Orientation Speaker:", #tpa1.speaker_enable_l)
        print (left_speaker_state)
    elif user_select == 4:
        print("Press '+' to turn enable Right Speaker\nPress '-' to disable Right Speaker")
        user_right_speaker_select = input(" ")
        if user_right_speaker_select == '+':
            ##tpa1.speaker_enable_r = True
            right_speaker_state = True
        elif user_right_speaker_select == '-':
            right_speaker_state = False
            #tpa1.speaker_enable_r = False
        print (right_speaker_state)
        #print("Current state of Right Orientation Speaker:", #tpa1.speaker_enable_r)
    elif user_select == 5:
        exit



def LeftOrientationInstructions():
    print("1:Adjust Gain\n2:Turn off/on Speaker\n3:Disable/Enable Left Orientation Speaker\n4:Disable/Enable Right Orientation Speaker\n5:Exit to main menu")


    user_select = int(input())
    if user_select == 1:
        #Fixed Gain settings
        print("Set Fixed Gain Between: -28 to 30")
        set_user_fixed_gain = int(input())
        #tpa2.fixed_gain = set_user_fixed_gain
        print("Fixed gain set at:", set_user_fixed_gain)


        #Max Gain settings
        print("\n\nSet Max Gain Between: 18 to 30")
        set_user_max_gain = int(input())
        #tpa2.max_gain = set_user_max_gain
        print("Max gain set at:", set_user_max_gain)


    elif user_select == 2:
        print("Press '+' to turn ON Amplifier\nPress '-' to turn OFF Amplifier")
        user_amplifier_condition = input(" ")
        if user_amplifier_condition == '+':
            #tpa2.amplifier_shutdown = False
            amplifier_state = False
        elif user_amplifier_condition == '-':
            #tpa2.amplifier_shutdown = True
            amplifier_state = True
        #print("Current state of Amplifier:", tpa2.amplifier_shutdown)          #might not work,lets see what amplifier_shutdown prints out
        print (amplifier_state)

    elif user_select == 3:
        print("Press '+' to turn enable Left Speaker\nPress '-' to disable Left Speaker")
        user_left_speaker_select = input(" ")
        if user_left_speaker_select == '+':
            #tpa2.speaker_enable_l = True
            left_speaker_state = True
        elif user_left_speaker_select == '-':
            #tpa2.speaker_enable_l = False
            left_speaker_state = False
        #print("Current state of Left Orientation Speaker:", #tpa2.speaker_enable_l)
        print (left_speaker_state)
    elif user_select == 4:
        print("Press '+' to turn enable Right Speaker\nPress '-' to disable Right Speaker")
        user_right_speaker_select = input(" ")
        if user_right_speaker_select == '+':
            ##tpa2.speaker_enable_r = True
            right_speaker_state = True
        elif user_right_speaker_select == '-':
            right_speaker_state = False
            #tpa2.speaker_enable_r = False
        print (right_speaker_state)
        #print("Current state of Right Orientation Speaker:", #tpa2.speaker_enable_r)
    elif user_select == 5:
        exit

def MiddleOrientationInstructions():
    print("1:Adjust Gain\n2:Turn off/on Speaker\n3:Disable/Enable Left Orientation Speaker\n4:Disable/Enable Right Orientation\n5:Exit to main menu")

    user_select = int(input())
    if user_select == 1:
        #Fixed Gain settings
        print("Set Fixed Gain Between: -28 to 30")
        set_user_fixed_gain = int(input())
        #tpa3.fixed_gain = set_user_fixed_gain
        print("Fixed gain set at:", set_user_fixed_gain)


        #Max Gain settings
        print("\n\nSet Max Gain Between: 18 to 30")
        set_user_max_gain = int(input())
        #tpa3.max_gain = set_user_max_gain
        print("Max gain set at:", set_user_max_gain)


    elif user_select == 2:
        print("Press '+' to turn ON Amplifier\nPress '-' to turn OFF Amplifier")
        user_amplifier_condition = input(" ")
        if user_amplifier_condition == '+':
            #tpa3.amplifier_shutdown = False
            amplifier_state = False
        elif user_amplifier_condition == '-':
            #tpa3.amplifier_shutdown = True
            amplifier_state = True
        #print("Current state of Amplifier:", tpa3.amplifier_shutdown)          #might not work,lets see what amplifier_shutdown prints out
        print (amplifier_state)

    elif user_select == 3:
        print("Press '+' to turn enable Left Speaker\nPress '-' to disable Left Speaker")
        user_left_speaker_select = input(" ")
        if user_left_speaker_select == '+':
            #tpa3.speaker_enable_l = True
            left_speaker_state = True
        elif user_left_speaker_select == '-':
            #tpa3.speaker_enable_l = False
            left_speaker_state = False
        #print("Current state of Left Orientation Speaker:", #tpa3.speaker_enable_l)
        print (left_speaker_state)
    elif user_select == 4:
        print("Press '+' to turn enable Right Speaker\nPress '-' to disable Right Speaker")
        user_right_speaker_select = input(" ")
        if user_right_speaker_select == '+':
            ##tpa3.speaker_enable_r = True
            right_speaker_state = True
        elif user_right_speaker_select == '-':
            right_speaker_state = False
            #tpa3.speaker_enable_r = False
        print (right_speaker_state)
        #print("Current state of Right Orientation Speaker:", #tpa3.speaker_enable_r)
    elif user_select == 5:
        exit
       



#MAX9744 controls this aspect
def VolumeForSpeakers():
    #initial volume settings
    #max1.volume = 31
    print("1:Set Volume\n2:Increase volume\n3:Decrease volume\n4:Mute volume")
    user_select = int(input())

    if user_select == 1:
        print("Set Volume level Between: 0 to 63")
        set_user_volume = int(input())
        #max1.volume = set_user_volume
        print("volume set at", set_user_volume)
    elif user_select == 2:
        #max1.volume_up()
        print("volume increased by 1. Choose another option from Main Menu")
    elif user_select == 3:
        #max1.volume_down()
        print("volume decreased by 1. Choose another option from Main Menu")
    elif user_select == 4:
        #max1.volume = 0
        print("Volume muted. Choose another option from Main Menu")
        
        
        
def MixerVolumeForSpeakers():           #only problem with this is that it is not too loud 
    #initial volume settings
    
    print("Set Initial Volume for speaker:")
    inital_set_user_volume = float(input())
    #mixer.music.set_volume(initial_set_user_volume)
    
    print("1:Set Volume\n2:Increase volume\n3:Decrease volume\n4:Mute volume")
    user_select = int(input())
    if user_select == 1:
        # Pausing the music
        #print ("Select volume between: 0.0 - 1.0")
        new_set_user_volume = int(input())
        #mixer.music.set_volume(new_set_user_volume)
        print("New volume set at:", new_set_user_volume)
        
    elif user_select ==2:
        # Resuming the music
        #mixer.music.unpause()
        new_set_user_volume = initial_set_user_volume+1
        #mixer.music.set_volume(new_set_user_volume)
        print("volume increased by 1. Choose another option from Main Menu")
    elif user_select == 3:
        new_set_user_volume = initial_set_user_volume-1
        #mixer.music.set_volume(new_set_user_volume)
        print("volume decreased by 1. Choose another option from Main Menu")
    elif user_select == 4:
        #mixer.music.set_volume(0.0)
        print("Volume muted. Choose another option from Main Menu")
        exit

print("Choose an option")
print ("p -- pause\nr --resume\nv--volume\nrs -- right speaker\nls --left speaker\nm -- middle speaker\ne -- exit")

while True:
        #this menu is going to go away, only using it right now
        #app will tell us what option user chose so I will get rid of menu
        query = input(" ")
        if query == "p":
            #mixer.music.pause()
            print("You chose pause. Choose another option now.")
        elif query == 'g':
            print ("You chose to play music. Choose another option now.")
            #mixer.music.unpause()
        elif query == 'r':
            print ("You choose resume. Choose another option now.")
            #mixer.music.unpause()
        elif query == 'rs':
            #call class that controls right speaker
            RightOrientationInstructions()
            print ("You finished controlling the right speaker. Choose another option now.")
        elif query == 'ls':
            #call class that controls left speaker
            LeftOrientationInstructions()
            print ("You finished controlling the left speaker. Choose another option now.")
        elif query == 'm':
            #call class that controls middle speaker
            MiddleOrientationInstructions()
            print ("You finished controlling the middle speaker. Choose another option now.")

        elif query == 'v':
            #call class that controls volume for all speakers
            VolumeForSpeakers()     #This volume function will be used when MAX9744 chip comes in
            
        elif query == 'e':
            print ("you choose exit")
            #mixer.music.stop()
            break



