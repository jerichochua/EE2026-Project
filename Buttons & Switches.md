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
    ON  : enable other color schemes
## sw5
    OFF : Color Scheme 2 (Tentative)
        - Border : White
        - Background : Black
        - Bar (top to bottom) : Orange, Purple, Green
    ON  : Color Scheme 3 (Tentative)
        - Border : White
        - Background : Black
        - Bar (top to bottom) : Light Green, Dark Green, Light Blue

TODO:
- Last pixel always light up
- Showing/hiding OTHER components
- Volume input adjust number of bars shown
    - Input : volume (15 - 0)
    - Adjust max height
- Freeze function
    - Additonal varible enable freeze, store freeze volume
    - Keep volume as freeze volume