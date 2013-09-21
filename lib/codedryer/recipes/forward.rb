class Class

	module ForwardRecipe

		def forward(method,target_accessor)
			define_method(method) do |*args|
				# find target
				target = send(target_accessor)
				# forward the method call with all the args
				# to the target
				target.send(method,*args)
			end
		end

	end

	include ForwardRecipe

end

module Codedryer

# It is responsible to traverse the lightmodel
# and find where it could be applied, then apply
# itself
class ForwardRecipe

	def applyable?
		true
	end

	def name
		'ForwardRecipe'
	end

end

end