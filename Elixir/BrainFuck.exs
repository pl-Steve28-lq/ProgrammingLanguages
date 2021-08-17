defmodule State do
  @size 16

  defstruct index: 0, value: List.duplicate(0, @size), output: ""

  def move(state, offset) do
    %{ state | index: rem(state.index + offset, @size) }
  end

  def update(state, value) do
    %{ state | value: List.replace_at(state.value, state.index, value) }
  end

  def add_result(state, output) do
    %{ state | output: state.output <> output }
  end

  def get(state) do
    Enum.at(state.value, state.index)
  end
end

defmodule Input do
  defstruct input: "", idx: 0

  def get(input) do
    {%{ input | idx: input.idx + 1 }, String.at(input.input, input.idx)}
  end
end

defmodule BrainFuck do
  def exec(code, input) do
    exec_ex(code, 0, find_loop(code), %Input{ input: input }, %State{})
  end

  def exec_ex(code, idx, loops, input, state) do
    char = String.at(code, idx)
    next = &exec_ex(code, idx+1, loops, input, &1)
    inputs = &exec_ex(code, idx+1, loops, &2, &1)
    jump = &exec_ex(code, &1, loops, input, state)
    cond do
      idx == String.length(code) -> state
      true -> case char do
        ">" -> next.(State.move(state, 1))
        "<" -> next.(State.move(state, -1))
        "+" -> next.(State.update(state, State.get(state)+1))
        "-" -> next.(State.update(state, State.get(state)-1))
        "." -> next.(State.add_result(
          state, List.to_string([State.get(state)])
        ))
        "," -> 
          {new_input, data} = Input.get(input)
          inputs.(State.add_result(state, data), new_input)
        "[" ->
          if State.get(state) == 0,
            do: jump.(loops[idx]+1),
            else: next.(state)
        "]" ->
          if State.get(state) != 0,
            do: jump.(loops[idx]+1),
            else: next.(state)
        _ -> next.(state)
      end
    end
  end

  def find_loop(code) do
    find_loop_ex(code, 0, [], %{})
  end

  def find_loop_ex(code, idx, stack, res) do
    cond do
      idx == String.length(code) -> res
      true -> case String.at(code, idx) do
        "[" -> find_loop_ex(code, idx+1, [idx | stack], res)
        "]" ->
          [item | rest] = stack
          find_loop_ex(code, idx+1, rest, Map.put_new(Map.put_new(res, idx, item), item, idx))
        _ -> find_loop_ex(code, idx+1, stack, res)
      end
    end
  end
end



defmodule Main do
  def main() do
    code = "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++++++++++++++.------------.<<+++++++++++++++.>.+++.------.--------.>+."
    res = BrainFuck.exec(code, "")
    print(res.output)
    printList(res.value)
  end

  def print(x) do IO.puts x end
  def printList(x) do
    Enum.each(x, &IO.puts(&1))
  end
end

Main.main()
