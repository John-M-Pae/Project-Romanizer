module jul

function main()
    value = read_number_in()
    if !valid(value)
        error("Invalid input")
    end
    print("Your value in roman numerals is: $(roman(value))")
end

function read_number_in()
    println("Enter your number:")
    line = readline()
    println("input $(line) is read in")
    val = parse(Float32, line)
    println("value is interpreted as $(val)")
    return val
end

valid(val) = isinteger(12val) && 12val <= 12(10^5 + 9* +(10^4, 10^3, 10^2, 10, 1) + 11)

function roman(val)
    if val == 0
        return 'Z'
    end
    out = ""
    numerals = [
        (10^5, 'ↈ'),
        (5*10^4, 'ↇ'),
        (10^4, 'ↂ'),
        (5*10^3, 'ↁ'),
        (10^3, 'ↀ'),
        (9*10^2, "Cↀ"),
        (5*10^2, 'D'),
        (4*10^2, "CD"),
        (10^2, 'C'),
        (9*10, "XC"),
        (5*10, 'L'),
        (4*10, "XL"),
        (10, 'X'),
        (9, "IX"),
        (5, 'V'),
        (4, "IV"),
        (1, 'I'),
        (1/2, 'S'),
        (5/12, '⁙'),
        (1/3, '∷'),
        (1/4, '∴'),
        (1/6, ':'),
        (1/12, '·')
    ]
    for numeral in numerals
        while val >= numeral[1]
            val -= numeral[1]
            out *= numeral[2]
        end
    end

    return out
end

end