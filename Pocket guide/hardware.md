# Component markering

One trick to make the marking on chip more clear is smear white toothpaste on them this will make the marking easier to see. 



# UART

When UART pins aren’t marked as clearly as those shown here, you can typically
identify them on a device in two ways: by using a multimeter or by using a logic
analyzer. A multimeter measures voltage, current, and resistance. Having a multimeter
in your arsenal when doing hardware hacking is highly important, because it can serve a
variety of purposes. For example, we commonly use it to test for continuity. A continuity
test sounds a buzzer when a circuit’s resistance is low enough (less than a few ohms),
indicating that there’s a continuous path between the two points probed by the
multimeter’s leads.

To identify UART pinouts using a multimeter, start by making sure the device is
powered off. By convention, you should connect a black test lead to the multimeter’s
COM jack. Insert a red lead in the VΩ jack.
Begin by identifying the UART GND. Turn the multimeter dial to the Continuity Test
mode, which typically has an icon that looks like a sound wave. It might share a spot on
the dial with one or more functions, usually resistance. Place the other end of the black
lead on any grounded metallic surface (an area that has a direct conductive path to
earth), be it a part of the tested PCB or not.
Then place the red probe on each of the ports you suspect might be part of the UART
pinout. When you hear a beeping sound from the multimeter, you’ve found a GND pin.
Keep in mind that the device might have more than one GND pin and you might have
found one that isn’t necessarily part of the UART pinout.
Continue by identifying the Vcc port. Turn the multimeter dial to the DC voltage mode
in and set it up to 20 V of voltage. Keep the multimeter’s black probe on a grounded
surface. Place the red probe in a suspected pad and turn on the device. If the multimeter
measures a constant voltage of either 3.3 V or 5 V, you’ve found the Vcc pin. If you get
other voltages, place the red probe on another port, reboot the device, and measure the
voltage again. Do the same for every port until you identify Vcc.
Next, identify the TX port. Keep the multimeter mode at a DC voltage of 20 V or less,
and leave the black probe in a grounded surface. Move the red probe to the suspected
pad and power cycle the device. If the voltage fluctuates for a few seconds and then
stabilizes at the Vcc value (either 3.3 or 5), you’ve most likely found the TX port. This
behavior happens because, during bootup, the device sends serial data through that TX
port for debugging purposes. Once it finishes booting, the UART line goes idle. Recall
from Figure 7-1 that an idle UART line remains at a logical high, which means that it has
the Vcc value.
If you’ve already identified the rest of the UART ports, the nearby fourth pin is most
likely the RX port. Otherwise, you can identify it because it has the lowest voltage
fluctuation and lowest overall value of all the UART pins.

```
It’s not a big deal if you confuse the UART RX and TX ports with each other,
because you can easily swap the wires connecting to them without any
consequences. But confusing the Vcc with the GND and connecting wires to
them incorrectly might fry the circuit.
```

# JTAG

Sometimes a PCB has markings indicating the location of a JTAG header (Figure 7-6).
But most times you’ll have to manually identify the header, as well as which pins
correspond to the four signals (TDI, TDO, TCK, and TMS).
Figure 7-6: Sometimes the JTAG header is clearly marked on the PCB, as in this mobile Point of Sale (POS) device,
where even the individual JTAG pins are labeled (TMS, TDO, TDI, TCK).
You can take several approaches to identify JTAG pins on a target device. The fastest
but most expensive way to detect JTAG ports is by using the JTAGulator, a device
created specifically for this purpose (although it can also detect UART pinouts). The
tool, shown in Figure 7-7, has 24 channels that you can connect to a board’s pins. It
performs a brute force of these pins by issuing the IDCODE and BYPASS boundary scan
commands to every permutation of pins and waits for a response. If it receives a
response, it displays the channel corresponding to each JTAG signal, allowing you to
identify the JTAG pinout.