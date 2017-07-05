require "./modori2.rb"
profile=Profiles.new

profile.set(12345,"garchomp","2000/01/01","treasure-town")
profile.output
puts
puts

testclass=Test.new
testclass.set("","garchomp","10/17","","hello")
testclass.outputs

