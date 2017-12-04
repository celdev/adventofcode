arr = ARGV.first.split(//)
value = 0
arr.each_with_index do |num, i|
  f = num.to_i
  arr.count == i + 1 ? s = arr.first.to_i : s = arr[i + 1].to_i
  value += f if f == s
end
puts "Reverse captcha: #{value}"