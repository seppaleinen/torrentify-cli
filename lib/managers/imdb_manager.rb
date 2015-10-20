#!/usr/bin/env ruby

# Documentation for rubocop
class ImdbManager
  def start(imdb_username, option)
    imdb_username = ImdbManager.get_username(imdb_username)

    results = Torrentify.imdb_watchlist(imdb_username)

    ImdbManager.show_or_search_title(results, option)
  end

  def self.get_username(imdb_username)
    if imdb_username.nil?
      yaml = YAML.load_file('.settings.yml')
      imdb_username = yaml['imdb_user_id'].first
    end
    imdb_username
  end

  def self.show_or_search_title(titles, option)
    if option == 'download'
      titles.each do |title|
        search_result = Torrentify.search_all_return_best(title)
        puts search_result
      end
    elsif option == 'show'
      titles.each do |title|
        puts title
      end
    end
  end
end
