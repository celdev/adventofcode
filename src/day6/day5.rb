require 'Set'
class Bank
  attr_reader :bank_number, :blocks
  def initialize(bank_number, blocks)
    @bank_number = bank_number.to_i
    @blocks = blocks.to_i
  end

  def reset_and_get_blocks
    tmp = @blocks
    @blocks = 0
    tmp
  end

  def add_block
    @blocks += 1
  end

  def inspect
    "Bank#=#{@bank_number}, blocks=#{@blocks}"
  end
end

def get_index_of_fullest(memory_banks)
  max_blocks = 0
  max_index = 0
  print_memory memory_banks
  memory_banks.each_with_index do |bank, index|
    if bank.blocks > max_blocks
      max_index = index
      max_blocks = bank.blocks
    end
  end
  puts "reallocating memory bank #{max_index}"
  max_index
end

def get_config(memory_banks)
  memory_banks.inspect
end

def reallocate(memory_banks)
  index_to_reallocate = get_index_of_fullest memory_banks
  bank = memory_banks[index_to_reallocate]
  blocks_to_reallocate = bank.reset_and_get_blocks
  index_to_reallocate += 1
  index_to_reallocate = 0 if index_to_reallocate >= memory_banks.count
  while blocks_to_reallocate > 0
    memory_banks[index_to_reallocate].add_block
    index_to_reallocate += 1
    index_to_reallocate = 0 if index_to_reallocate >= memory_banks.count
    blocks_to_reallocate -= 1
  end
end


split = "4 10 4 1 8 4 9 14 5 1 14 15 0 15 3	5".split" "
#split = "0 2 7 0".split" "
memory_banks = Array.new
config = Set.new

split.each_with_index do |blocks, index|
  memory_banks.push(Bank.new(index,blocks))
end

counter = 0

def print_memory(memory_banks)
  out = ""
  memory_banks.each do |bank|
    out += "#{bank.blocks} "
  end
  puts out
end

while true
  mem_conf = get_config memory_banks
  break if config.include? mem_conf
  counter += 1
  config.add mem_conf
  reallocate memory_banks
end

puts counter


