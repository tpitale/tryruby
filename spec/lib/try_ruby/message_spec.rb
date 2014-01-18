require 'spec_helper'

describe TryRuby::Message do
  let(:message) {TryRuby::Message.new(title: 'Hello, and welcome!', body: 'This tutorial will help you learn ruby.')}

  it 'returns title and body' do
    title, body = message.formatted
    expect(title).to eq(message.title)
    expect(body).to eq(message.body)
  end
end
