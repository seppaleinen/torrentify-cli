require_relative 'spec_helper'
require_relative '../lib/menu'

RSpec.describe Menu do
  context 'start' do
    it '#start should be accessible' do
      menu = double(Menu)
      allow(menu).to receive(:start).and_return('hej')

      result = menu.start

      expect(result).to eql('hej')
    end

    it '#start should call torrentify' do
      ARGV.replace %w{search a pigeon sat on a branch reflecting}

      s = capture_stdout do
        result = Menu.new.start
      end

      # expect(torrentify).to receive(:search).with('asd').and_return('då')

      # expect(s.string).to eql('asd')
    end
  end
  
end

# Capture of stdout to STDOUT var
module Kernel
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
end
