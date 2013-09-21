require 'test/unit'
require 'codedryer'

class TestForwardRecipe < Test::Unit::TestCase

class A
	attr_accessor :my_param

	def foo(a,b)
		a*b+my_param
	end
end

class B
	attr_accessor :my_a

	forward :foo, :my_a
end

def test_forward_recipe
	b1 = B.new
	b1.my_a = A.new
	b1.my_a.my_param = 7
	assert_equal 13,b1.foo(2,3)
	b1.my_a.my_param = 8
	assert_equal 14,b1.foo(2,3)
end

end