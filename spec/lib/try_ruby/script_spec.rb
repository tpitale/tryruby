require 'spec_helper'

describe TryRuby::Script do
  let(:script) {TryRuby::Script.new(File.expand_path('../../../fixtures/scripts/example.json', __FILE__))}

  before(:each) do
  end


  it 'knows if the current position message should continue automatically' do
    expect(script.continue?).to be(false)
    script.next
    expect(script.continue?).to be(true)
  end

  context "#next" do
    it 'advances the position' do
      expect(script.position).to eq(0)
      script.next
      expect(script.position).to eq(1)
    end

    it 'does not advance beyond the last message' do
      expect(script.position).to eq(0)
      script.length.times {script.next}
      expect(script.position).to eq(script.length-1)
    end
  end

  context "#previous" do
    it 'prints the previous position body' do
      expect(script.position).to eq(0)
      script.next
      script.next
      script.previous
      expect(script.position).to eq(1)
    end

    it 'does not reverse beyond the first message' do
      expect(script.position).to eq(0)
      script.previous
      expect(script.position).to eq(0)
    end
  end

  it 'has an intro message' do
    expect(script.intro).to eq(script.messages.first)
  end

  it 'has an outro message' do
    expect(script.outro).to eq(script.messages.last)
  end
end
