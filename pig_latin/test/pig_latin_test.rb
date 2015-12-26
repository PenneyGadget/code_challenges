require 'minitest/test'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/pig_latin'

class PigLatinTest < Minitest::Test

  def test_class_exists
    p = PigLatin.new

    assert p
  end

  def test_prep_word_method_works
    p = PigLatin.new
    p.word = "apple"

    assert_equal ["a", "p", "p", "l", "e"], p.prep_word
  end

  def starts_with_vowel_method
    p = PigLatin.new
    p.word = "apple"
  end

end
