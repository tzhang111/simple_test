require 'drb'
a = []
class << a
    Array.instance_methods(false).each do |meth|
			alias_name = "old_#{meth.to_s}"
            alias_method alias_name.to_sym, meth
        define_method(meth) do |*args, &block|
		    old_size = size
            send alias_name, *args, &block
            puts_last if size != old_size
        end if meth != :size && meth != :last #should add this, because when executing other methods, last may not be redined, so it will return nil 
    end

    def puts_last
		puts "server: #{self.last}" # or just use self.old_last
	end	
end

DRb.start_service('druby://127.0.0.1:61676', a)

while (line=gets).chomp != 'bye'
	a << line
end


