require './classprofile.rb'

profile=Profile.new

profile.set("ガブリアス","1997/10/17","不思議のダンジョンで冒険")
for i in 1..10 do
puts "#{i}回目"
profile.names
profile.day
profile.profiles
puts 
end