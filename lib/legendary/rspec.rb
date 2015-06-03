require 'rspec/matchers'

module GemStore
  def self.gems
    @gems ||= Legendary::Gems.new(true).to_a
  end
end

RSpec::Matchers.define :be_secure do
  match do |thing|
    vulnerable_gems = GemStore.gems.collect do |gem|
      gem if gem.vulnerable?
    end.compact

    expect(vulnerable_gems.length).to eql(0)
  end
end

RSpec::Matchers.define :be_updated do
  match do |thing|
    outdated = GemStore.gems.collect do |gem|
      gem if gem.outdated?
    end.compact

    expect(outdated.length).to eql(0)
  end
end
