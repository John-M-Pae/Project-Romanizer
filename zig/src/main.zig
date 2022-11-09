const std = @import("std");
const builtin = @import("builtin");
const io = std.io;
const fmt = std.fmt;

pub fn main() !void
{
    const stdout = io.getStdOut().writer();
    const stdin = io.getStdIn();

    var line_buffer: [100]u8 = undefined;
    try stdout.print("Enter your number:", .{});
    const amnt = try stdin.read(&line_buffer);

    if (amnt == line_buffer.len) {
        try stdout.print("Input string to long", .{});
        return;
    }

    const line = std.mem.trimRight(u8, line_buffer[0..amnt], "\r\n");
    const value = fmt.parseUnsigned(u8, line, 10) catch {
        try stdout.print("Invalid number value given", .{});
        return;
    };

    try stdout.print("Your value is {} of type {}", .{value, @TypeOf(value)});
    return;
}