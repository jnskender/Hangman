#Hangman

##Implementation
This game reads in a predefined list of words stored in "/dictionary.txt". It creates
a secret word between 5 and 12 characters that the user then has to guess by guessing individual characters. At any point the user can save their progress into "/storagefile" with the use of the Ruby library pson. At the start of the program the user is given an option to load their last save or start a new game.

##Sample I/O
<pre><code>
Welcome to Hangman! Please choose an option below:
1) New Game
2) Load Previous Game
$=> 1
6 tries left | _ _ _ _ _ _ _ _ _ _
Please guess a letter, or type "save" to save game!
$=> a
Sorry! No go!
5 tries left | _ _ _ _ _ _ _ _ _ _
Please guess a letter, or type "save" to save game!
$=> e
5 tries left | _ _ _ _ e _ _ _ _ _
Please guess a letter, or type "save" to save game!
$=> i
5 tries left | _ _ _ _ e _ _ i _ _
Please guess a letter, or type "save" to save game!
$=> o
5 tries left | _ o _ _ e _ _ i _ _
Please guess a letter, or type "save" to save game!
$=> u
5 tries left | _ o _ u e _ _ i _ _
Please guess a letter, or type "save" to save game!
$=> r
Sorry! No go!
4 tries left | _ o _ u e _ _ i _ _
Please guess a letter, or type "save" to save game!
$=> s
4 tries left | _ o _ u e _ _ i s _
Please guess a letter, or type "save" to save game!
$=> t
4 tries left | _ o _ u e t t i s _
Please guess a letter, or type "save" to save game!
$=> l
Sorry! No go!
3 tries left | _ o _ u e t t i s _
Please guess a letter, or type "save" to save game!
$=> p
Sorry! No go!
2 tries left | _ o _ u e t t i s _
Please guess a letter, or type "save" to save game!
$=> save
See you back next time!
Thanks for playing!

$=> ruby hangman.rb

Welcome to Hangman! Please choose an option below:
1) New Game
2) Load Previous Game
$=> 2
2 tries left | _ o _ u e t t i s _
Please guess a letter, or type "save" to save game!
$=> p
You've already guessed that!
2 tries left | _ o _ u e t t i s _
Please guess a letter, or type "save" to save game!
$=> g
Sorry! No go!
1 tries left | _ o _ u e t t i s _
Please guess a letter, or type "save" to save game!
$=> b
Sorry! No go!
You lose!
The word was : coquettish
Thanks for playing!
</code></pre>
