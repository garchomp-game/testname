def modori1(n)
	human=[["aaa","1/1",nil],
	["bbb","2/2","yyy"],
	["ccc","3/3","zzz"]]
	return human[n]
end

for i in 0..2 do
	for j in 1..2 do
		x=modori1(i)[j]
		if x.nil?
			next
		else
			print "#{x} "
		end
	end
	puts
end




=begin
def modoriloop(n)
	modori1(n)
	for i in 0..2 do
		x=human[i]
		if human[i].include?(nil)
			next
		else
			return puts out= "#{human[i][1]},#{human[i][2]},#{human[i][3]}"
		end
	end
end
=end



=begin
複数IDがあって、そこから呼び出す場合はふforで回すのも一択。
関数の外にユーザー管理用の関数を設置するのも手としてはあるか、あるいはユーザー管理用関数を作成し、
get postを分ける方法もありかも。
nunn=nil
continue=next


=end