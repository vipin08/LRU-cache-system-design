class NotFoundException < RuntimeError
  def initialize(msg = "Key Not found")
    super(msg)
  end
end