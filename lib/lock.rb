class Lock

  def initialize(lock = :closed)
    @lock = lock
  end

  def unlock
    @lock = :open
  end

  def lock
    @lock = :closed
  end

  def locked?
    @lock == :closed
  end

end