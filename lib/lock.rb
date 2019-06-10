class Lock

  def initialize(lock = :locked)
    @lock = lock
  end

  def unlock
    @lock = :open
  end

  def lock
    @lock = :locked
  end

  def locked?
    @lock == :locked
  end

end