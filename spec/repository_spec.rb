require 'spec_helper'

describe Legendary::Repository do
  let(:path) { File.path("../") }
  subject { described_class.new(path) }

  before do
    allow_any_instance_of(described_class).to receive(:pull).and_return(nil)
    allow_any_instance_of(described_class).to receive(:clone).and_return(nil)
  end

  context do
    before do
      expect(subject).to receive(:repo_exists?).and_return(true)
      expect(subject).to receive(:pull)
    end

    specify { expect(subject.clone_or_update).to be_nil }
  end


  context do
    let(:path) { File.dirname(__FILE__) }
    specify { expect(subject.repo_exists?).to be_falsey }
  end
end

