#![no_main]
#![no_std]

use arduino_hal::{self, pac::portb, pins};
use core::panic::PanicInfo;
use panic_halt as _;

#[arduino_hal::entry]
fn main() -> ! {
    let p = arduino_hal::Peripherals::take().unwrap();
    let mut pins = pins!(p);
    let mut led = pins.d13.into_output();

    #[allow(clippy::empty_loop)]
    loop {
        led.toggle();
        arduino_hal::delay_ms(1000);
    }
}
