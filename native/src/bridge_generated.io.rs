use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_init(port_: i64, temp_file_path: *mut wire_uint_8_list) {
    wire_init_impl(port_, temp_file_path)
}

#[no_mangle]
pub extern "C" fn wire_send_files(
    port_: i64,
    file_paths: *mut wire_StringList,
    name: *mut wire_uint_8_list,
    code_length: u8,
) {
    wire_send_files_impl(port_, file_paths, name, code_length)
}

#[no_mangle]
pub extern "C" fn wire_send_folder(
    port_: i64,
    folder_path: *mut wire_uint_8_list,
    name: *mut wire_uint_8_list,
    code_length: u8,
) {
    wire_send_folder_impl(port_, folder_path, name, code_length)
}

#[no_mangle]
pub extern "C" fn wire_request_file(
    port_: i64,
    passphrase: *mut wire_uint_8_list,
    storage_folder: *mut wire_uint_8_list,
) {
    wire_request_file_impl(port_, passphrase, storage_folder)
}

#[no_mangle]
pub extern "C" fn wire_get_passphrase_uri(
    port_: i64,
    passphrase: *mut wire_uint_8_list,
    rendezvous_server: *mut wire_uint_8_list,
) {
    wire_get_passphrase_uri_impl(port_, passphrase, rendezvous_server)
}

#[no_mangle]
pub extern "C" fn wire_get_build_time(port_: i64) {
    wire_get_build_time_impl(port_)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_StringList_0(len: i32) -> *mut wire_StringList {
    let wrap = wire_StringList {
        ptr: support::new_leak_vec_ptr(<*mut wire_uint_8_list>::new_with_null_ptr(), len),
        len,
    };
    support::new_leak_box_ptr(wrap)
}

#[no_mangle]
pub extern "C" fn new_uint_8_list_0(len: i32) -> *mut wire_uint_8_list {
    let ans = wire_uint_8_list {
        ptr: support::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    support::new_leak_box_ptr(ans)
}

// Section: related functions

// Section: impl Wire2Api

impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}
impl Wire2Api<Vec<String>> for *mut wire_StringList {
    fn wire2api(self) -> Vec<String> {
        let vec = unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        };
        vec.into_iter().map(Wire2Api::wire2api).collect()
    }
}

impl Wire2Api<Vec<u8>> for *mut wire_uint_8_list {
    fn wire2api(self) -> Vec<u8> {
        unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}
// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_StringList {
    ptr: *mut *mut wire_uint_8_list,
    len: i32,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
