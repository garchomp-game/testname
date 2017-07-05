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

	def changeName(names)
		@name=names
	end
	def changeDay(day)
		@day=day
	end
	def changeProfile(profile)
		@profile=profile
	end
	
	def getName
		puts @name
	end
	def getDay
		puts @day
	end
	def getProfile
		puts @profile
	end
end