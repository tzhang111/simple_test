require 'drb'

class B
	def B.my_add(line, from)
		puts from + ': ' + line
	end
end
DRb.start_service('druby://127.0.0.1:61677', B)
# Fetch the shared object
A = DRbObject.new_with_uri('druby://127.0.0.1:61676')


while (line=gets).chomp != 'bye'
	A.my_add line, "client"
	B.my_add line, "client"
end
