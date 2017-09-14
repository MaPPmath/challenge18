words = File.readlines('wordsearch/wordsearch.txt')

words.each_with_index do |row,i|
  output_row = ""
  row[0..-2].ljust(11).split("").each_with_index do |x,j|
    unless x==" "
      next_char = x
    else
      next_char = ('A'..'Z').to_a.shuffle[0]
    end
    output_row << "\\node at (#{j},#{11-i}) {#{next_char}};"
  end
  puts output_row
end
