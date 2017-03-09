
def get_word
  words = File.readlines("dictionary.txt")
  game_words = []

  words.each do |word|
    word.gsub!(/\s+/, "")
    game_words << word if word.length.between?(5,12) && word[0] != word[0].upcase
  end
    puts game_words[rand(0...game_words.size)]
end

def new_game
  
end
