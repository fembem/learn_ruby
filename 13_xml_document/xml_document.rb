class XmlDocument

  def initialize(indent=false)
    @indent = indent
    @indent_level = 0
  end

  def indentation_helper(tag_name, indent_level, *args, &block)
    attributes_section = ""
    if args.length > 0 && args[0].class == Hash
      attributes = []
      args[0].each_pair do |key, value|
        attributes.push(key.to_s + "=" + "'" + value + "'")
      end
      attributes_section = ' ' + attributes.join(" ")
    end
    newline = @indent ? "\n" : ""
    if block_given?
      if @indent then @indent_level += 1 end
      inside = yield
      if @indent then @indent_level -= 1 end
      result = spaces(2*@indent_level) +
          '<' + tag_name.to_s + attributes_section + '>' + newline +
          inside +
          spaces(2*@indent_level) +'</' + tag_name.to_s + '>' + newline
      result
    else
      spaces(2*@indent_level) + '<' + tag_name.to_s + attributes_section + '/>' + newline
    end
  end

  def method_missing(tag_name, *args, &block)
    indentation_helper(tag_name, 0, *args, &block)
  end

  def spaces(n)
    " "*n
  end
end