require 'digest'

class DoorDecoder

  def find_hash door_id, length
    hash = []
    index = 0

    #Digest::MD5.hexdigest 'abc3231929'

    loop do
      break if hash.size == length
      md5 = Digest::MD5.hexdigest [door_id, index].join()
      if md5.start_with?("00000")
        hash.push(md5[5])
      end

      index += 1
    end

    # length.times do
    #   md5 = ""
    #   loop do
    #     md5 = Digest::MD5.hexdigest [door_id, index].join()
    #
    #     if md5.start_with?("00000")
    #       p [door_id, index].join()
    #     end
    #
    #     break if md5.start_with?("00000")
    #
    #     index += 1
    #
    #   end
    #   hash.push(md5[5])
    # end



    hash.join("")
  end

end
