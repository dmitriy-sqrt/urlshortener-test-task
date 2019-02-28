class CreateUrl < ::BaseService
  def initialize(attributes:)
    @attributes = attributes
  end

  def call
    generate_uuid
    generate_secret

    if save_url
      return Result.new(success: true, object: @url)
    else
      return Result.new(success: false, object: @url, errors: @url.errors)
    end
  end

  private

  def save_url
    @url = Url.new(
      {
        uuid:   @uuid,
        secret: @secret
      }.merge(@attributes)
    )
    @url.save
  end

  def generate_uuid
    @uuid = UuidGenerator.new.uuid_for_url
  end

  def generate_secret
    @secret = Digest::MD5.hexdigest(@uuid)
  end
end
