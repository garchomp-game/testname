require 'logger'
require 'fileutils'
if File.exist?("memo.log")
	FileUtils.touch("memo.log")
end
log=Logger.new('memo.log')	

File.open("memo.log","w") do

end

log.debug(Time.new.strftime('開始　　%Y年 %m月 %d日 %H時 %M分 %S秒'))



def fibo(n)
	total=1
	a,b=0,1
	for i in 1..n do
		total
		total=a+b
		a,b=b,a+b
	end
	puts total
end
fibo(300000)
log.debug(Time.new.strftime('終了　　%Y年 %m月 %d日 %H時 %M分 %S秒'))

x=File.read('memo.log')
puts x
	