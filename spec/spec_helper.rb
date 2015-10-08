require 'simplecov'
SimpleCov.add_filter 'vendor'
SimpleCov.add_filter 'test'
SimpleCov.command_name 'Spec tests'
SimpleCov.start
require 'rspec'
require 'webmock/test_unit'
WebMock.disable_net_connect!(:allow_localhost => true)
require 'stringio'

def capture_stdout(&block)
  original_stdout = $stdout
  $stdout = fake = StringIO.new
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  fake.string
end
