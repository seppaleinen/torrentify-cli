#!/usr/bin/env ruby

# Searchmanager
class SearchManager
  def start(args, search_engine)
    search_param = args.join(' ')

    results = Torrentify.search(search_param, search_engine)

    SearchManager.print_result(results)
  end

  def self.print_result(results)
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
