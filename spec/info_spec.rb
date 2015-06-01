require 'spec_helper'

describe Legendary::Info do
  let(:spec) { double(:spec, name: "Fish",
                      version: "1.9",
                      git_version: "038fd7173f17af6919dbadf0af626712464b5def")}

  let(:dependencies) { [spec] }
  let(:list) { double(:list, :[] => dependencies)}
  let(:definitions) { double(:definitions, index: list) }
  let(:info) { double(:info, homepage_uri: "http://www.google.com") }

  subject { described_class.new(spec, dependencies, definitions) }

  context do
    specify { expect(subject.git_outdated).to be_falsey }
  end

  context do
    specify { expect(subject.gemfile).to be_truthy }
  end

  context do
    specify { expect(subject.outdated?).to be_falsey }
  end

  context do
    specify { expect(subject.name).to eql(spec.name) }
    specify { expect(subject.latest).to eql(spec) }
  end

  context do
    before do
      expect(Gems).to receive(:info).with(subject.name).and_return(info)
    end

    specify {expect(subject.homepage_uri).to eql(info.homepage_uri) }
  end
end
