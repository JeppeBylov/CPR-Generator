# define method before calling 
# 010488-1823
# Split the birthday in seperate digits and put them into an array with this function
def splitdigits string_of_numbers # 010488
	string_of_numbers.split('').map{|n| n.to_i} # => [0,1,0,4,8,8]
end

def combine_control_numbers first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth
	string_of_control = first + second + third + fourth + fifth + sixth + seventh + eighth + ninth + tenth
end

# Determine the 7th digit by century of birth.
def control_seven year_of_birth
	if year_of_birth[4..5].to_i.between?(00, 99)
		if year_of_birth[4..5].to_i.between?(37, 99)
			control_seven = [0,1,2,3,4].sample
		else
		control_seven = [0,1,2,3].sample
		end
	end
end

# This method generates the 7th, 8th and 9th digit and validates the full CPR number.
def control_eight
	# Random 8th digit
	control_eight = [0,1,2,3,4,5,6,7,8,9].sample
end

def control_nine
	# Random 9th digit
	control_nine = [0,1,2,3,4,5,6,7,8,9].sample
end

# Calculate the tenth digit based on Modulus11
def control_ten array_of_numbers, first, second, third
	control_1 = array_of_numbers[0] * 4
	control_2	= array_of_numbers[1] * 3
	control_3	= array_of_numbers[2] * 2
	control_4 = array_of_numbers[3] * 7
	control_5 = array_of_numbers[4] * 6
	control_6 = array_of_numbers[5] * 5
	control_7 = first * 4
	control_8 = second * 3
	control_9 = third * 2
	control_ciffer = 11 - ((control_1 + control_2 + control_3 + control_4 + control_5 + control_6 + control_7 + control_8 + control_9) % 11) 
	string_of_control = [control_1, control_2, control_3, control_4, control_5, control_6, control_7, control_8, control_9, control_ciffer]
end

# Validate the CPR number with Modulus11

def validate_cpr sex, array_of_numbers
	if sex == "male" && array_of_numbers[9] % 2 != 0 && array_of_numbers[9].to_s.length == 1
		validation = (array_of_numbers[0] + array_of_numbers[1] + array_of_numbers[2] + array_of_numbers[3] + array_of_numbers[4] + array_of_numbers[5] + array_of_numbers[6] + array_of_numbers[7] + array_of_numbers[8] + array_of_numbers[9]) % 11 
		if validation == 0
			puts "valid"
			return true
		else
			puts "invalid"
			return false
		end
	elsif sex == "female" && array_of_numbers[9] % 2 == 0 && array_of_numbers[9].to_s.length == 1
		validation = (array_of_numbers[0] + array_of_numbers[1] + array_of_numbers[2] + array_of_numbers[3] + array_of_numbers[4] + array_of_numbers[5] + array_of_numbers[6] + array_of_numbers[7] + array_of_numbers[8] + array_of_numbers[9]) % 11 
			if validation == 0
			puts "valid"
			return true
		else
			puts "invalid"
			return false
		end
	else
		puts "invalid"
		return false
	end
end

#010488-1823
#160591
=begin
#Collect information about person
puts "What's your Name?"
name = gets

if name 
	puts "What is your birthday? ex. 160591"
	birthday = gets.chomp
	puts "What is your sex? Male/Female"
	sex = gets.chomp
	sex.downcase!
end
=end

birthday = "160591"
sex = "male"

ar = splitdigits(birthday)
seven = control_seven(birthday)
eight = control_eight
nine = control_eight
array_of_numbers = control_ten(ar, seven, eight, nine)
validation = validate_cpr(sex, array_of_numbers)

puts "#{birthday}-#{seven}#{eight}#{nine}#{array_of_numbers[9]}"

=begin
puts "array: #{ar}"
puts "seven: #{seven}"
puts "eight: #{eight}"
puts "nine: #{nine}"
puts "ten: #{array_of_numbers[9]}"
=end