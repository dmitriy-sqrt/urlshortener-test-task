class GenerateUuid
  def self.uuid
    SecureRandom.hex(4)
  end

  def self.uuid_for_link
    loop do
      uuid = self.uuid
      return uuid unless Link.find_by(uuid: uuid)
    end
  end
end
