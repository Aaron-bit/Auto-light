import pigpio

center = 1450
# on =
# off =

pi=pigpio.pi()




pi.set_servo_pulsewidth(18, center)


