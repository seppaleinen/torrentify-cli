require 'simplecov'
SimpleCov.add_filter 'vendor'
SimpleCov.add_filter 'test'
SimpleCov.command_name 'Spec tests'
SimpleCov.start
require 'rspec'
