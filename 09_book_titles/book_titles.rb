class Book

  attr_reader :title

  def initialize(title=nil)
    if title
      @title = capitalize_title(title)
    end
  end

  def title=(title)
    @title = capitalize_title(title)
  end

  def capitalize_title(title)
    words = title.split(" ")
    capitalized_words = words.each_with_index.map do |word, i|
      if i != 0 && ["and", "in", "the", "of", "a", "an"].include?(word)
        word
      else
        word.capitalize
      end
    end
    capitalized_words.join(" ")
  end
end