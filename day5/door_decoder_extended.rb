require 'digest'

class DoorDecoder

  def initialize
    @hash = Array.new(8, '_')
  end

  def find_hash door_id, length
    index = 0

    loop do
      break if (@hash.size - @hash.count("_")) == length
      md5 = Digest::MD5.hexdigest [door_id, index].join()
      update_hash md5

      index += 1
    end

    @hash.join("")
  end

  def update_hash md5
    index = md5[5].to_i(16)
    @hash[index] = md5[6] if md5.start_with?("00000") && index < @hash.size && @hash[index] == '_'
    @hash
  end

end
