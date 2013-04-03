class RPNCalculator

  attr_reader :value

  def initialize
    @stack = []
  end

  def empty
    @value = nil
    @stack = []
    puts "emptied calculator"
  end

  def push(element)
    @stack.push(element)
  end

  def check_two_operands_available
    if @value && @stack.size > 0
      return
    elsif @stack.size > 1
      return
    end
    raise "calculator is empty"
  end

  def operate(operator)
    puts "@stack.size: " + @stack.size.to_s
    check_two_operands_available
    if @value && !([:+, :-].include?(operator) && @stack.size > 1)
      operand_1 = @value
      operand_2 = @stack.pop
    else
      operand_1 = @stack.pop
      operand_2 = @stack.pop
    end
    if @value
      @stack.push(@value)
    end
    @value = operand_2.to_f.send(operator, operand_1)

    #puts "[:+, :-].include? operator: " + ([:+, :-].include? operator).to_s
    #puts "operand_1: " + operand_1.to_s
    #puts "operand_2: " + operand_2.to_s
    #puts "operator: " + operator.to_s
    #puts "@value: " + @value.to_s
  end

  def plus
    operate(:+)
  end
  def minus
    operate(:-)
  end
  def times
    operate(:*)
  end
  def divide
    operate(:/)
  end

=begin
  def plus
    check_two_operands_available
    if @value
      @value = @value + @stack.pop
    else
      @value = @stack.pop + @stack.pop
    end
  end

  def minus
    check_two_operands_available
    if @value
      @value = @value - @stack.pop
    else
      @value = - @stack.pop + @stack.pop
    end
  end

  def divide
    check_two_operands_available
    if @value
      divisor = @value
      dividend = @stack.pop
    else
      divisor = @stack.pop
      dividend = @stack.pop
    end
    @value = dividend.to_f / divisor
  end

  def times
    check_two_operands_available
    if @value
      @value = @value * @stack.pop
    else
      @value = @stack.pop * @stack.pop
    end
  end
=end

  def tokens(input_string)
    token_strings = input_string.split(" ")
    token_strings.map do |element|
      puts element
      if ['+', '-', '*', '/'].include? element
        case element
          when "+"
            :+
          when "-"
            :-
          when "*"
            :*
          when "/"
            :/
        end
      else
        element.to_i
      end
    end
  end

  def evaluate(eval_input)
    empty
    token_array = tokens(eval_input)
    token_array.each do |token|
      if [:+, :-, :*, :/].include? token
        operate(token)
      else
        puts "pushing: " + token.to_s
        @stack.push(token)
      end
    end
    @value
  end

end
