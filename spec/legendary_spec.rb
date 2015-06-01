require 'spec_helper'

describe Legendary do
  specify 'has a version number' do
    expect(Legendary::VERSION).not_to be_nil
  end
end
