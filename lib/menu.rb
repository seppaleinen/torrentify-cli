#!/usr/bin/env ruby

require 'rubygems'
require 'commander/import'
require 'torrentify'

program :version, '0.1'
program :description, 'Terminal-client for webscraping torrent-sites'

# Module responsible for client communication
module Menu
  def self.start
    command :search do |c|
      c.syntax = 'torrentify-cli search [options]'
      c.summary = ''
      c.description = ''
      c.example 'description', 'command example'
      c.option '--some-switch', 'Some switch that does something'
      c.action do |args|
        search_param = args.join(' ')
        puts search_param
        Torrentify.search(search_param)
        # Do something or c.when_called Torrentify-cli::Commands::Search
      end
    end
  end
end
