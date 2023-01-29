#![allow(
    non_camel_case_types,
    unused,
    clippy::redundant_closure,
    clippy::useless_conversion,
    clippy::unit_arg,
    clippy::double_parens,
    non_snake_case,
    clippy::too_many_arguments
)]
// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.62.0.

use crate::api::*;
use core::panic::UnwindSafe;
use flutter_rust_bridge::*;
use std::ffi::c_void;
use std::sync::Arc;

// Section: imports

// Section: wire functions

fn wire_send_file_impl(
    port_: MessagePort,
    file_name: impl Wire2Api<String> + UnwindSafe,
    file_path: impl Wire2Api<String> + UnwindSafe,
    code_length: impl Wire2Api<u8> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "send_file",
            port: Some(port_),
            mode: FfiCallMode::Stream,
        },
        move || {
            let api_file_name = file_name.wire2api();
            let api_file_path = file_path.wire2api();
            let api_code_length = code_length.wire2api();
            move |task_callback| {
                send_file(
                    api_file_name,
                    api_file_path,
                    api_code_length,
                    task_callback.stream_sink(),
                )
            }
        },
    )
}
fn wire_request_file_impl(
    port_: MessagePort,
    passphrase: impl Wire2Api<String> + UnwindSafe,
    storage_folder: impl Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "request_file",
            port: Some(port_),
            mode: FfiCallMode::Stream,
        },
        move || {
            let api_passphrase = passphrase.wire2api();
            let api_storage_folder = storage_folder.wire2api();
            move |task_callback| {
                Ok(request_file(
                    api_passphrase,
                    api_storage_folder,
                    task_callback.stream_sink(),
                ))
            }
        },
    )
}
fn wire_get_passphrase_uri_impl(
    port_: MessagePort,
    passphrase: impl Wire2Api<String> + UnwindSafe,
    rendezvous_server: impl Wire2Api<Option<String>> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "get_passphrase_uri",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_passphrase = passphrase.wire2api();
            let api_rendezvous_server = rendezvous_server.wire2api();
            move |task_callback| Ok(get_passphrase_uri(api_passphrase, api_rendezvous_server))
        },
    )
}
fn wire_new__static_method__TUpdate_impl(
    port_: MessagePort,
    event: impl Wire2Api<Events> + UnwindSafe,
    value: impl Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "new__static_method__TUpdate",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_event = event.wire2api();
            let api_value = value.wire2api();
            move |task_callback| Ok(TUpdate::new(api_event, api_value))
        },
    )
}
// Section: wrapper structs

// Section: static checks

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

pub trait Wire2Api<T> {
    fn wire2api(self) -> T;
}

impl<T, S> Wire2Api<Option<T>> for *mut S
where
    *mut S: Wire2Api<T>,
{
    fn wire2api(self) -> Option<T> {
        (!self.is_null()).then(|| self.wire2api())
    }
}

impl Wire2Api<Events> for i32 {
    fn wire2api(self) -> Events {
        match self {
            0 => Events::Code,
            1 => Events::Total,
            2 => Events::Sent,
            3 => Events::Error,
            4 => Events::Finished,
            5 => Events::ConnectionType,
            6 => Events::StartTransfer,
            _ => unreachable!("Invalid variant for Events: {}", self),
        }
    }
}
impl Wire2Api<i32> for i32 {
    fn wire2api(self) -> i32 {
        self
    }
}

impl Wire2Api<u8> for u8 {
    fn wire2api(self) -> u8 {
        self
    }
}

// Section: impl IntoDart

impl support::IntoDart for Events {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::Code => 0,
            Self::Total => 1,
            Self::Sent => 2,
            Self::Error => 3,
            Self::Finished => 4,
            Self::ConnectionType => 5,
            Self::StartTransfer => 6,
        }
        .into_dart()
    }
}

impl support::IntoDart for TUpdate {
    fn into_dart(self) -> support::DartAbi {
        vec![self.event.into_dart(), self.value.into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for TUpdate {}

// Section: executor

support::lazy_static! {
    pub static ref FLUTTER_RUST_BRIDGE_HANDLER: support::DefaultHandler = Default::default();
}

/// cbindgen:ignore
#[cfg(target_family = "wasm")]
#[path = "bridge_generated.web.rs"]
mod web;
#[cfg(target_family = "wasm")]
pub use web::*;

#[cfg(not(target_family = "wasm"))]
#[path = "bridge_generated.io.rs"]
mod io;
#[cfg(not(target_family = "wasm"))]
pub use io::*;
