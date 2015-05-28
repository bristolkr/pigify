class PigLatin

  def self.translate(phrase)
    phrase.split.map { |word| translate_word(word) }.join(' ')
  end

  def self.translate_word(word)
    @caps  = /^[A-Z]/ =~ word
    punct  = /[[:punct:]]/ =~ word
    length = word.index(/[aeiou]/i)
      if punct
        end_mark = word[-1]
        word.gsub!(/[^\w\s\d]/, '')
      end
    
    if length
      prefix = word.slice(0, length)
      suffix = length == 0 ? 'yay' : prefix + 'ay'
      suffix.downcase!
      word_tr = word[length..-1] + suffix
      word_tr.capitalize! if @caps
    if punct
      word_tr.insert(-1, end_mark).split
    end
      word_tr
    else
      word
    end
  end
end
