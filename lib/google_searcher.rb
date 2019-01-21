require 'launchy'

def check_if_user_gave_input
  abort("You didn't enter an argument") if ARGV.empty?
end

def googlesearch

  array_for_argv = []
  array_for_argv << ARGV

  join_argv = []
  join_argv << array_for_argv.join(' ')


  #puts join_argv
  
  search = Launchy.open("https://www.google.com/search?q=#{join_argv}")
  
  return search
end

def combine
  check_if_user_gave_input
  googlesearch
end

combine