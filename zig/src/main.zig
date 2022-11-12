const std = @import("std");
const io = std.io;
const fmt = std.fmt;

pub fn main() !void
{
    const stdout = io.getStdOut().writer();
    const stdin = io.getStdIn();

    var line_buffer: [100]u8 = undefined;
    try stdout.print("Enter your number:", .{});
    var value = try read_line_as_num(stdin, &line_buffer);

    try stdout.print("Your value is {} of type {}", .{value, @TypeOf(value)});
}

fn read_line_as_num(input: anytype, buffer: []u8) !u8
{
    const amnt = try input.read(buffer);

    if (amnt == buffer.len) {return InputError.InputToLong;}

    const line = std.mem.trimRight(u8, buffer[0..amnt], "\r\n");
    const value = fmt.parseUnsigned(u8, line, 10)
        catch {return InputError.InvalidInputString;};
    
    return value;
}

const InputError = error
{
    InputToLong,
    InvalidInputString
};