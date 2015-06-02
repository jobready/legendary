module Legendary
  class Runner
    def initialize(path=nil)
      Legendary.repository = Repository.new(path)
      @report = File.join(Dir.pwd, "output.html")
    end

    def run
      Legendary.logger.info("Updating Repository")
      Legendary.repository.clone_or_update

      Legendary.logger.info("Loading Gems")

      gems = Gems.new.to_a
      File.write(@report, Legendary::Formatters::Html.new(gems).format)
      Legendary.logger.info("Report Saved at #{@report}")
    end
  end
end
