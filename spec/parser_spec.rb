require 'sgftools'

describe SgfTools::Parser do 
  
  it "should parse sgf with single game with branches" do
    @simple_sgf = <<-END_OF_SGF
(;FF[4]C[root](;C[a];C[b](;C[c])
(;C[d];C[e]))
(;C[f](;C[g];C[h];C[i])
(;C[j])))
END_OF_SGF
    p = SgfTools::Parser.new
    game = p.parse_string(@simple_sgf).first
    game.size.should == 4
    game[0].branches.should == nil
    game[1].branches.size.should == 1
    game[2].branches.should == nil
    game[1].branches[0].size.should == 4
    game[1].branches[0][1].branches.size.should == 1
  end
end    
