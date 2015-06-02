class Legendary::Formatters::Base
  def initialize(infos)
    @infos = infos
  end

  def sorted_gems
    @infos.sort{ |a, b| a.name.downcase <=> b.name.downcase }
  end

  def template_path
    File.expand_path(File.join(File.dirname(__FILE__), '../templates/'))
  end
end
