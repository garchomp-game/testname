require './classprofile.rb'

profile=Profile.new

total=profile.set("ガブリアス","1997/10/17","不思議のダンジョンで冒険")
puts
if total==true　#return trueを関数の最後にしている。
	puts "この処理は正しく実行できました"
end
=begin
クラスの関数内の最後で真偽値を返してもらい、それを用いて条件分岐する場合は、
一度変数を作って格納し、その後変数を使って条件分岐をすることができる。	

	
=end

# for i in 1..10 do
# puts "#{i}回目"
# profile.names
# profile.day
# profile.profiles
# puts 
# end