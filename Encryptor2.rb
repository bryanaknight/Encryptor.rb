class Encryptor
  def cipher(rotation)
  characters = (' '..'z').to_a
  rotated_characters = characters.rotate(rotation)
  Hash[characters.zip(rotated_characters)]
  end
  def encrypt_letter(letter,rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]
  end
  def encrypt(string,rotation)
    letters = string.split("") #split input into single letters
    results = letters.collect do |letter| #go through each letter, .collect gathers results and gives you back in array
      encrypted_letter = encrypt_letter(letter,rotation) #call encrypt_letter method on each letter and name that encrypted_letter
      end
      results.join #joins encrypted letters
  end

  def decipher(rotation)
    rotation = rotation * -1
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end
  def decrypt_letter(letter,rotation)
    decipher_for_rotation = decipher(rotation)
    decipher_for_rotation[letter]
  end
  def decrypt(string,rotation)
    letters = string.split("") #split input into single letters
    results = letters.collect do |letter| #go through each letter, .collect gathers results and gives you back in array
      decrypted_letter = decrypt_letter(letter,rotation) #call encrypt_letter method on each letter and name that encrypted_letter
      end
      results.join #joins encrypted letters
  end 
  def encrypt_file (filename,rotation)
    input = File.open(filename, "r")
    file_to_encrypt = input.read
    encrypted_text = encrypt(file_to_encrypt, rotation)
    encrypted_file = filename +".encrypted"
    output = File.new(encrypted_file, "w")
    output.write(encrypted_text)
    output.close
  end
  def decrypt_file (filename,rotation)
    input = File.open(filename, "r")
    file_to_decrypt = input.read
    decrypted_text = decrypt(file_to_decrypt, rotation)
    decrypted_file = filename.gsub("encrypted", "decrypted")
    output = File.new(decrypted_file, "w")
    output.write(decrypted_text)
    output.close
  end
  def supported_characters
    (' '..'z').to_a
  end 
  def crack(message)
    supported_characters.count.times.collect do |attempt|
      decrypt(message,attempt) #this many times attempt to decrypt the message
    end
  end

end 
