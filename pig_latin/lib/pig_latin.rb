require 'pry'

class PigLatin

  attr_accessor :word

  def initialize
    @word = word
    @vowels = ["a", "e", "i", "o", "u"]
  end

  def run
    welcome
    while @word != "exit!"
      prep_word
      pig_latinify
      puts "Next word:"
      @word = gets.chomp.downcase
    end
    quit
  end

  def welcome
    puts "Hello, please enter a word:"
    @word = gets.chomp.downcase
  end

  def prep_word
    @word = @word.chars
  end

  def starts_with_vowel?
    @vowels.include?(@word[0])
  end

  def pig_latinify
    if starts_with_vowel?
      puts "#{@word.join}-way"
    else
      first_letter = @word.shift
      puts "#{@word.join}-#{first_letter}ay"
    end
  end

  def quit
    puts "oodbye-gay!"
    exit
  end

end

# p = PigLatin.new
# p.run

 #bonus - translate back the other way
