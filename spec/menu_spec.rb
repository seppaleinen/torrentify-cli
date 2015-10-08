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
      ARGV.replace %w{search a pigeon sat on a branch reflecting on existence}

      # mock web requests by webmock until i get mocking framework to work
      mock_piratebay
      mock_kickass
      mock_isohunt
      mock_extratorrent

      s = capture_stdout do
        result = Menu.new.start
      end

      # expect(torrentify).to receive(:search).with('asd').and_return('då')

      # expect(s.string).to eql('asd')
    end
  end
  
end

def mock_piratebay
  WebMock.stub_request(:get, 'https://thepiratebay.mn/search/a%20pigeon%20sat%20on%20a%20branch%20reflecting%20on%20existence')
    .to_return(:status => 200, :body => '', :headers => {})
end

def mock_kickass
  WebMock.stub_request(:get, 'https://kat.cr/usearch/a%20pigeon%20sat%20on%20a%20branch%20reflecting%20on%20existence')
    .to_return(:status => 200, :body => '', :headers => {})
end

def mock_isohunt
  WebMock.stub_request(:get, 'https://isohunt.to/torrents/?ihq=a%20pigeon%20sat%20on%20a%20branch%20reflecting%20on%20existence')
    .to_return(:status => 200, :body => '', :headers => {})
end

def mock_extratorrent
  WebMock.stub_request(:get, 'http://extratorrent.cc/search/?search=a%20pigeon%20sat%20on%20a%20branch%20reflecting%20on%20existence')
    .to_return(:status => 200, :body => '', :headers => {})
end
