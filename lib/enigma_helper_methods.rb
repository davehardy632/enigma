require 'date'

module EnigmaHelperMethods

  def total_rotation(key, date)
    final_rotation = {}
    keys = keys(key)
    offsets = offsets(date)
    keys.merge(offsets) do |key, key_value, offset_value|
      final_rotation[key] = key_value + offset_value
    end
    final_rotation
  end

  def encrypt_letter(letter, number)
    new_letter = letter.tr(@alphabet.join, @alphabet.rotate(number).join)
  end

  def decrypt_letter(letter, number)
  letter = letter.tr(@alphabet.rotate(number).join ,@alphabet.join)
  end

  def encrypt_message(message, key, date)
    split_message = message.downcase.split(//)
    encrypted_message = []
    total_rotation = total_rotation(key, date)
    split_message.each_with_index do |letter, index|
        if index % 4 == 0
      encrypted_message << encrypt_letter(letter, total_rotation["A"])
    elsif index % 4 == 1
      encrypted_message << encrypt_letter(letter, total_rotation["B"])
    elsif index % 4 == 2
      encrypted_message << encrypt_letter(letter, total_rotation["C"])
    elsif index % 4 == 3
      encrypted_message << encrypt_letter(letter, total_rotation["D"])
      end
    end
    encrypted_message.join
  end

  def decrypt_message(message, key, date)
    split_message = message.downcase.split(//)
    new = []
    total_rotation = total_rotation(key, date)
    split_message.each_with_index do |letter, index|
        if index % 4 == 0
      new << decrypt_letter(letter, total_rotation["A"])
    elsif index % 4 == 1
      new << decrypt_letter(letter, total_rotation["B"])
    elsif index % 4 == 2
      new << decrypt_letter(letter, total_rotation["C"])
    elsif index % 4 == 3
      new << decrypt_letter(letter, total_rotation["D"])
      end
    end
    new.join
  end

end
