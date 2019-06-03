# list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]
list_concat = fn  ([:a, :b], [:c, :d]) -> [:a, :b, :c, :d] end
list_concat.([:a, :b], [:c, :d])


# sum.(1, 2, 3) #=> 6
sum = fn (a, b, c) -> a + b + c end
sum.(1, 2, 3)


# pair_tuple_to_list.( { 1234, 5678 } ) #=> [ 1234, 5678 ]
pair_tuple_to_list = fn ( { a, b } ) -> [ a, b ] end
pair_tuple_to_list.( { 1234, 5678 } ) #=> [ 1234, 5678 ]


prefix = fn p -> (fn s -> "#{p} #{s}" end) end
mrs = prefix.("Mrs")
mrs.("Smith")
prefix.("Elixir").("Rocks")


add_one = &(&1 + 1) # same as add_one = fn (n) -> n + 1 end


Enum.map [1,2,3,4], fn x -> x + 2 end
Enum.map [1,2,3,4], &(&1 + 2)

Enum.each [1,2,3,4], fn x -> IO.inspect x end
Enum.each [1,2,3,4], &(IO.inspect(&1))
