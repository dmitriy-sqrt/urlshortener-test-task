# TODO move to lib?

class UuidGenerator
  def uuid
    SecureRandom.hex(4)
  end

  def uuid_for_url
    loop do
      uuid = SecureRandom.hex(4)
      return uuid unless Url.find_by(uuid: uuid)
    end
  end
end
