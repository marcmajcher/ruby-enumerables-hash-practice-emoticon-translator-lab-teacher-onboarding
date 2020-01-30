require "yaml"

def load_library(path)
  lib = YAML.load(File.read(path))
  lib.keys.reduce({ :get_meaning => {}, :get_emoticon => {} }) { |ret, key|
    ret[:get_meaning][lib[key][1]] = key
    ret[:get_emoticon][lib[key][0]] = lib[key][1]
    ret
  }
end

def get_japanese_emoticon(file, emo)
  lib = load_library(file)
  lib[:get_emoticon][emo] ? lib[:get_emoticon][emo] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emo)
  lib = load_library(file)
  lib[:get_meaning][emo] ? lib[:get_meaning][emo] : "Sorry, that emoticon was not found"
end
