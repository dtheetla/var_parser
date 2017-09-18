require "test_helper"

class VarParserTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::VarParser::VERSION
  end

  def test_extract_instance_vars_works
    list = VarParser.extract_instance_vars(Dir.pwd + '/test/sample.txt')
    assert_equal 2,list.size
    assert_equal '@abc',list[0]
    assert_equal '@string',list[1]
  end
end
