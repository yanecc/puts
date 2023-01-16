args = ARGV.dup
path = ""
showPath = false

def putsUsage
  puts "Usage: puts [--path | -p] file_path [--show | -s]"
end

if ARGV.size < 1
  putsUsage
  gets
  exit
elsif File.file?(args[0])
  path = args.shift
end

while args.size > 0
  arg = args.shift
  begin
    case arg
    when "--path", "-p"
      path = args.shift
    when "--show", "-s"
      showPath = true
    end
  rescue
    putsUsage
    exit
  end
end

if File.file?(path)
  if showPath
    puts "#{File.basename(path)} - #{File.expand_path(path)}"
  end
  begin
    puts File.read(path)
  rescue ex
    puts "Error: #{ex.message}"
  end
else
  putsUsage
  exit
end
