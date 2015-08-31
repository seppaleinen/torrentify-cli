#!/usr/bin/env ruby

require 'rubygems'
require 'commander/import'

program :version, '0.1'
program :description, 'Terminal-client for webscraping torrent-sites'

command :search do |c|
  c.syntax = 'torrentify-cli search [options]'
  c.summary = ''
  c.description = ''
  c.example 'description', 'command example'
  c.option '--some-switch', 'Some switch that does something'
  c.action do |args|
    puts args
    # Do something or c.when_called Torrentify-cli::Commands::Search
  end
end
