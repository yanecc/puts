def putsUsage
  puts "Usage: puts --path [filePath] | -p [filePath] --show | -s | [filePath]"
end

def putsFile(filePath : String, showPath : Bool)
  File.open(filePath, "r") do |file|
    if showPath
      puts "File path: #{File.expand_path(filePath)}"
    end
    file.each_line { |line| puts line }
  end
rescue
  puts "Error: Could not read file at #{filePath}"
end

if ARGV.size < 1
  putsUsage
  exit
end

filePath = ""
showPath = false

ARGV.each_with_index do |arg, index|
  if arg == "--path" || arg == "-p"
    filePath = ARGV[index + 1]
  elsif arg == "--show" || arg == "-s"
    showPath = true
  end
end

if filePath != ""
  putsFile(filePath, showPath)
else
  if File.file?(ARGV[0])
    putsFile(ARGV[0], showPath)
  else
    putsUsage
  end
end
