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
end
