class Profile
	def initialize(n,names,day,profiles,last)
		@n=n
		@name=names
		@day=day
		@profile=profiles
		@last=last
	end
	def output
		puts "#{@n}の名前は#{@name}。"
		puts "生年月日は、#{@day}"
		puts "趣味は#{@profile}。#{@last}"
	end
end