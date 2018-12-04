inputs = File.readlines('./input').map{|l| l.strip.to_i}

current_frequency = 0
found_frequencies = [current_frequency]

inputs.cycle do |n|
  current_frequency += n
  if found_frequencies.include? current_frequency
    puts "#{current_frequency} is the first duplicate"
    break
  else
    found_frequencies << current_frequency
  end
end

