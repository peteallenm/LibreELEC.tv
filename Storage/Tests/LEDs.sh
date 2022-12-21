#!/bin/sh

echo 1 > /sys/class/gpio/export
echo 0 > /sys/class/gpio/export

echo "out" > /sys/class/gpio/gpio0/direction
echo "out" > /sys/class/gpio/gpio1/direction

sleep 1
echo 1 > /sys/class/gpio/gpio1/value
echo 1 > /sys/class/gpio/gpio0/value

