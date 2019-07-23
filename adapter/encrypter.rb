class Encrypter
  def initialize(key)
    @key = key
  end

  def encrypt(reader, writer)
    key_index = 0

    while not reader.eof?
      clear_char = reader.getc.ord
      encrypted_char = clear_char ^ @key[key_index].ord
      writer.putc(encrypted_char)
      key_index = (key_index + 1) % @key.size
    end

    writer.close
  end
end
