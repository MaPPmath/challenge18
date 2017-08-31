require 'csv'

data = CSV.read('treedata.csv')

output = ""

40.times do |row_index|
  output << "\n"
  16.times do |col_index|
    raw_content = data[row_index][col_index]
    case raw_content
    when '!'
      content = '\firstIcon'
    when '@'
      content = '\secondIcon'
    when '#'
      content = '\thirdIcon'
    when '$'
      content = '\fourthIcon'
    when '%'
      content = '\fifthIcon'
    when '1'
      content = '\firstLetter'
    when '2'
      content = '\secondLetter'
    when '3'
      content = '\thirdLetter'
    when '4'
      content = '\fourthLetter'
    when '5'
      content = '\fifthLetter'
    when '6'
      content = '\sixthLetter'
    when '7'
      content = '\seventhLetter'
    when '8'
      content = '\eighthLetter'
    when '9'
      content = '\ninthLetter'
    when '10'
      content = '\tenthLetter'
    when '~'
      content = ''
    else
      content = raw_content
    end
    rotation = (row_index+col_index)%4*90
    output << "\\node at (#{col_index}.5,#{39-row_index}.5) {\\rotatebox{#{rotation}}{#{content}}};\n"
  end
end

File.write('treedata.tex', output)
