//*****************************************************************************
//
// blinky.c - Simple example to blink the on-board LED.
// Modified version of the TI blinky example designed to work my build enviroment
// Also make it so it cycles though the multicolor led that is on the board.
//
// Peter Fetterer
//*****************************************************************************

#include <lm4f120h5qr.h>

//*****************************************************************************
//
// Blink the on-board RGB LED though the 3 color cycles.
//
//*****************************************************************************
int
main(void)
{
    volatile unsigned long ulLoop;

    //
    // Enable the GPIO port that is used for the on-board LED.
    //
    SYSCTL_RCGC2_R = SYSCTL_RCGC2_GPIOF;

    //
    // Do a dummy read to insert a few cycles after enabling the peripheral.
    //
    ulLoop = SYSCTL_RCGC2_R;

    // LED DEFINITONS
    #define LED_GREEN 0x08    // PF3
    #define LED_BLUE  0x04    // PF2
    #define LED_RED   0x02    // PF1

    // SWITCH DEFINITIONS
    #define SW1       0x10    // PF4
    #define SW2       0x01    // PF0

    //
    // Enable the GPIO pin for the LEDS (PF3).  Set the direction as output, and
    // enable the GPIO pin for digital function.
    //
    GPIO_PORTF_DIR_R = LED_GREEN | LED_RED | LED_BLUE;
    GPIO_PORTF_DEN_R = LED_GREEN | LED_RED | LED_BLUE;

    // color state:
    int color_state = 0;

    //
    // Loop forever.
    //
    while(1)
    {
        //
        // Turn on the LED dependent on what state we are in.
        //
        switch(color_state) {
           case 0:
               GPIO_PORTF_DATA_R |= LED_GREEN;
           break;
           case 1:
               GPIO_PORTF_DATA_R |= LED_BLUE;
           break;
           case 2:
           default:
               GPIO_PORTF_DATA_R |= LED_RED;
	    }

        //
        // Delay for a bit.
        //
        for(ulLoop = 0; ulLoop < 200000; ulLoop++)
        {
        }

        //
        // Turn off the LED dependent on what state we are in
        //
        switch(color_state) {
           case 0:
               GPIO_PORTF_DATA_R &= ~LED_GREEN;
           break;
           case 1:
               GPIO_PORTF_DATA_R &= ~LED_BLUE;
           break;
           case 2:
           default:
               GPIO_PORTF_DATA_R &= ~LED_RED;
	}

	if ( color_state == 2 ) {
	    color_state = 0; // reset state
        } else {
            color_state++; // increment state
        }

        //
        // Delay for a bit.
        //
        for(ulLoop = 0; ulLoop < 200000; ulLoop++)
        {
        }
    }
    return 0;
}
