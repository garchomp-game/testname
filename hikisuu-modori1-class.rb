def modori1(n)
	human=[["12345","aaa","1/1","xxx"],
	["23456","bbb","2/2","yyy"],
	["34567","ccc","3/3","zzz"]]
	for i in 0..2 do
		x=human[i][0]
		if x.to_i==n
			out= "#{human[i][1]},#{human[i][2]},#{human[i][3]}"
			break
		else
			out= "error!"
		end
	end
	return puts out
end
modori1(12345)

=begin
複数IDがあって、そこから呼び出す場合はふforで回すのも一択。
関数の外にユーザー管理用の関数を設置するのも手としてはあるか、あるいはユーザー管理用関数を作成し、
get postを分ける方法もありかも。

=end