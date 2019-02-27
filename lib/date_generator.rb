module DateGenerator

  def date_generator
    date = Date.today
    @string = date.strftime("%m%d%y")
  end

  def offset_helper(date)
    organize = []
    offset_key = date.to_i * date.to_i
    organize << offset_key.to_s.split(//)
    organize.flatten
  end

  def offsets_to_string(date)
      values = offset_helper(date)
      offset_keys = {}
      offset_keys["A"] = values[-4]
      offset_keys["B"] = values[-3]
      offset_keys["C"] = values[-2]
      offset_keys["D"] = values[-1]
      offset_keys
  end

  def offsets(date)
    integer_value = {}
    string_value = offsets_to_string(date)
    string_value.each do |key, value|
      integer_value[key] = value.to_i
    end
    integer_value
  end
end
