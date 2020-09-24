require "yaml"
require "pry"
# require modules here

def load_library
  hash = YAML.load_file('lib/emoticons.yml')
  library = hash.each_with_object({}) {|(key, data), final|
    final[key] = {
      :english => data[0],
      :japanese => data[1]
    }
  }
  binding.pry
  library
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end

load_library