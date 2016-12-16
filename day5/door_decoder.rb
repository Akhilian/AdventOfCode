require 'digest'

class DoorDecoder

  def find_hash door_id, length
    hash = []
    index = 0

    loop do
      break if hash.size == length
      md5 = Digest::MD5.hexdigest [door_id, index].join()
      if md5.start_with?("00000")
        hash.push(md5[5])
      end

      index += 1
    end

    hash.join("")
  end

end
