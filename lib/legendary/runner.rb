module Legendary
  class Runner
    def initialize(path='/tmp/.legendary-repo')
      Legendary.repository = Repository.new(path)
    end

    def run
      Legendary.logger.info("Updating Repository")
      Legendary.repository.clone_or_update

      Legendary.logger.info("Loading Gems")

      Gems.new.each do |gem|
        if gem.outdated?
          puts "#{gem.name} is outdated. #{gem.version} -> #{gem.latest_version} (it is a #{gem.gemfile ? 'in your gemfile' : 'dependency'})"
        end

        if gem.vulnerable?
          puts "#{gem.name} is vulnerable."
        end
      end
    end
  end
end
