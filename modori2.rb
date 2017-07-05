class Profiles
	def set(id,names,day,street)
		@id=id
		@names=names
		@day=day
		@street=street
	end
	def output
		humans=[@id,@names,@day,@street]
		puts humans[1]
		puts humans[2]
		puts humans[3]
	end
end
class Test < Profiles
	def set(id,names,day,street,tests)
		super(id,names,day,street)
		@tests=tests
	end
	def outputs
		print("#{@names}#{@day}#{@tests}")
	end
end


=begin
クラス継承メモ：継承するならば、同じ関数内の引数はしっかり使ってあげなければならない。
さもなければ継承せず手動で作ること（つまり継承するメリットは、作業を大きく減らせる、見やすくなる。などがある。
また、super使う際、直下にほかの定義も書くのであれば、引数は省略してはならない。
（ただしsuperして以降終わりであれば省略可能。)
=end