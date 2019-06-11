class SecretDiary

  def initialize(lock)
    @entries = []
    @lock = lock
  end

  def unlock
    @lock.unlock
  end

  def lock
    @lock.lock
  end

  def add_entry(entry)
    if !@lock.locked?
      @entries << entry
    else
      raise_locked
    end
  end

  def get_entries
    if !@lock.locked?
      @entries
    else
      raise_locked
    end
  end

  private

  def raise_locked
    raise "error! diary is locked"
  end

end
