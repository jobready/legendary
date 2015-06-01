module Legendary
  class Info
    attr_accessor :name, :spec, :version, :gemfile, :dependencies, :definitions

    delegate :homepage_uri, to: :meta
    delegate :name, to: :spec
    delegate :version, to: :spec
    delegate :git_version, to: :spec
    delegate :version, to: :latest, prefix: true

    def initialize(spec, dependencies, definitions)
       @spec = spec
       @dependencies = dependencies
       @definitions = definitions
    end

    def git_outdated?
      git_version != latest.git_version
    end

    def gemfile
      dependencies.any? do |other|
        other.name == name
      end
    end

    def outdated?
      Gem::Version.new(latest_version) > Gem::Version.new(version)
    end

    def vulnerable?
      # FIXME: speeds things up, but in theory a
      # a gem might not have a release, but have vulnerable
      return false unless (outdated? || git_outdated?)
      return vulnerabilities.any?
    end

    def vulnerabilities
      @vulnerabilities ||= Vulnerabilities.new(self)
    end

    def meta
      @meta ||= ::Gems.info(name)
    end

    def latest
      @latest ||= definitions.index[name].sort_by { |b| b.version }.last
    end

    def prerelease
      if !version.prerelease? && latest.size > 1
        latest.delete_if { |b| b.respond_to?(:version) && b.version.prerelease? }
      end
    end
  end
end
