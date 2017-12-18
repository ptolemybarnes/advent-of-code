# --- Day 2: Corruption Checksum ---
#   As you walk through the door, a glowing humanoid shape yells in your direction. "You there! Your state appears to be idle. Come help us repair the corruption in this spreadsheet - if we take another millisecond, we'll have to display an hourglass cursor!"
# 
# The spreadsheet consists of rows of apparently-random numbers. To make sure the recovery process is on the right track, they need you to calculate the spreadsheet's checksum. For each row, determine the difference between the largest value and the smallest value; the checksum is the sum of all of these differences.
# 
# For example, given the following spreadsheet:
# 
# 5 1 9 5
# 7 5 3
# 2 4 6 8
# The first row's largest and smallest values are 9 and 1, and their difference is 8.
# The second row's largest and smallest values are 7 and 3, and their difference is 4.
# The third row's difference is 6.
# In this example, the spreadsheet's checksum would be 8 + 4 + 6 = 18.
# 
# What is the checksum for the spreadsheet in your puzzle input?

describe 'checksum' do

  it 'sums the difference between the highest and lowest in each row' do
    input = [
      [ 5, 1, 9, 5 ],
      [ 7, 5, 3 ],
      [ 2, 4, 6, 8 ]
    ]

    expect(checksum(input)).to eq 8 + 4 + 6
  end

  it '' do
    input = [
      [ 5, 9, 2, 8 ],
      [ 9, 4, 7, 3 ],
      [ 3, 8, 6, 5 ]
    ]

    expect(checksum_two(input)).to eq 4 + 3 + 2
  end

  def checksum grid
    grid.sum {|row| row.max - row.min }
  end

  def checksum_two grid
    grid.sum do |row|
      thing = row.permutation(2).find {|first, second| first != second && (first % second).zero? }
      thing.first / thing.last
    end
  end
end
