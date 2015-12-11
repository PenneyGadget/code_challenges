class SwiftStats

  attr_accessor :lyrics

  def initialize
    @lyrics = File.read("./lyrics.txt")
  end

  def clean_lyrics
    @lyrics.gsub(/[\d*":'!().]/, "").downcase.split(" ")
  end

  def unique_word_count(clean_lyrics)
    clean_lyrics.uniq.count
  end

  def word_stats(clean_lyrics)
    clean_lyrics.each_with_object(Hash.new(0)) { |word, count| count[word] += 1 }
  end

  def top_used_words(num)
    clean_lyrics.max_by(num) { |k, v| v}
  end

end
