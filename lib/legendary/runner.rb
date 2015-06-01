module Legendary
  class Runner
    def initialize(path=nil)
      Legendary.repository = Repository.new(path)
    end

    def run
      Legendary.logger.info("Updating Repository")
      Legendary.repository.clone_or_update

      Legendary.logger.info("Loading Gems")

      success = true

      Gems.new.each do |gem|
        if gem.outdated?
          Legendary.logger.info("#{gem.name} is outdated. #{gem.version} -> #{gem.latest_version} (it is #{gem.gemfile ? 'in your gemfile' : 'a dependency'})")
        end

        if gem.vulnerable?
          Legendary.logger.info("#{gem.name} is vulnerable.")
          success = false
        end
      end

      exit 1 unless success
    end
  end
end
