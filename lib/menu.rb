#!/usr/bin/env ruby

require 'rubygems'
require 'commander/import'
require 'torrentify'

# :name is optional, otherwise uses the basename of this executable
class Menu
  program :name, 'Foo Bar'
  program :version, '1.0.0'
  program :description, 'Stupid command that prints foo or bar.'

  def start
    command :search do |c|
      c.syntax = 'foobar foo'
      c.description = 'Displays foo'
      c.action do |args|
        Torrentify.search args.first
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
