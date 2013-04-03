def reverser
  the_sentence = yield
  the_sentence.split(" ").map{|a|a.reverse}.join(" ")
end

def adder(amount=1)
  amount + yield
end

def repeater(num_times=1)
  num_times.times{yield}
end