#!/usr/bin/env ruby

require 'rubygems'
require 'commander/import'
require 'torrentify'
require 'yaml'

# :name is optional, otherwise uses the basename of this executable
class Menu
  program :name, 'Torrentify'
  program :version, '1.0.0'
  program :description, 'Interface for searching through torrentsites.'
  def initialize(torrentify = Torrentify)
    @torrentify = torrentify
  end

  attr_accessor :torrentify

  def start
    command :search do |c|
      c.syntax = 'search foo'
      c.description = 'Search for torrents '
      c.option '--search-engine PIRATEBAY', String, 'Search piratebay'
      c.option '--search-engine ISOHUNT', String, 'Search isohunt'
      c.option '--search-engine KICKASS', String, 'Search kickass'
      c.option '--search-engine EXTRATORRENT', String, 'Search extratorrent'
      c.option '--search-engine ALL', String, 'Default. Searches all sites'
      c.action do |args, options|
        options.default :search_engine => 'ALL'
        results = @torrentify.search args.join(' '), options.search_engine
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
      c.syntax = 'imdb userid'
      c.description = 'Searches torrents for all movies on imdb watchlist'
      c.option '--option STRING', String, 'Displays ' \
        'titles from imdb watchlist or search for torrents'
      c.action do |args, options|
        options.default :option => 'show'
        imdb_user_id = ''
        if args.first.nil?
          yaml = YAML.load_file('.settings.yml')
          imdb_user_id = yaml['imdb_user_id'].first
        else
          imdb_user_id = args.first
        end
        results = @torrentify.imdb_watchlist(imdb_user_id)
        if options.option == 'download'
          results.each do |result|
            search_result = @torrentify.search_all_return_best(result)
            puts search_result
          end
        elsif options.option == 'show'
          results.each do |result|
            puts result
          end
        end
      end
    end

    command :bar do |c|
      c.syntax = 'foobar bar [options]'
      c.description = 'Display bar with optional prefix and suffix'
      c.option '--prefix STRING', String, 'Adds a prefix to bar'
      c.option '--suffix STRING', String, 'Adds a suffix to bar'
      c.action do |_args, options|
        options.default :prefix => '(', :suffix => ')'
        say "#{options.prefix}bar#{options.suffix}"
      end
    end
  end
end
