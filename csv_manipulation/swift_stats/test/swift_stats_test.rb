require 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/swift_stats'

class SwiftStatsTest < Minitest::Test

  def test_class_exists
    assert SwiftStats
  end

  def test_we_have_cleaned_up_lyrics
    ss = SwiftStats.new
    cleaned_lyrics = ["he", "said", "the", "way", "my", "blue", "eyes",
                      "shined", "put", "those", "georgia", "stars", "to",
                      "shame", "that", "night", "i", "said", "thats", "a",
                      "lie", "just", "a", "boy", "in", "a", "chevy", "truck",
                      "that", "had", "a", "tendency", "of", "gettin", "stuck",
                      "on", "backroads", "at", "night", "and", "i", "was", "right",
                      "there", "beside", "him", "all", "summer", "long", "and",
                      "then", "the", "time", "we", "woke", "up", "to", "find",
                      "that", "summer", "gone", "but", "when", "you", "think",
                      "tim", "mcgraw", "i", "hope", "you", "think", "my",
                      "favorite", "song", "the", "one", "we", "danced", "to",
                      "all", "night", "long", "the", "moon", "like", "a",
                      "spotlight", "on", "the", "lake", "when", "you", "think",
                      "happiness", "i", "hope", "you", "think", "that",
                      "little", "black"]

    assert_equal cleaned_lyrics, ss.clean_lyrics[0..100]
  end

  def test_count_unique_words
    ss = SwiftStats.new
    words = %w(apple pear blueberries banana cherry grape grapefruit
               chocolate cake apple apple cake donut cake steak bones
               grape grape grape blueberries pie banana puppies)

    more_words = %w(one fish two fish red fish blue fish)

    assert_equal 14, ss.unique_word_count(words)
    assert_equal 5, ss.unique_word_count(more_words)
  end

  def test_word_stats_method_does_the_thing
    ss = SwiftStats.new
    words = %w(apple pear blueberries banana cherry grape grapefruit
               chocolate cake apple apple cake donut cake steak bones
               grape grape grape blueberries pie banana puppies)

    assert_equal ({"apple"=>3, "pear"=>1, "blueberries"=>2,
                   "banana"=>2, "cherry"=>1, "grape"=>4,
                   "grapefruit"=>1, "chocolate"=>1, "cake"=>3,
                   "donut"=>1, "steak"=>1, "bones"=>1, "pie"=>1, "puppies"=>1}), ss.word_stats(words)
  end

  def test_top_used_words_also_does_the_thing
    ss = SwiftStats.new

    assert_equal ["are", "were", "in"], ss.top_used_words(3)
  end

end
