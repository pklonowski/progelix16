defmodule Times do
  def double(n) do
    n * 2
  end

  def triples(n), do: n * 3

  def quadruple(n) do
    double(n) * 2
  end
end
