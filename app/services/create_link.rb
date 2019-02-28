class CreateLink < ::BaseService
  def initialize(attributes:)
    @attributes = attributes
  end

  def call
    generate_uuid
    generate_secret

    if save_link
      return Result.new(success: true, object: @link)
    else
      return Result.new(success: false, object: @link, errors: @link.errors)
    end
  end

  private

  def save_link
    @link = Link.new(
      {
        uuid:   @uuid,
        secret: @secret
      }.merge(@attributes)
    )
    @link.save
  end

  def generate_uuid
    @uuid = GenerateUuid.uuid_for_link
  end

  def generate_secret
    @secret = Digest::MD5.hexdigest(@uuid)
  end
end
