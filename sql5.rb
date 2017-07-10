
require 'mysql2'


client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')

# puts("DB connected!")
# puts('plase profilesID,name,tell,age,birthday')
# x=gets.chomp.split(',')
client.query(%q{delete from profiles where pforileID=7;})
# statement.execute(x[0],x[1].to_s,x[2].to_s,x[3],x[4].to_s)

client.query(%q{select * from profiles; }).each do|i|
  puts i
end


=begin
C:\Users\guest1Day\Desktop>ruby test3.rb
{"pforileID"=>1, "name"=>"\u7530\u4E2D\u3000\u5B9F", "tell"=>"012-345-6789", "age"=>30, "birthday"=>#<Date: 1994-02-01 ((2449385j,0s,0n),+0s,2299161j)>}
{"pforileID"=>2, "name"=>"\u9234\u6728\u3000\u8302", "tell"=>"090-1122-3344", "age"=>37, "birthday"=>#<Date: 1987-08-12 ((2447020j,0s,0n),+0s,2299161j)>}
{"pforileID"=>4, "name"=>"\u4F50\u85E4\u3000\u6E05", "tell"=>"-7518", "age"=>19, "birthday"=>#<Date: 2005-08-01 ((2453584j,0s,0n),+0s,2299161j)>}
{"pforileID"=>6, "name"=>"\u5C71\u7530\u30BF\u30ED\u30A6", "tell"=>"080-1234-5678", "age"=>56, "birthday"=>#<Date: 1959-12-31 ((2436934j,0s,0n),+0s,2299161j)>}
{"pforileID"=>6, "name"=>"\u5C71\u7530\u30BF\u30ED\u30A6", "tell"=>"080-1234-5678", "age"=>56, "birthday"=>#<Date: 1959-12-31 ((2436934j,0s,0n),+0s,2299161j)>}
{"pforileID"=>7, "name"=>"garchomp", "tell"=>"000-1111-2222", "age"=>19, "birthday"=>#<Date: 2000-11-22 ((2451871j,0s,0n),+0s,2299161j)>}
{"pforileID"=>7, "name"=>"\u3042\u3042\u3042\u62D3\u6D77", "tell"=>"000-1111-2222", "age"=>19, "birthday"=>#<Date: 2000-11-22 ((2451871j,0s,0n),+0s,2299161j)>}

C:\Users\guest1Day\Desktop>ruby test3.rb
{"pforileID"=>1, "name"=>"\u7530\u4E2D\u3000\u5B9F", "tell"=>"012-345-6789", "age"=>30, "birthday"=>#<Date: 1994-02-01 ((2449385j,0s,0n),+0s,2299161j)>}
{"pforileID"=>2, "name"=>"\u9234\u6728\u3000\u8302", "tell"=>"090-1122-3344", "age"=>37, "birthday"=>#<Date: 1987-08-12 ((2447020j,0s,0n),+0s,2299161j)>}
{"pforileID"=>4, "name"=>"\u4F50\u85E4\u3000\u6E05", "tell"=>"-7518", "age"=>19, "birthday"=>#<Date: 2005-08-01 ((2453584j,0s,0n),+0s,2299161j)>}
{"pforileID"=>6, "name"=>"\u5C71\u7530\u30BF\u30ED\u30A6", "tell"=>"080-1234-5678", "age"=>56, "birthday"=>#<Date: 1959-12-31 ((2436934j,0s,0n),+0s,2299161j)>}
{"pforileID"=>6, "name"=>"\u5C71\u7530\u30BF\u30ED\u30A6", "tell"=>"080-1234-5678", "age"=>56, "birthday"=>#<Date: 1959-12-31 ((2436934j,0s,0n),+0s,2299161j)>}

C:\Users\guest1Day\Desktop>
=end
