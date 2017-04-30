def print_file(filename)
  if File.exists?(filename)
    File.open(filename, mode="r") do |file|
      file.readlines.each do |line|
        print line
      end
    end
  end
end



# Main

puts "This is a test"
filename = ARGV.first
print_file(filename)
