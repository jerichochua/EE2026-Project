# Buttons
## btnC
    Reset oled

# Switches
## sw0 
    OFF : Turn off leds indicating volume (Default)
    ON  : Turn on leds indicating volume
## sw1 & sw2
    2'b00 : Hide border and volume bar (Default)
    2'b01 : Show border only
    2'b10 : Show volume bar only
    2'b11 : Show border and volume bar

## sw3
    OFF : 1-pixel border (Default)
    ON  : 3-pixels border
## sw4
    OFF : Color Scheme 1 (Default)
        - Border : White
        - Background : Black
        - Bar (top to bottom) : Red, Yellow, Green
    ON  : Enable other color schemes
## sw5
    OFF : Color Scheme 2 
    ON  : Color Scheme 3

## sw6 
    OFF : Show/hide border and volume bar based on sw1 & sw2 (Default)
    ON  : Hide border and volume bar

## sw7
    OFF : Turn off freeze function (Default)
    ON  : Turn on freeze function

TODO:
    - Create wave based on mic_in
    - Color scheme