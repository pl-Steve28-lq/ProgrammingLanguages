class BrainFuck
  def initialize size=256, error=500000
    @value = Array.new(size, 0)
    @size = size
    @error = error
    @pointer = 0
  end

  def get
    return @value[@pointer] end
  
  def add n
    @value[@pointer] += n end

  def index code
    leftbr = []
    dict = Hash.new
    code.each_char.with_index { |z, i|
      if z=="[" 
        leftbr.append(i)
      elsif z=="]" 
        dict[i] = leftbr.last
        dict[leftbr.last] = i
        leftbr.pop
      end
    }
    return dict
  end

  def execute code
    x = 0
    y = code.length
    cnt = 0
    
    res = []

    indexs = index(code)

    while x < y+1 
      @pointer = @pointer % @size
      g = get
      z = code[x]
      if z == ">"; @pointer += 1
      elsif z == "<"; @pointer -= 1
      elsif z == "+"; add(1)
      elsif z == "-"; add(-1)
      elsif z == "."; res << g.chr
      elsif z == "["
        if g == 0; x = indexs[x]-1 end
      elsif z == "]"
        if g != 0; x = indexs[x]-1 end
      end
      x += 1
      cnt += 1
      if cnt > @error and z == "["
        raise "Loop Error at index : (#{x-1}, #{indexs[x-1]})"
      end
    end

    res.join('')
  end
end

puts BrainFuck.new(size=6).execute("++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++++++++++++++.------------.<<+++++++++++++++.>.+++.------.--------.>+.")
