#!/usr/bin/env python3
import pigpio
import time

center = 1480
on = 1160
off = 1670

t=time.localtime()


pi=pigpio.pi()
print("Good all good")

def light_center():
    pi.set_servo_pulsewidth(18, center)

def light_on():
    pi.set_servo_pulsewidth(18, on)

def light_off():
    pi.set_servo_pulsewidth(18, off)

def morning_rituals():
    count = 0

    while count <= 5:

        if count == 4:
            light_on()
            time.sleep(1)
            light_center()
            time.sleep(15)
            light_off()
            time.sleep(1)
            light_center()
            time.sleep(15)

        light_on()
        time.sleep(1)
        light_off()
        time.sleep(.5)
        light_on()
        time.sleep(1)
        light_off()
        time.sleep(.5)
        light_on()
        time.sleep(.5)
        light_off()
        time.sleep(1)
        light_on()

        count += 1




light_center()
print("it's",t.tm_hour,t.tm_min,"am",t.tm_mon,"/",t.tm_mday,"/",t.tm_year)

morning_rituals()

light_on()
time.sleep(1)
light_center()

time.sleep(15)
light_off()
time.sleep(4)
light_on()
time.sleep(.5)
light_center()
