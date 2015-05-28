# Create a "pig latin" translator, using a test-driven approach. 
# In the past I've given you the tests to run, but this time you'll create your own from scratch.

# Here is one approach to creating an API for your translator:

# PigLatin.translate "hello" # => "ellohay"
# I'll leave that decision up to you, but I do want you to include a full test suite that uses all the phrases I give below. 
# They start from simple words and move on to phrases with capitalization and punctuation that should be preserved. 
# You might need to use some Regular Expressions to get that done.

# Remember to start simple, write a test for the first word, "human" and get it working, upping the complexity and refactoring your code as you go. 
# Use past assignments for ideas on how to structure your project.

# Bonus: Extend ruby's string class to be able to pigify a string:
#   "Hello".pigify # => "Ellohay"


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
