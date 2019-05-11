def english_number number
	if number < 0 # No negative numbers
		return 'Please enter a number that isn\'t neagtive'
	end
	if number == 0
		return 'zero'
	end

	# NO more special cases! No more returns!
	num_string = '' # This is the string we will return

	ones_place 	= [	'one', 		'two', 		'three',
					'four', 	'five', 	'six',
					'seven', 	'eight',	'nine']
	tens_place 	= [	'ten', 		'twenty',	'thirty',
					'forty',	'fifty',	'sixty', 
					'seventy',	'eighty',	'ninety']
	teenagers 	= [ 'eleven', 	'twelve', 	'thirteen',
					'fourteen', 'fifteen',	'sixteen',
					'seventeen', 'eighteen', 'nineteen']

	 # "left" is how much of the number
	 # 		we have left to write out
	 # "write" is the part we are
	 # 		writing out now.

	 left 	= number
	 write 	= left/1000000 			# How many millions left?
	 left 	= left - write*1000000 	# substract off those millions.

	if write > 0
		# Now here's the recursion:
		millions = english_number(write)
		num_string = num_string + millions + ' million'
		 if left > 0
		 	# So we don't write 'two millionfivehundrethousand'...
		 	num_string = num_string + ' '
		 end
	end
	

	write 	= left/1000 				# How many thousands left?
	left 	= left - write*1000 		# substract off those thousands.

	if write > 0
		# Now here's the recursion:
		thousands = english_number(write)
		num_string = num_string + thousands + ' thousand'
		 if left > 0
		 	# So we don't write 'two thousandthreehundred'...
		 	num_string = num_string + ' '
		 end
	end

	 write 	= left/100 			# How many hundred left?
	 left 	= left - write*100 	# substract off those hundreds.

	if write > 0
		# Now here's the recursion:
		hundreds = english_number(write)
		num_string = num_string + hundreds + ' hundred'
		 if left > 0
		 	# So we don't write 'two hundrefifty-one'...
		 	num_string = num_string + ' '
		 end
	end

	write = left/10 			# How many tens left?
	left = left - write*10		# Substract off those tens

	if write > 0
		if ((write == 1) and (left > 0))
			# Since we can't write "tenty-two" instead of
			# "twelve", we have to make a special exception
			# for these
			num_string = num_string + teenagers[left-1]
			# The "-1" us because teenagers[3] is
			# "fourteen", not "thirteen".
			# Since we took care of the digit in the
			# ones place already, we have nothing left to write
			left = 0
		else
			num_string = num_string + tens_place[write-1]
			# The "-1" is because tens_place[3] is
			# 'forty' not 'thirty'
		end
		if left > 0
			# So we don't write 'sixtyfour'
			num_string = num_string +  '-'
		end
	end

	write = left 	# How many ones left to write out?
	left = 0 		# substract off those ones

	if write > 0
		num_string = num_string + ones_place[write-1]
		# The "-1" is because ones_place[3]
		# is 'four', not 'three'
	end

	# Now we just return "num_string"
	return num_string
end

puts english_number(	0)
puts english_number(	9)
puts english_number(	10)
puts english_number(	11)
puts english_number(	17)
puts english_number(	32)
puts english_number(	88)
puts english_number(	99)
puts english_number(	100)
puts english_number(	101)
puts english_number(	234)
puts english_number(	3211)
puts english_number(	2000000)
puts english_number(	5453234)
puts english_number(	1000000000)
