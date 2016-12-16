class Room

  attr_reader :sector_id
  attr_reader :checksum
  attr_reader :name

  def initialize input
    sections = /([-a-z]+)-(\d{3})\[([a-z]{5})\]/.match(input)

    @name = sections[1]
    @sector_id = sections[2]
    @checksum = sections[3]
  end

  def calcul_checksum
    name = @name.split("")
    name.delete("-")
    name
      .group_by {|letter| letter}
      .map { |element| [element[0], element[1].size] }
      .group_by{ |letter, occurences| occurences }
      .sort.reverse
      .map { |element| element[1].map { |e| e[0] }.sort_by { |e| e[0] } }
      .flatten
      .join("")[0,5]
  end

  def decoy?
    calcul_checksum == @checksum
  end

  def decipher
    alphabet = ("a".."z").to_a
    non_caps  = Hash[alphabet.zip(alphabet.rotate(@sector_id.to_i))]

    @name.chars.map { |char| non_caps.fetch(char, " ") }.join()
  end

end
