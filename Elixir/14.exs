defmodule Collatz do
  defmacro is_odd(number) do
    quote do
      Bitwise.band(unquote(number), 0b1) === 1
    end
  end

  defmacro div_by_2(number) do
    quote do
      Bitwise.bsr(unquote(number), 1)
    end
  end

  def calc(input) when is_integer(input) and input > 0, do: count_steps(input)
  defp count_steps(input, steps \\ 0)
  defp count_steps(1, steps), do: steps
  defp count_steps(input, steps), do: count_steps(collatz(input), steps + 1)
  defp collatz(odd) when is_odd(odd), do: div(odd * 3 + 1, 2)
  defp collatz(even), do: div_by_2(even)
end

defmodule LongestCollatzSequence do
  def steps(0, %{number: number, max_steps: max_steps}) do
    IO.inspect(%{number: number, max_steps: max_steps})
  end

  def steps(number, %{number: current_number, max_steps: current_max_steps}) do
    steps_count = Collatz.calc(number)

    updated_map =
      if steps_count > current_max_steps do
        %{number: number, max_steps: steps_count}
      else
        %{number: current_number, max_steps: current_max_steps}
      end

    steps(number - 1, updated_map)
  end
end

LongestCollatzSequence.steps(1_000_000, %{number: nil, max_steps: 0})
