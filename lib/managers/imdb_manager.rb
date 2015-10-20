#!/usr/bin/env ruby

# Documentation for rubocop
class ImdbManager
  def start(imdb_username, option)
    if imdb_username.nil?
      yaml = YAML.load_file('.settings.yml')
      imdb_username = yaml['imdb_user_id'].first
    end

    results = Torrentify.imdb_watchlist(imdb_username)

    if option == 'download'
      results.each do |result|
        search_result = Torrentify.search_all_return_best(result)
        puts search_result
      end
    elsif option == 'show'
      results.each do |result|
        puts result
      end
    end
  end
end
