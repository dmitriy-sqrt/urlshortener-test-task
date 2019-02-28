# TODO move to lib?

class UuidGenerator
  def uuid
    SecureRandom.hex(4)
  end

  def uuid_for_link
    loop do
      uuid = SecureRandom.hex(4)
      return uuid unless Link.find_by(uuid: uuid)
    end
  end
end
