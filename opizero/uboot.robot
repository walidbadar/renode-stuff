*** Keywords ***
Prepare Machine
    Execute Command           include @${CURDIR}/uboot.resc
    Create Terminal Tester    sysbus.uart0  5  defaultPauseEmulation=true

*** Test Cases ***
Should Run Version Command In U-Boot
    Prepare Machine
    Start Emulation

    Wait For Prompt On Uart   Hit any key to stop autoboot    timeout=10
    Send Key To Uart          0x0A  # newline

    Wait For Prompt On Uart   >
    Write Line To Uart        version
    Wait For Line On Uart     U-Boot

    Wait For Prompt On Uart   >