class Parent
    attr_reader :one, :two, :three
    def initialize(one, two, three)
        @one = one
        @two = two
        @three = three
    end

    def greet()
        puts 'hello'
    end
end

class Child < Parent
    attr_reader :four

    # overwrites the parent initialize,
    # because from lesson one below we know that ALL methods overwrite the parent ones
    def initialize(one, two, three, four)
        @four = four
        # call initialize in Parent. If this wasn't here, the parent initialize would never be called
        super(one, two, three)
    end

    def greet()
        puts 'adikfjsdoigjasdogj'
        # call greet() in the parent class and pass nothing
        super()
    end
end

# Lesson one: Child methods OVERWRITE parent methods
# Lesson two: Children can call the same-named parent method by using super()

c = Child.new(1,2,3,4)

puts c.one, c.two, c.three, c.four
puts c.greet()
