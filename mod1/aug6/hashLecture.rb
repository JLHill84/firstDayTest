person = {
    firstName: "Josh",
    age: 35,
    friends: {
        name: "Jasen",
        name1: "Alex"
    }
}
person.[:friends].each() |value| do
    puts person[:friends][value]
end