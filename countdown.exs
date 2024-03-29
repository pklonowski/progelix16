defmodule Countdown do
  def sleep(seconds) do
    receive do
      after seconds*1000 -> nil
    end
  end

  def say(text) do
    spawn fn -> :os.cmd('espeak #{text}') end  # espeak on linus, say on macos, ptts on win
  end

  def timer do
    Stream.resource(
      fn -> # the number of seconds to the start of the next minute
        {_h,_m, s} = :erlang.time
        60 - s - 1
      end,

      fn # wait for the next second, then return its countdown
        0 ->
          {:halt, 0}

        count ->
          sleep(1)
          { [inspect(count)], count - 1 }
      end,

      fn _ -> nil end # nothing to deallocate
    )
  end
end
