#Alexandro Bustamante
#Senior design code

import time
import board
import adafruit_tpa2016
import adafruit_tca9548a
import adafruit_max9744
import pygame
from pygame import mixer
from os import listdir

pygame.mixer.init()

# Create I2C bus as normal
i2c = board.I2C()  # uses board.SCL and board.SDA

# Create the TCA9548A object and give it the I2C bus
tca = adafruit_tca9548a.TCA9548A(i2c)


# variable name and bus for each adafruit chip
tpa1 = adafruit_tpa2016.TPA2016(tca[2])
tpa2 = adafruit_tpa2016.TPA2016(tca[3])
tpa3 = adafruit_tpa2016.TPA2016(tca[4])
max1 = adafruit_max9744.MAX9744(tca[5])






#TPA2016 controls this aspect

tpa1.amplifier_shutdown = False #equivalent to this line is right below
tpa2.amplifier_shutdown = False #equivalent to this line is right below
tpa3.amplifier_shutdown = False #equivalent to this line is right below
amplifier_state = False


tpa1.speaker_enable_l = True #equivalent to this line is right below
tpa2.speaker_enable_l = True #equivalent to this line is right below
tpa3.speaker_enable_l = True #equivalent to this line is right below
left_speaker_state = True

tpa1.speaker_enable_r = True #equivalent to this line is right below
tpa2.speaker_enable_r = True #equivalent to this line is right below
tpa3.speaker_enable_r = True #equivalent to this line is right below
right_speaker_state = True


mp3_files = [ f for f in listdir('.') if f[-4:] == '.wav' ]
if not len(mp3_files) > 0:
    print("No mp3 files found!")



def PlaySongFromMenu():
    print(*mp3_files,sep='\n')
    print("Choose which song to play (0 plays the first song)")
    user_song_input = int(input())
    song = mp3_files[user_song_input]
    print("\n\nYou have chosen to play", song,". You are now back to main menu")
    pygame.mixer.music.load(song)
    pygame.mixer.music.play()




def RightOrientationInstructions():
    print("1:Adjust Gain\n2:Turn off/on Amplifier\n3:Disable/Enable Left Orientation Speaker\n4:Disable/Enable Right Orientation")



    user_select = int(input())
    if user_select == 1:
        #Fixed Gain settings
        print("Set Fixed Gain Between: -28 to 30")
        set_user_fixed_gain = int(input())
        tpa1.fixed_gain = set_user_fixed_gain
        print("Fixed gain set at:", set_user_fixed_gain)


        #Max Gain settings
        print("\n\nSet Max Gain Between: 18 to 30")
        set_user_max_gain = int(input())
        tpa1.max_gain = set_user_max_gain
        print("Max gain set at:", set_user_max_gain)


    elif user_select == 2:
        print("Press '+' to turn ON Amplifier\nPress '-' to turn OFF Amplifier")
        user_amplifier_condition = input(" ")
        if user_amplifier_condition == '+':
            tpa1.amplifier_shutdown = False
            amplifier_state = False
        elif user_amplifier_condition == '-':
            tpa1.amplifier_shutdown = True
            amplifier_state = True

    elif user_select == 3:
        print("Press '+' to turn enable Left Speaker\nPress '-' to disable Left Speaker")
        user_left_speaker_select = input(" ")
        if user_left_speaker_select == '+':
            tpa1.speaker_enable_l = True
            left_speaker_state = True
        elif user_left_speaker_select == '-':
            tpa1.speaker_enable_l = False
            left_speaker_state = False
        
    elif user_select == 4:
        print("Press '+' to turn enable Right Speaker\nPress '-' to disable Right Speaker")
        user_right_speaker_select = input(" ")
        if user_right_speaker_select == '+':
            tpa1.speaker_enable_r = True
            right_speaker_state = True
        elif user_right_speaker_select == '-':
            tpa1.speaker_enable_r = False
            right_speaker_state = False




