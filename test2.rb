#! ruby -EWindows-31J
# -*- mode:ruby; coding:Windows-31J -*-
require 'mysql2'


client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')

# puts("DB connected!")
# puts('plase profilesID,name,tell,age,birthday')
# x=gets.chomp.split(',')
# statement = client.prepare(%q{insert into profiles(pforileID,name,tell,age,birthday) VALUES(?,?,?,?,?)})
# statement.execute(x[0],x[1].to_s,x[2].to_s,x[3],x[4].to_s)

client.query(%q{select * from profiles where pforileID=1; }).each do|i|
  puts i
end
