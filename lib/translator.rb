require "yaml"
require "pry"
# require modules here

def load_library
  hash = YAML.load_file('lib/emoticons.yml')
  library = hash.map{|key, data|
    key = {
      :english => data[0],
      :japanese => data[1]
    }
  }
  library
  binding.pry
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end

load_library