module Legendary
  class Gems
    include Enumerable

    attr_accessor :bundler

    delegate :dependencies, to: :bundler
    delegate :specs, to: :bundler

    def initialize(cached=false)
      @bundler = Bundler.load
    end

    def each
      specs.each do |spec|
        yield Legendary::Info.new(spec,
                                  dependencies,
                                  definitions)
      end
    end

    def definitions
      # TODO: locking from gemsurance
      @definitions ||= Bundler.definition(true).tap do |definition|
        if @cached
          definition.resolve_with_cache!
        else
          definition.resolve_remotely!
        end
      end
    end
  end
end
