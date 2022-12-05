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

end

end