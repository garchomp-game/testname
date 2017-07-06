




loop do
x=Time.new	
a= x.sec
#p a
if a>= 00 && a<= 30
	puts "現在の時刻は、#{x}であることをお知らせします"
	sleep(30)
else
	redo
end

end