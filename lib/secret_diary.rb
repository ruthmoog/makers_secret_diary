class SecretDiary

  def initialize
    @lock = :closed
    @entries = []
  end

  def unlock
    @lock = :open
  end

  def lock
    @lock = :closed
  end

  def add_entry(entry)
    if @lock == :open
      @entries << entry
    end

    if @lock == :closed
      raise_locked
    end
  end

  def get_entries
    if @lock == :open
      return @entries
    else
      raise_locked
    end
  end

  private

  def raise_locked
    raise "error! diary is locked"
  end

end
