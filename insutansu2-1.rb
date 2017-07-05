require "./insutansu1.rb"

profile=Profile.new("俺","ガブリアス","10/17","ダンジョンに行くこと","よろしくなっ！")
profile.output


profile.changeName("garchomp")
profile.changeDay("11/28")
profile.changeProfile("不思議のダンジョンの開拓")

puts
puts
profile.getName
profile.getDay
profile.getProfile

puts
puts
profile.output