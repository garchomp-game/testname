class Profile
	def set(names,day,profiles)
		@name=names
		@day=day
		@profiles=profiles
	end
	def names
		puts "私の名前は#{@name}です。"
	end
	def day
		puts "生年月日は、#{@day}です。"
	end
	def profiles
		puts "好きなことは#{@profiles}をすることです。"
	end
end




