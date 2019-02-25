module RandomNumberGenerator
  def random_number_generator
    random_num = rand(1000..9999)
    string = random_num.to_s
      if string.length == 4
      return "0" + string
    else
      return string
    end
  end

  def key_helper(string) #manual entry
    letter_keys = Hash.new(0)
    string
    letter_keys["A"] = string[0..1]
    letter_keys["B"] = string[1..2]
    letter_keys["C"] = string[2..3]
    letter_keys["D"] = string[3..4]
    letter_keys
  end

  def keys(string) #manual entry
    keys = {}
    key_strings = key_helper(string)
    key_strings.each do |key, value|
      keys[key] = value.to_i
    end
    keys
  end
end
