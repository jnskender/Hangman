require 'pstore'

def get_word
    words = File.readlines('dictionary.txt')
    game_words = []

    words.each do |word|
        word.gsub!(/\s+/, '')
        game_words << word if word.length.between?(5, 12) && word[0] != word[0].upcase
    end
    game_words[rand(0...game_words.size)]
end

def check_winner(guesses)
    if guesses.include? '_'
        false
    else
        puts 'You win!'
        true
    end
end

def load_game(type)
    store = PStore.new('storagefile')

    if type.casecmp('new').zero?
        turns = 6
        secret_word = get_word
        correct_guesses = []
        incorrect_guesses = []
        secret_word.length.times { correct_guesses << '_' }
    elsif type.casecmp('load').zero?
        turns = store.transaction { store[:turns] }
        secret_word = store.transaction { store[:secret_word] }
        correct_guesses = store.transaction { store[:correct_guesses] }
        incorrect_guesses = store.transaction { store[:incorrect_guesses] }
    end

    until turns == 0 || check_winner(correct_guesses)

        puts "#{turns} tries left | #{correct_guesses.join(' ')} "
        puts 'Please guess a letter, or type "save" to save game!'
        guess = gets.chomp

        if guess.casecmp('save').zero?
            store.transaction do
                store[:turns] = turns
                store[:secret_word] = secret_word
                store[:correct_guesses] = correct_guesses
                store[:incorrect_guesses] = incorrect_guesses
                puts 'See you back next time!'
                turns = 0
            end
        elsif secret_word.include? guess
            puts "You've already guessed that!" if correct_guesses.include? guess
            occurences = (0...secret_word.length).find_all { |i| secret_word[i] == guess } # check for multiple occurences
            occurences.each { |i| correct_guesses[i] = guess }
        else # Incorrect Guess
            if incorrect_guesses.include? guess
                puts "You've already guessed that!"
            else
                incorrect_guesses << guess
                puts 'Sorry! No go!'
                turns -= 1
                puts 'You lose!' if turns == 0
            end
        end
    end # end until

    puts "The word was : #{secret_word}" unless guess.casecmp('save').zero? #Don't show answer on save!
    puts 'Thanks for playing!'
end

game_type = ""
loop do
    puts 'Welcome to Hangman! Please choose an option below:'
    puts '1) New Game'
    puts '2) Load Previous Game'
    game_type = gets.chomp
    break if game_type =~ /[1,2]/
    puts "Invalid Input"
end

if game_type == '1'
    load_game('new')
elsif game_type == '2'
    load_game('load')
end
