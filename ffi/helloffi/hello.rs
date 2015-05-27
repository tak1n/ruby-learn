#[no_mangle]
pub extern fn hellomath(a: i32, b: i32) -> i32 {
    println!("Hello from Rust Land");
    a + b
}
