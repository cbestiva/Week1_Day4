pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

class Person

	# each instance of Person will have a stomach and an allergy
	attr_accessor :stomach, :allergy

	# have each instance of Person take in an arguement allergy
	# set allergy to nil by default if person has no allergies
	def initialize(allergy=nil)
		@stomach = [] 
		@allergy = allergy
	end

	def eat(food)
		# if an error rises you still want 
		# the rest of the code to run 
		# beginning here
		begin
		if food.include?(@allergy)
			#puts "BARF, I am allergic!"
			# barf up everything inside stomach
			inside_stomach = @stomach.join.gsub(" ", "")
			barf = inside_stomach.split("").shuffle.join
			puts "BARF:#{barf}"
			# raise an instance of allergyError
			raise AllergyError.new(@allergy) 
		else
			# put food into stomach
			@stomach << food
			puts "Yummy in my tummy!"
		end
		# when an error is raised, rescue it and
		# assign it to a variable 
		rescue AllergyError => errorMessage
		# output of errorMessage
		puts "No! This has #{errorMessage.allergy} in it!"
		# end of the code to run
		end
	end

end


# create a class AllergyError as a subclass of RuntimeError
class AllergyError < RuntimeError
	# each instance of AllergyError will have an allergy
	attr_accessor :allergy

	# have each instance of AllergyError take in an argument allergy
	def initialize(allergy)
		@allergy = allergy
	end	
end



Chris = Person.new("gluten")
# Chris.eat(pizza)
# Chris.eat(pan_seared_scallops)
# Chris.eat(water)

Beth = Person.new("scallops")
# Beth.eat(pizza)
# Beth.eat(pan_seared_scallops)
# Beth.eat(water)

#-----------------------------------------------

	Chris.eat(pan_seared_scallops)
 	Chris.eat(water)
 	Chris.eat(pizza)
	Beth.eat(pizza)
	Beth.eat(water)
	Beth.eat(pan_seared_scallops)
	


