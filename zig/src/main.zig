const std = @import("std");
const io = std.io;
const mem = std.mem;
const fmt = std.fmt;
const heap = std.heap;

pub fn main() !void
{
    const stdin = io.getStdIn();
    const stdout = io.getStdOut().writer();

    // Read line from standard input
    var in_buff: [100]u8 = undefined;
    try stdout.print("Enter your number:", .{});
    const amnt = try stdin.read(&in_buff);

    if (amnt == in_buff.len) {return InputError.InputToLong;}

    // Parse line into numeric value
    const line = mem.trimRight(u8, in_buff[0..amnt], "\r\n");
    var value = fmt.parseFloat(f32, line)
        catch {return InputError.InvalidInputString;};
    
    try stdout.print("Your value is {} of type {}\n", .{value, @TypeOf(value)});

    // Define data structure for result
    const alocc = heap.page_allocator;
    var result = std.ArrayList(u8).init(alocc);
    defer result.deinit();

    if (value == 0)
    {
        try result.appendSlice("Z");
    }
    else
    {
        try result.appendSlice("Hello");
    }

    // Print result
    for (result.items) |char|
    {
        try stdout.print("-{c}-", .{char});
    }
    try stdout.print("\n", .{});
}

const InputError = error
{
    InputToLong,
    InvalidInputString
};