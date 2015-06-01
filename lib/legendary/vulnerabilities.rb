module Legendary
  class Vulnerabilities
    include Enumerable

    def initialize(info)
      @info = info
    end

    def path
      @path ||= File.join(Legendary.repository.path,
                          @info.name)
    end

    def exists?
      File.exists?(path)
    end

    def each
      return nil unless exists?

      Legendary.logger.info("#{@info.name} : #{path}")

      Dir.foreach(path) do |yaml_file|
        info = YAML.load(yaml_file)

        Legendary.logger.info("#{@info.name}: #{info}")

        affected = (vulnerability.patched_versions || []).none?(satisfied_version)
        patched = (vulnerability.unaffected_versions || []).none?(satisfied_version)

        if affected || patched
          yield info
        end
      end
    end

    private

    def satisfied_version(version)
      Gem::Requirement.new(version.split(',')).satisfied_by?(@info.version)
    end
  end
end


