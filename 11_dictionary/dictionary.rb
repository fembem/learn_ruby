class Dictionary
  attr_reader :entries

  def initialize
    @entries = {}
  end

  def add(keyword_or_hash)
    if keyword_or_hash.class != Hash
      @entries[keyword_or_hash] = nil
    else
      @entries.merge!(keyword_or_hash)
    end
  end

  def keywords
    @entries.keys.sort
  end

  def include?(keyword)
    @entries.has_key?(keyword)
  end

  def find(word)
    puts @entries.class
    @entries.reject {|key,value| key !~ Regexp.new(word) }
  end

  def printable
    output = []
    @entries.sort.map do |key, value|
      output.push '[' +  key.to_s + '] "' + value.to_s + '"'
    end
    output.join("\n")
  end

end