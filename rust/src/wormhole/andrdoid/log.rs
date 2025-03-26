extern crate android_logger;

use android_logger::Config;
use log::LevelFilter;

pub fn native_activity_create() {
    android_logger::init_once(
        Config::default()
            .with_max_level(LevelFilter::Trace)
            .format(|f, record| write!(f, "[wormhole] {}", record.args()))
            // .with_tag("wormhole"),
    );

    log::debug!("this is a debug {}", "message");
    log::error!("this is printed by default");
}
