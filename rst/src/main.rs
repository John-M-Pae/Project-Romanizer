fn main()
{
    let val: f32 = read_line_as_num().expect("input provided was not valid and could not be read");

    if !is_valid(val) {panic!("Input cannot be interpreted as a Roman numeral.");}

    println!("{}", arabic_to_roman(val));
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

fn is_valid(value: f32) -> bool
{
    let test_val = 12.0*value;
    let bound = 12*(100_000 + 9*(10_000 + 1000 + 100 + 10 + 1)) + 11;
    (value >= 0.0) && (test_val <= bound as f32) && (test_val.fract() == 0.0)
}

fn arabic_to_roman(value: f32) -> String
{
    if value == 0.0 {return "Z".to_string();}

    let mut val = value;

    let numerals = [
        Numeral{value: 100_000.0, symbol: "ↈ"},
        Numeral{value: 50_000.0, symbol: "ↇ"},
        Numeral{value: 10_000.0, symbol: "ↂ"},
        Numeral{value: 5000.0, symbol: "ↁ"},
        Numeral{value: 1000.0, symbol: "ↀ"},
        Numeral{value: 900.0, symbol: "Cↀ"},
        Numeral{value: 500.0, symbol: "D"},
        Numeral{value: 400.0, symbol: "CD"},
        Numeral{value: 100.0, symbol: "C"},
        Numeral{value: 90.0, symbol: "XC"},
        Numeral{value: 50.0, symbol: "L"},
        Numeral{value: 40.0, symbol: "XL"},
        Numeral{value: 10.0, symbol: "X"},
        Numeral{value: 9.0, symbol: "IX"},
        Numeral{value: 5.0, symbol: "V"},
        Numeral{value: 4.0, symbol: "IV"},
        Numeral{value: 1.0, symbol: "I"},
        Numeral{value: 0.5, symbol: "S"},
        Numeral{value: 5.0/12.0, symbol: "⁙"},
        Numeral{value: 4.0/12.0, symbol: "∷"},
        Numeral{value: 3.0/12.0, symbol: "∴"},
        Numeral{value: 2.0/12.0, symbol: ":"},
        Numeral{value: 1.0/12.0, symbol: "·"}
    ];

    let mut result = String::new();

    for num in numerals
    {
        while val >= num.value
        {
            result.push_str(num.symbol);
            val -= num.value;
        }
    }

    return result;
}

struct Numeral<'a>
{
    value: f32,
    symbol: &'a str
}