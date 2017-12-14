require 'pry'
# The captcha requires you to review a sequence of digits (your puzzle input) and
# find the sum of all digits that match the next digit in the list. The list is circular,
# so the digit after the last digit is the first digit in the list.
# 
# For example:
# 
# 1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
# 1111 produces 4 because each digit (all 1) matches the next.
# 1234 produces 0 because no digit matches the next.
# 91212129 produces 9 because the only digit that matches the next one is the last digit, 9.
# What is the solution to your captcha?

describe 'captcha' do
  NUMBERS_TO_EXPECTATIONS = [
    [ 1122,     3 ],
    [ 1111,     4 ],
    [ 1234,     0 ],
    [ 91212129, 9 ]
  ]

  it 'finds the sum of all digits that match the next digit in the list' do
    NUMBERS_TO_EXPECTATIONS.each do |number, expectation|
      expect("#{number} => #{captcha(number)}").to eq "#{number} => #{expectation}"
    end
  end

  def captcha number
    number = number.to_s.chars
    number.push number.first
    number.each_cons(2)
      .select {|first, second| first === second }
      .sum {|first, _| first.to_i }
  end
end
