#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.6
# from Racc grammer file "".
#

require 'racc/parser.rb'

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

class Parser < Racc::Parser

module_eval(<<'...end parser.y/module_eval...', 'parser.y', 58)
 
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

...end parser.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
     4,    15,     3,     3,    11,     8,     3,    16,     8,     9,
     3,    15,    19,    20 ]

racc_action_check = [
     1,     8,     1,     6,     6,     6,    10,    10,     3,     4,
     0,    13,    15,    18 ]

racc_action_pointer = [
     8,     0,   nil,     4,     9,   nil,     1,   nil,    -4,   nil,
     4,   nil,   nil,     6,   nil,     6,   nil,   nil,     7,   nil,
   nil ]

racc_action_default = [
   -14,   -14,    -1,   -14,   -14,    -2,   -14,    -5,    -7,    21,
   -14,    -3,    -6,    -8,    -9,   -14,    -4,   -10,   -11,   -12,
   -13 ]

racc_goto_table = [
     5,     1,     7,    14,    13,    12,     6,    10,    17,     5,
    18 ]

racc_goto_check = [
     2,     1,     4,     6,     5,     4,     3,     1,     6,     2,
     7 ]

racc_goto_pointer = [
   nil,     1,    -1,     3,    -1,    -4,    -5,    -5 ]

racc_goto_default = [
   nil,   nil,     2,   nil,   nil,   nil,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 8, :_reduce_1,
  2, 8, :_reduce_2,
  3, 9, :_reduce_3,
  4, 9, :_reduce_4,
  1, 10, :_reduce_5,
  2, 10, :_reduce_6,
  1, 11, :_reduce_7,
  2, 11, :_reduce_8,
  1, 12, :_reduce_9,
  2, 12, :_reduce_10,
  2, 13, :_reduce_11,
  1, 14, :_reduce_12,
  2, 14, :_reduce_13 ]

racc_reduce_n = 14

racc_shift_n = 21

racc_token_table = {
  false => 0,
  :error => 1,
  "(" => 2,
  ")" => 3,
  ";" => 4,
  :prop_ident => 5,
  :prop_value => 6 }

racc_nt_base = 7

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "\"(\"",
  "\")\"",
  "\";\"",
  "prop_ident",
  "prop_value",
  "$start",
  "collection",
  "game_tree",
  "sequence",
  "node",
  "properties",
  "property",
  "prop_list" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'parser.y', 3)
  def _reduce_1(val, _values, result)
     result = val 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 4)
  def _reduce_2(val, _values, result)
     result.push val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 6)
  def _reduce_3(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 9)
  def _reduce_4(val, _values, result)
               val[2][0].first.branches = val[2][1..-1]
           result = val[1] + val[2][0]
        
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 13)
  def _reduce_5(val, _values, result)
     result = val 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 14)
  def _reduce_6(val, _values, result)
     result.push val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 16)
  def _reduce_7(val, _values, result)
     result = {} 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 17)
  def _reduce_8(val, _values, result)
     result = Node.new(val[1], nil)  
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 19)
  def _reduce_9(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 20)
  def _reduce_10(val, _values, result)
     result.merge!(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 22)
  def _reduce_11(val, _values, result)
     result = {val[0] => val[1]} 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 24)
  def _reduce_12(val, _values, result)
     result = val 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 25)
  def _reduce_13(val, _values, result)
     result.push val[1] 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Parser

end
