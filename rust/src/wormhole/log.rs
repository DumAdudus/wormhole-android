#[cfg(target_os = "android")] use crate::wormhole::andrdoid::log;
#[cfg(not(target_os = "android"))] use env_logger;

pub fn init_logger() {
    #[cfg(target_os = "android")]
    {
        log::native_activity_create();
    }

    #[cfg(not(target_os = "android"))]
    {
        env_logger::init();
    }
}
