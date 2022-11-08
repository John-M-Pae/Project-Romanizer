module jul

function main()
    read_number_in()
end

function read_number_in()
    println("Enter your number:")
    line = readline()
    println("input $(line) is read in")
    val = parse(Float32, line)
    println("value is interpreted as $(val)")
    return val
end

end