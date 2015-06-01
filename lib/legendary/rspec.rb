require 'rspec/matchers'

$GEMS = Legendary::Gems.new

RSpec::Matchers.define :be_secure do
  match do |thing|
    vulnerable_gems = $GEMS.collect do |gem|
      gem.vulnerable?
    end

    expect(vulnerable_gems.empty?).to be_truthy
  end
end

RSpec::Matchers.define :be_updated do
  match do |thing|
    outdated = $GEMS.collect do |gem|
      gem.outdated?
    end

    expect(outdated.empty?).to be_truthy
  end
end
