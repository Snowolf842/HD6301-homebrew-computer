#!/usr/bin/python2

import serial, time

def goodbye():
    print "Goodbye!"
    ser.close()
    file.close()
    exit()


file = open('EEPROMdump.bin', 'wb')
ser = serial.Serial('/dev/ttyACM0', 9600)

time.sleep(3)

ser.write([0x31, 0x00, 0x00])


if(ser.read() == "\x04"):
    print "Reading:"
else:
    print "No READALL_BEGIN received ! Stopping."
    goodbye()


file.write(ser.read(256))
print "Done."

goodbye()
