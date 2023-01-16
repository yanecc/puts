def print_usage
  puts "Usage: puts --path [file_path] | -p [file_path] --show | -s | [file_path]"
end

def read_file(file_path : String, show_path : Bool)
  begin
    File.open(file_path, "r") do |file|
      if show_path
        puts "File path: #{File.expand_path(file_path)}"
      end
      file.each_line { |line| puts line }
    end
  rescue
    puts "Error: Could not read file at #{file_path}"
  end
end

if ARGV.size < 1
  print_usage
  exit
end

file_path = ""
show_path = false

ARGV.each_with_index do |arg, index|
  if arg == "--path" || arg == "-p"
    file_path = ARGV[index + 1]
  elsif arg == "--show" || arg == "-s"
    show_path = true
  end
end

if file_path != ""
  read_file(file_path, show_path)
else
  if File.file?(ARGV[0])
    read_file(ARGV[0], show_path)
  else
    print_usage
  end
end
