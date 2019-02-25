require 'date'
module EnigmaHelperMethods



  def total_rotation(key, date) #default used in final encrypt method
    final_rotation = {}
    keys = keys(key)
    offsets = offsets(date)
    keys.merge(offsets) do |key, key_value, offset_value|
      final_rotation[key] = key_value + offset_value
    end
    final_rotation
  end

  def encrypt_letter(letter, number) # not needed in final method #default
    new_letter = letter.tr(@alphabet.join, @alphabet.rotate(number).join)
    new_letter
  end

  def decrypt_letter(letter, number) # not needed in final method #default
  letter = letter.tr(@alphabet.rotate(number).join ,@alphabet.join)
  end

  def encrypt_message(message, key, date)
    split_message = message.downcase.split(//)
    new = []
    total_rotation = total_rotation(key, date)
    split_message.each_with_index do |letter, index|
        if index == 0 || index % 4 == 0
      new << encrypt_letter(letter, total_rotation["A"])
    elsif index == 1 || index % 4 == 1
      new << encrypt_letter(letter, total_rotation["B"])
    elsif index == 2 || index % 4 == 2
      new << encrypt_letter(letter, total_rotation["C"])
    elsif index == 3 || index % 4 == 3
      new << encrypt_letter(letter, total_rotation["D"])
      end
    end
    new.join
  end

  def decrypt_message(message, key, date)
    split_message = message.downcase.split(//)
    new = []
    total_rotation = total_rotation(key, date)
    split_message.each_with_index do |letter, index|
        if index == 0 || index % 4 == 0
      new << decrypt_letter(letter, total_rotation["A"])
    elsif index == 1 || index % 4 == 1
      new << decrypt_letter(letter, total_rotation["B"])
    elsif index == 2 || index % 4 == 2
      new << decrypt_letter(letter, total_rotation["C"])
    elsif index == 3 || index % 4 == 3
      new << decrypt_letter(letter, total_rotation["D"])
      end
    end
    new.join
  end

end
