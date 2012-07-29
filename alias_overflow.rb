a = []
class << a
    Array.instance_methods(false).each do |meth|
			alias_name = "old_#{meth.to_s}"
            alias_method alias_name.to_sym, meth
        define_method(meth) do |*args, &block|
            send alias_name, *args, &block
            puts "hello"
        end  
    end
end

a << 3