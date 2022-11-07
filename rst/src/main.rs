fn main()
{
    _ = read_line_as_num().expect("input provided was not valid and could not be read");
}

fn read_line_as_num() -> Option<f32>
{
    let mut line: String = String::new();
    println!("Enter your number:");

    match std::io::stdin().read_line(&mut line)
    {
        Ok(bytes) => {println!("{bytes} bytes read in line {line}"); parse_line_as_num(line)},
        Err(err) => {println!("Error found: {err} while reading standard input."); None}
    }
}

fn parse_line_as_num(line: String) -> Option<f32>
{
    match line.trim().parse::<f32>()
    {
        Ok(val) => {println!("Parsed {line} as {val}."); Some(val)},
        Err(err) => {println!("Error found: {err} while parsing input as number."); None}
    }
}