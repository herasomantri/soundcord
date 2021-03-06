# encoding: utf-8

require 'test/unit'
require 'soundcord'

module SoundCord
  class PtBrWordTest < Test::Unit::TestCase
    def setup
      SoundCord.load_language 'pt-BR'
    end

    def test_simple_words_pt_br
      assert_equal 'J', 'João'.phonetize
      assert_equal 'MR', 'Maria'.phonetize
      assert_equal 'LM', 'Helena'.phonetize
      assert_equal 'VLM', 'Valmir'.phonetize
      assert_equal 'VLM', 'Walmir'.phonetize
    end
    def test_simple_comparisons_pt_br
      assert_equal true, 'Joao'.homophone?('João')
      assert_equal true, 'Helena'.homophone?('Elena')
      assert_equal true, 'Walmir'.homophone?('Valmir')
      assert_equal true, 'Marria'.homophone?('Maria')
      assert_equal true, 'Wagner'.homophone?('Vagner')
      assert_equal true, 'Mirela'.homophone?('Mirella')
      assert_equal true, 'Artur'.homophone?('Arthur')
      assert_equal true, 'Diego'.homophone?('Dyego')
      assert_equal true, 'Felipe'.homophone?('Phelipe')
      assert_equal true, 'Filipe'.homophone?('Felipe')
      assert_equal true, 'Phelipe'.homophone?('Filipe')
      assert_equal true, 'Philippe'.homophone?('Felipe')
    end
    def test_special_chars_pt_br
      assert_equal true, 'Luçia'.homophone?('lucia')
      assert_equal true, 'Lúcio'.homophone?('lucio')
    end
    def test_find_in_collection_pt_br
      list = %w( saola paulo saulo ricardo sallo )
      expected = %w( saola saulo sallo )
      assert_equal expected, list.homophones('saulo')
      list = %w( leonardo lucene rodrigo luciana lussene )
      expected = %w( lucene luciana lussene )
      assert_equal expected, list.homophones('lucene')
    end
  end
end