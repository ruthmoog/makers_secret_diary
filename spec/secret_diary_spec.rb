require "secret_diary"

describe SecretDiary do

ENTRY = "Dear diary..."

let(:lock) { double :lock }
subject(:diary) { described_class.new(lock) }

  context 'when locked' do

    before(:each) do
      allow(lock).to receive(:locked?).and_return(true)
    end

    it 'will raise and error if you try to add an entry' do
      expect { diary.add_entry(ENTRY) }.to raise_error("error! diary is locked")
    end

    it 'raises error if you try to get entries' do
      expect { diary.get_entries }.to raise_error("error! diary is locked")
    end

    it 'is unlocked when user calls `unlock`' do
      allow(lock).to receive(:unlock)

      diary.unlock

      expect(lock).to have_received(:unlock)
    end
  end

  context 'when unlocked' do

    before(:each) do
      allow(lock).to receive(:locked?).and_return(false)
    end

    it 'is re-locked when the user calls `lock`' do
      allow(lock).to receive(:lock)

      diary.lock

      expect(lock).to have_received(:lock)
    end

    it 'can save entries and retrieve entries' do
      diary.add_entry(ENTRY)

      expect(diary.get_entries).to eq([ENTRY])
    end
  end

end