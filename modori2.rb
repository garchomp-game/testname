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

=begin
インスタンス変数を使う理由がようやく理解できてきました。
インスタンス変数は、クラス内では関数を超えて使うことができるため、クラス内の
グローバル変数みたいな（？）感じで利用できて便利ですね！

=end