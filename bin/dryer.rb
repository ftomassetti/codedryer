require 'codedryer'
require 'commander/import'
require 'lightmodels'
require 'ruby-lightmodels'

program :name, 'dryer'
program :version, Codedryer::VERSION
program :description, 'Dry your code'

module Codedryer

class Dryer 

def initialize
	@recipes = [ForwardRecipe.new]
end

def dry(dir)
	say "Drying #{dir}"
	# load all the models
	LightModels::Ruby.handle_models_in_dir(dir, Proc.new do |f,m|
		warn "* considering #{f}"
		m.traverse do |n|
			if n
				@recipes.each do |r|
					if r.applyable?
						say "In #{f} found application of #{r.name}"
						begin
							code = LightModels::Ruby.to_code(n)
						rescue
							code = "<code not available>"
						end
						say "\n\t#{code}\n"
					end
				end
			end
		end		
	end)
end

end

end

command :dry do |c|
  c.syntax = 'dryer dry dir-to-dry'
  c.description = 'Dry the code'
  c.action do |args, options|
  	dir = args[0]
  	if File.exist?(dir)  		
  		if File.directory?(dir)
  			dryer = Codedryer::Dryer.new
  			dryer.dry(dir)
  		else
  			say "Given path is not a dir"
  		end
  	else
    	say "Given dir do not exist"
    end
  end
end
