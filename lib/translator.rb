require "yaml"
require "pry"
# require modules here

def load_library(file_path)
  hash = YAML.load_file(file_path)
  library = hash.each_with_object({}) {|(key, data), final|
    final[key] = {
      :english => data[0],
      :japanese => data[1]
    }
  }
  library
end

def get_japanese_emoticon(file_path, western_emoticon)
  data = load_library(file_path)
  emoticon_key = ""
  data.each{|key, inner_data|
    inner_data.each{|inner_key, emoticon|
      if(emoticon == western_emoticon)
        emoticon_key = key
        break
      end
    }
  }
  if (emoticon_key == '')
    return "Sorry, that emoticon was not found"
  else
    return data[emoticon_key][:japanese]
  end
end

def get_english_meaning(file_path, japanese_emoticon)
  data = load_library(file_path)
  emoticon_key =''
  data.each{|key, inner_data|
    inner_data.each{|inner_key, emoticon|
      if ( emoticon == japanese_emoticon)
        emoticon_key = key
        break
      end 
    }
  }
  if(emoticon_key == '')
    return "Sorry, that emoticon was not found"
  else 
    return emoticon_key.to_s
  end
end

