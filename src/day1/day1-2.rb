arr = ARGV.first.split(//)
value = 0
steps = arr.count / 2

def steps_new_index(index, size, steps)
  index + steps - size
end

arr.each_with_index do |num, i|
  f = num.to_i
  (arr.count <= i + steps) ? s = arr[steps_new_index(i, arr.count, steps)].to_i : s = arr[i + steps].to_i
  value += f if f == s
end
puts "Reverse captcha: #{value}"