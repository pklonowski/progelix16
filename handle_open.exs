handle_open = fn
  {:ok, file} -> "Read data: #{IO.read(file, :line)}"
  {_, error} -> "Error: #{:file.format_error(error)}"
end
IO.puts handle_open.(File.open("ch05-ex1.ex"))
IO.puts handle_open.(File.open("nonexistent"))
