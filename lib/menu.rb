#!/usr/bin/env ruby

require 'rubygems'
require 'commander/import'
require 'torrentify'

# :name is optional, otherwise uses the basename of this executable
class Menu
  program :name, 'Foo Bar'
  program :version, '1.0.0'
  program :description, 'Stupid command that prints foo or bar.'
  def initialize(torrentify = Torrentify)
    @torrentify = torrentify
  end

  attr_accessor :torrentify

  def start
    command :search do |c|
      c.syntax = 'foobar foo'
      c.description = 'Displays foo'
      c.action do |args|
        results = @torrentify.search args.first
        results.each do |result|
          puts '---------------------------------'
          puts 'new search-engine'
          puts '---------------------------------'
          result.each do |torrent|
            puts torrent
          end
        end
      end
    end

    command :imdb do |c|
      c.syntax = 'foobar foo'
      c.description = 'Displays foo'
      c.action do |args|
        imdb_username = args.first
        results = @torrentify.imdb_watchlist(imdb_username)
        results.each do |result|
          puts result
        end
      end
    end

    command :bar do |c|
      c.syntax = 'foobar bar [options]'
      c.description = 'Display bar with optional prefix and suffix'
      c.option '--prefix STRING', String, 'Adds a prefix to bar'
      c.option '--suffix STRING', String, 'Adds a suffix to bar'
      c.action do |options|
        options.default :prefix => '(', :suffix => ')'
        say args
        say "#{options.prefix}bar#{options.suffix}"
      end
    end
  end
end
