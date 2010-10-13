
  class Parser
rule
  collection: game_tree { result = val }
     | collection game_tree { result.push val[1] }

  game_tree: '(' sequence ')'   { result = val[1] }
      | '(' sequence collection ')'  
        {
           val[2][0].first.branches = val[2][1..-1]
           result = val[1] + val[2][0]
        }

  sequence: node { result = val }
      | sequence node { result.push val[1] }

  node: ';' { result = {} }
      | ';' properties { result = Node.new(val[1], nil)  } 

  properties: property { result = val[0] }
      | properties property { result.merge!(val[1]) }

  property: prop_ident prop_list { result = {val[0] => val[1]} }

  prop_list: prop_value { result = val }
      | prop_list prop_value { result.push val[1] }

  end

---- header
require 'sgf_tools/tokenizer'

module SgfTools
  class Node
    attr_accessor :properties
    attr_accessor :branches
  
    def initialize(prop, branches)
      @properties = prop
      @branches = branches
    end

    def inspect
      str = ""
      str << @properties.inspect
      if !@branches.nil? && @branches.size > 0
        str << " (#{@branches.size} variation(s))"
      end
      str
    end

    def [](key)
      @properties[key]
    end
  end

---- inner
 
    def parse_file(filename)
      @tokenizer = SgfTokenizer.new
      @tokenizer.load_file(filename)
      do_parse
    end

    def parse_string(str)
      @tokenizer = SgfTokenizer.new
      @tokenizer.scan_evaluate(str)
      do_parse
    end

    def next_token
      @tokenizer.next_token
    end

---- footer
end
