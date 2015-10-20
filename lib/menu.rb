#!/usr/bin/env ruby

require 'rubygems'
require 'commander/import'
require 'torrentify'
require 'yaml'
require_relative 'managers/imdb_manager'
require_relative 'managers/search_manager'

# Class responsible for the executable logic
class Menu
  program :name, 'Torrentify'
  program :version, '1.0.0'
  program :description, 'Interface for searching through torrentsites.'
  # Init file. Takes torrentify as input parameter
  def initialize(torrentify = Torrentify)
    @torrentify = torrentify
    @imdb_manager = ImdbManager.new
    @search_manager = SearchManager.new
  end

  # Accessor for torrentify class instance
  attr_accessor :torrentify

  # method with all command-logic
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
        @search_manager.start(args, options.search_engine)
      end
    end

    command :imdb do |c|
      c.syntax = 'imdb userid'
      c.description = 'Searches torrents for all movies on imdb watchlist'
      c.option '--option STRING', String, 'Displays ' \
        'titles from imdb watchlist or search for torrents'
      c.action do |args, options|
        options.default :option => 'show'
        @imdb_manager.start(args.first, options.option)
      end
    end
  end
end
