
require 'test/unit'
require 'rubygems'
require 'sgf_parser'

class SgfParserTest < Test::Unit::TestCase
    
  def test_parse_simple
    p = SgfParser.new
    simple_sgf = <<END_OF_SGF
(;FF[4]C[root](;C[a];C[b](;C[c])
(;C[d];C[e]))
(;C[f](;C[g];C[h];C[i])
(;C[j])))
END_OF_SGF
    game = p.parse_string(simple_sgf).first
    assert_equal(4, game.size)
    assert_equal(nil, game[0].branches)
    assert_equal(1, game[1].branches.size)
    assert_equal(nil, game[2].branches)
    assert_equal(4, game[1].branches[0].size)
    assert_equal(1, game[1].branches[0][1].branches.size)
  end
 
end

