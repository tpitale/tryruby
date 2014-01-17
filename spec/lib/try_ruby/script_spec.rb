require 'spec_helper'

describe TryRuby::Script do
  let(:script) {TryRuby::Script.new(File.expand_path('../../../fixtures/scripts/example.json', __FILE__))}

  before(:each) do
    script.stubs(:print)
    script.stubs(:puts)
  end

  it 'knows the current position message title' do
    expect(script.current_title).to eq("Got 15 minutes? Give Ruby a shot right now!")
  end

  it 'knows the current position message body' do
    expect(script.current_body).to eq("\nRuby is a programming language from Japan.\n")
  end

  it 'knows if the current position message should continue automatically' do
    expect(script.continue?).to be(false)
  end

  context "#next" do
    it 'prints the next position body' do
      
    end
  end

  context "#previous" do
    xit 'prints the previous position body' do
    end
  end

  xit 'displays the intro'
  xit 'displays the outro'
end
