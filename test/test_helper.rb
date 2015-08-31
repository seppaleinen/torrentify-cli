require 'simplecov'
SimpleCov.add_filter 'vendor'
SimpleCov.add_filter 'test'
SimpleCov.command_name 'Unit tests'
SimpleCov.start
require 'test/unit'
