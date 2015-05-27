require 'bundler/setup'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require '../pig_latin'


class TestPigify < MiniTest::Test

  def setup
    @translations = {
      "human"                                               => "umanhay",
      "transformation"                                      => "ansformationtray",
      "occupying"                                           => "occupyingyay",
      "combat complains"                                    => "ombatcay omplainscay",
      "The Resemblance Mutters"                             => "Ethay Esemblanceray Uttersmay",
      "15 Dangerous Facts Electricians Keep To Themselves"  => "15 Angerousday Actsfay Electriciansyay Eepkay Otay Emselvesthay",
      # "The unpopular glory renames an ice!"                 => "Ethay unpopularyay oryglay enamesray anyay iceyay!"
    }
  end

  def test_pig_latin
    @translations.each do |english, pig_latin|
      assert_equal pig_latin, PigLatin.translate(english)
    end
  end
end
