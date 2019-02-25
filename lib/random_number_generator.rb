module RandomNumberGenerator

  def random_number_generator
    random_num = rand(100..99999)
    string = random_num.to_s.rjust(5, "0")
    string
  end

  def key_helper(string)
    letter_keys = Hash.new(0)
    letter_keys["A"] = string[0..1]
    letter_keys["B"] = string[1..2]
    letter_keys["C"] = string[2..3]
    letter_keys["D"] = string[3..4]
    letter_keys
  end

  def keys(string)
    integer_keys = {}
    key_strings = key_helper(string)
    key_strings.each do |key, value|
      integer_keys[key] = value.to_i
    end
    integer_keys
  end
end
