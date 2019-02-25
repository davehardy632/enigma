module DateGenerator

    def date_generator
      date = Date.today
      string = date.strftime("%m%d%y")
    end

    def offset_helper(date) #manual
      organize = []
      offset_key = date.to_i * date.to_i
      organize << offset_key.to_s.split(//)
      organize.flatten
    end

    def offsets(date) # final offset values in a hash
        values = offset_helper(date)
        offset_keys = {}
        offset_to_int = {}
        offset_keys["A"] = values[-4]
        offset_keys["B"] = values[-3]
        offset_keys["C"] = values[-2]
        offset_keys["D"] = values[-1]
        offset_keys.each do |key, value|
          offset_to_int[key] = value.to_i
      end
        offset_to_int #potential naming issue
    end

end
