
require 'mysql2'


client = Mysql2::Client.new(:host => 'localhost', :username => 'garchomp', :password => 'matutani9613', :database => 'garchomp_db')

# puts("DB connected!")
# puts('plase profilesID,name,tell,age,birthday')
# x=gets.chomp.split(',')
client.query(%q{update profiles set name='松岡修造',age=48,birthday='1967-11-06' where pforileID=1;})
# statement.execute(x[0],x[1].to_s,x[2].to_s,x[3],x[4].to_s)

client.query(%q{select * from profiles; }).each do|i|
  puts i
end


=begin

=end
