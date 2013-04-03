def is_vowel?(letter)
  ["a", "e", "i", "o", "u"].include? letter
end

def shift_n_letters(word, n)
  word[n,word.length] + word[0,n] + "ay"
end

def translate(sentence)
  words = sentence.split()
  translated_words = words.map{|a|translate_word(a)}
  translated_words.join(" ")
end

def translate_word(word)
  if is_vowel?(word[0])
    shift_n_letters(word, 0)
  elsif word.length == 1 || is_vowel?(word[1])
    if word[0] == 'q' && word[1] == 'u'
      shift_n_letters(word, 2)
    else
      shift_n_letters(word, 1)
    end
  elsif word.length == 2 || is_vowel?(word[2])
    if word.length >= 3 && !is_vowel?(word[0]) && word[1] == 'q' && word[2] == 'u'
      shift_n_letters(word, 3)
    else
      shift_n_letters(word, 2)
    end
  else
    shift_n_letters(word, 3)
  end
end