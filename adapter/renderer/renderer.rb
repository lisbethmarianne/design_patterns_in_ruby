class Renderer
  def render(text_object)
    text = text_object.text
    size = text_object.size_inches
    color = text_object.color

    # render the text
    puts "#{text}"
    puts "#{size} inches"
    puts "#{color}"
  end
end
