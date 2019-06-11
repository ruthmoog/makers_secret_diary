require 'lock'

RSpec.describe Lock do

  context 'when locked' do

    subject(:lock) { described_class.new() }

    it 'tells you its locked' do
      expect(lock.locked?).to be true
    end

    it 'is unlocked when user calls `unlock`' do
      expect(lock.unlock).to eq(:open)
    end

  end

  context 'when unlocked' do

    subject(:lock) { described_class.new(:open) }

    it 'tells you its unlocked' do
      expect(lock.locked?).to be false
    end

    it 'is locked when the user calls `lock`' do
      expect(lock.lock).to eq(:closed)
    end

  end

end