def LeftOrientationInstructions():
    print("1:Adjust Gain\n2:Turn off/on Speaker\n3:Disable/Enable Left Orientation Speaker\n4:Disable/Enable Right Orientation Speaker")


    user_select = int(input())
    if user_select == 1:
        #Fixed Gain settings
        print("Set Fixed Gain Between: -28 to 30")
        set_user_fixed_gain = int(input())
        tpa2.fixed_gain = set_user_fixed_gain
        print("Fixed gain set at:", set_user_fixed_gain)


        #Max Gain settings
        print("\n\nSet Max Gain Between: 18 to 30")
        set_user_max_gain = int(input())
        tpa2.max_gain = set_user_max_gain
        print("Max gain set at:", set_user_max_gain)


    elif user_select == 2:
        print("Press '+' to turn ON Amplifier\nPress '-' to turn OFF Amplifier")
        user_amplifier_condition = input(" ")
        if user_amplifier_condition == '+':
            tpa2.amplifier_shutdown = False
            amplifier_state = False
        elif user_amplifier_condition == '-':
            tpa2.amplifier_shutdown = True
            amplifier_state = True
        

    elif user_select == 3:
        print("Press '+' to turn enable Left Speaker\nPress '-' to disable Left Speaker")
        user_left_speaker_select = input(" ")
        if user_left_speaker_select == '+':
            tpa2.speaker_enable_l = True
            left_speaker_state = True
        elif user_left_speaker_select == '-':
            tpa2.speaker_enable_l = False
            left_speaker_state = False
    elif user_select == 4:
        print("Press '+' to turn enable Right Speaker\nPress '-' to disable Right Speaker")
        user_right_speaker_select = input(" ")
        if user_right_speaker_select == '+':
            tpa2.speaker_enable_r = True
            right_speaker_state = True
        elif user_right_speaker_select == '-':
            tpa2.speaker_enable_r = True
            right_speaker_state = False

def MiddleOrientationInstructions():
    print("1:Adjust Gain\n2:Turn off/on Speaker\n3:Disable/Enable Left Orientation Speaker\n4:Disable/Enable Right Orientation")


    user_select = int(input())
    if user_select == 1:
        #Fixed Gain settings
        print("Set Fixed Gain Between: -28 to 30")
        set_user_fixed_gain = int(input())
        tpa3.fixed_gain = set_user_fixed_gain
        print("Fixed gain set at:", set_user_fixed_gain)


        #Max Gain settings
        print("\n\nSet Max Gain Between: 18 to 30")
        set_user_max_gain = int(input())
        tpa3.max_gain = set_user_max_gain
        print("Max gain set at:", set_user_max_gain)


    elif user_select == 2:
        print("Press '+' to turn ON Amplifier\nPress '-' to turn OFF Amplifier")
        user_amplifier_condition = input(" ")
        if user_amplifier_condition == '+':
            tpa3.amplifier_shutdown = False
            amplifier_state = False
        elif user_amplifier_condition == '-':
            tpa3.amplifier_shutdown = True
            amplifier_state = True
        

    elif user_select == 3:
        print("Press '+' to turn enable Left Speaker\nPress '-' to disable Left Speaker")
        user_left_speaker_select = input(" ")
        if user_left_speaker_select == '+':
            tpa3.speaker_enable_l = True
            left_speaker_state = True
        elif user_left_speaker_select == '-':
            tpa3.speaker_enable_l = False
            left_speaker_state = False
    elif user_select == 4:
        print("Press '+' to turn enable Right Speaker\nPress '-' to disable Right Speaker")
        user_right_speaker_select = input(" ")
        if user_right_speaker_select == '+':
            tpa3.speaker_enable_r = True
            right_speaker_state = True
        elif user_right_speaker_select == '-':
            tpa3.speaker_enable_r = True
            right_speaker_state = False









#MAX9744 controls this aspect
def VolumeForSpeakers():
    #initial volume settings
    max1.volume = 31
    print("1:Set Volume\n2:Increase volume\n3:Decrease volume\n4:Mute volume")
    user_select = int(input())

    if user_select == 1:
        print("Set Volume level Between: 0 to 63")
        set_user_volume = int(input())
        max1.volume = set_user_volume
        print("volume set at", set_user_volume)
    elif user_select == 2:
        max1.volume_up()
        print("volume increased by 1")
    elif user_select == 3:
        max1.volume_down()
        print("volume decreased by 1")
    elif user_select == 4:
        max1.volume = 0
        print("volume muted")







print("Choose an option")
print ("m -- Your Music Playlist\np -- pause\nr --resume\ns -- stop music\nv--volume\nrs -- right speaker\nls --left speaker\nm -- middle speaker\ne -- exit")

while True:
        #this menu is going to go away, only using it rn
        #app will tell us what option user chose so I will get rid of menu
        query = input(" ")

        if query == "p":
            mixer.music.pause()
            print("You chose pause. Choose another option.")
        elif query == 'r':
            print ("you choose resume.Choose another option.")
            mixer.music.unpause()
        elif query == 'm':
            print ("you choose Music Menu. Choose another option.\n\n")
            PlaySongFromMenu()
        elif query == 'rs':
            #call class that controls right speaker
            RightOrientationInstructions()

        elif query == 'ls':
            #call class that controls left speaker
            LeftOrientationInstructions()

        elif query == 'ms':
            #call class that controls middle speaker
            MiddleOrientationInstructions()

        elif query == 'v':
            #call class that controls volume for all speakers
            VolumeForSpeakers()
        elif query == 'e':
            print ("you choose exit")
            mixer.music.stop()
            break



