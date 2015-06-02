class Legendary::Formatters::Html < Legendary::Formatters::Base
  def format
    @extension = "html"
    engine = Haml::Engine.new(File.read(output_path))
    engine.render(self)
  end

  def output_path
    File.join(template_path, "output.html.haml")
  end
end
