require 'drb'
class A
	def A.my_add(line, from)
		puts from + ': ' + line
	end
end

DRb.start_service('druby://127.0.0.1:61676', A)
B = DRbObject.new_with_uri('druby://127.0.0.1:61677')

while (line=gets).chomp != 'bye'
	A.my_add line, "server"
	B.my_add line, "server"
end


