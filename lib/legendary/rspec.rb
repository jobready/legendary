require 'rspec/matchers'


RSpec::Matchers.define :be_secure do
  match do
    gems = Legendary::Gems.new
    vulnerable_gems = gems.collect do |gem|
      gem.vulnerable?
    end

    expect(vulnerable_gems.nil?).to be_truthy
  end
end
