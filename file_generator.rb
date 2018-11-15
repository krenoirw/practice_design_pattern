filepath = "test.txt"
contents = <<EOS
# contents...
# test.txt
EOS

File.open(filepath, "w") do |f|
  f.write(contents)
end
