
cards=(1..13).to_a*4

p cards


total=[]

=begin
ランダムな数字を生成してループ内に値を入れる場合には、ランダム関数、格納する変数ともにループ内にいなければならない（クロージャと似ている？）
=end
while true
	b=rand(0..12)
	z=(cards.slice!(b))
	if z==nil
		redo
	end
	a=gets.chomp
	if a=="y"
		total.push(z)
		print total
	else
		break
	end
end