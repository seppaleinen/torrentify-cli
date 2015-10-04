require_relative 'spec_helper'
require 'yaml'

RSpec.describe 'Settings' do
  context 'load yml-file' do
    it 'should not raise exception' do
      # expect { YAML.load_file('.settings.yml') }.to_not raise_error
    end

    it 'should contain imdb_user_id' do
      result = YAML.load_file('.settings.yml')
      expect(result['imdb_user_id'].first).to eql('ur32409321')
    end
  end
end