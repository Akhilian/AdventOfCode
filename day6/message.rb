class Message

  attr_reader :payload

  def initialize message
    @payload = message
  end

  def organise_message
    @payload
      .map { |e| e.split("") }
      .transpose
  end

  def decrypt
    organise_message
      .map { |e| e.group_by { |el| el }.values.max_by(&:size).first }
      .join
  end

  def decrypt_modified
    p organise_message
      .map { |e| e.group_by { |el| el } }
      .map { |e| e.map {|key, value| [key, value.size] } }
      .map { |e| e.sort_by { |e| e[1] }.first[0] }
      .join
  end
end
