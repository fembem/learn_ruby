def echo(input_string)
  input_string
end

def shout(input_string)
  input_string.upcase
end

def repeat(input_string, times=2)
  input_string + (" " + input_string)*(times-1)
end

def start_of_word(input_string, index)
  input_string[0,index]
end

def first_word(sentence)
  sentence.split(" ")[0]
end

def titleize(sentence)
  words = sentence.split(" ")
  puts sentence
  words.each_with_index do |word, index|
    if index == 0 || ! (["and", "or", "over", "the"].include? word)
      #puts index + "word length of " + word + " : "  + word.length.to_s
      word.capitalize!
    end
  end
  words.join(" ")
end

