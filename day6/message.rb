class Message

  attr_reader :payload

  def initialize message
    @payload = message
  end

  def decrypt
    @payload
      .map { |e| e.split("") }
      .transpose
      .map { |e| e.group_by { |el| el }.values.max_by(&:size).first }
      .join
  end
end
