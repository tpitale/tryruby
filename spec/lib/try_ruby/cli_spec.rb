require 'spec_helper'

describe TryRuby::CLI do
  context "a cli" do
    let(:cli) {TryRuby::CLI.new([])}

    it 'runs the repl with parsed options' do
      repl = stub(:start)
      TryRuby::REPL.stubs(:new).returns(repl)

      cli.run

      expect(repl).to have_received(:start)
      expect(TryRuby::REPL).to have_received(:new).with({})
    end
  end
end
