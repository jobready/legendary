module Legendary
  class Vulnerabilities
    include Enumerable

    def initialize(info)
      @info = info
    end

    def path
      @path ||= File.join(Legendary.repository.path,
                          "/gems/#{@info.name}")
    end

    def exists?
      File.exists?(path)
    end

    def each
      return nil unless exists?

      Dir.foreach(path) do |yaml_file|
        next if yaml_file =~ /\A\./

        info = YAML.load(File.read(File.join(path, yaml_file)))

        satisfied_version = lambda do |version|
          Gem::Requirement.new(version.split(',')).satisfied_by?(@info.version)
        end

        is_affected = (info["patched_versions"] || []).none?(&satisfied_version)
        not_patched = (info["unaffected_versions"] || []).none?(&satisfied_version)

        if is_affected && not_patched
          yield info
        end
      end
    end
  end
end


