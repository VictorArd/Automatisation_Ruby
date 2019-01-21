
def check_if_user_gave_input
  abort("Ajoute un nom au dossier après mkdirruby") if ARGV.empty?
end


def get_folder_name
  return name = ARGV.first
end


def create_folder(name)
	name = get_folder_name
 	Dir.mkdir("#{name}")
 	Dir.mkdir("#{name}/lib") 
 	File.open("#{name}/.env", "w+")
 	File.open("#{name}/README.md", "w+")
 	File.open("#{name}/.gitignore", "w+")do |line|
 		line.puts ".env"
 	end
 	File.open("#{name}/Gemfile", "w+") do |line|
 		line.puts "source \"https://rubygems.org\"\nruby '2.5.1'\ngem 'pry'\ngem 'rspec'\ngem 'pry'\ngem 'rubocop', '~> 0.57.2'\ngem 'dotenv'\ngem 'nokogiri'\ngem 'open_uri_redirections'\n"
 	end

 	Dir.chdir("#{name}/")
 	system("rspec --init")
 	system("git init")
 	system("bundle install")
end

def combine
	name = get_folder_name
	check_if_user_gave_input
 	create_folder (name)
end

combine
