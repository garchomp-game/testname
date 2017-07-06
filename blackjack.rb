class Player
	def initialize
		@my_cards=Array.new
	end
	def open
		return @my_cards
	end
	def set_card(n)
		@my_cards.push(n)
	end
	def check_sum
		p @my_cards
		
		# 
		while true
			a=gets.chomp
			if a=="y"
				return true
			elsif a=="n"
				return false
			else
				puts "正しく入力してください"
			end
		end
	end

end



class Dealer < Player
	def initialize
		super
		@cards=(1..13).to_a*4
		@b=rand(0..12)
		@dealer_cards=Array.new
	end
	def open
		return @dealer_cards
	end
	def set_card(n)
		@dealer_cards.push(n)
	end
	def deal
		#p @cards
		
			b=(@cards.slice(rand(0..11)))
			if b==11||b==12||b==13
				b=10
			end
			return b
			
		

	end
	def hit
		
		b=(@cards.slice!(rand(0..12)))
		if b==11||b==12||b==13
			b=10
		end
		return b	
			
	end
end

player=Player.new
dealer=Dealer.new


2.times do
		player.set_card(dealer.deal)
		dealer.set_card(dealer.deal)
end
#p dealer.open
puts "追加しますか？(y/n)"
while player.check_sum==true
	x=dealer.hit
	dt=dealer.open.inject{|sum,i|sum+i}
	if x==nil
		redo		
	else
		player.set_card(x)
	end
	
	if x==nil
		redo		
	elsif dt<=15
		dealer.set_card(x)
	end
	
	puts "追加しますか？(y/n)"
end
puts "judge!"
puts
puts
#puts player.open
total_p=player.open.inject{|sum,i|sum+i}
total_d=dealer.open.inject{|sum,i|sum+i}

puts "あなたの合計の数字は#{total_p}、ディーラーの合計は#{total_d}..."
if total_p==21
	puts "great!Black Jack!!"
elsif total_p>=22
	puts "残念！オーバーしてしまいました…"
elsif total_p<=21&&total_d>=22
	puts "ディーラーがオーバーしたのであなたの勝ちです！"
elsif total_p<total_d
	puts "あなたの負けです…"
elsif total_p>total_d
	puts "あなたの勝ちです！"
else
	puts "同点..."
end
	