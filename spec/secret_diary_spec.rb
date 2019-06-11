require "secret_diary"

describe SecretDiary do

ENTRY = "Dear diary..."

subject(:diary) { described_class.new(Lock.new) }

  context 'when locked' do
    it 'will raise and error if you try to add an entry' do
      expect { diary.add_entry(ENTRY) }.to raise_error("error! diary is locked")
    end

    it 'raises error if you try to get entries' do
      expect { diary.get_entries }.to raise_error("error! diary is locked")
    end

    it 'is unlocked when user calls `unlock`' do
      expect(diary.unlock).to eq(:open)
    end
  end

  context 'when unlocked' do
    let(:unlock) { diary.unlock }

    it 'is re-locked when the user calls `lock`' do
      unlock

      expect(diary.lock).to eq(:closed)
    end

    it 'can save entries and retrieve entries' do
      unlock
      diary.add_entry(ENTRY)

      expect(diary.get_entries).to eq([ENTRY])
    end
  end

end