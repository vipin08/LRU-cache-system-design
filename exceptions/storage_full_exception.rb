class StorageFullException < RuntimeError
  def initialize(msg= "Got Storage Full")
    super(msg)
  end
end
