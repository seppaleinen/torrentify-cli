require_relative 'spec_helper'
require_relative '../lib/menu'

RSpec.describe Menu do
  context 'start' do
    it '#start should be accessible' do
      allow(Menu).to receive(:start).and_return('hej')
      ARGV.replace %w{search hej}
      result = Menu.new.start
      # expect(result).to eql(Commander::Command:bar)
    end

    it '#start should call torrentify' do
      allow(Menu.new.start).to receive(:Torrentify).and_return('hej')
      ARGV.replace %w{search hej}
      result = Menu.new.start
    end
  end
  
end