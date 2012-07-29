a=[]
class << a
	alias_method :old_last, :last
	define_method(:last) do |*args, &block|
		send "old_last", *args, &block
	end

	#def test
	#	puts self.last
	#end
end

a << 3
puts a.last
