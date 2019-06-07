require "secret_diary"

describe SecretDiary do

ENTRY = "Dear diary..."

  context 'when locked' do
    it 'will raise and error if you try to add an entry' do
      expect { subject.add_entry(ENTRY) }.to raise_error("error! diary is locked")
    end

    it 'raises error if you try to get entries' do
      expect { subject.get_entries }.to raise_error("error! diary is locked")
    end

    it 'is unlocked when user calls `unlock`' do
      expect(subject.unlock).to eq(:open)
    end
  end

  context 'when unlocked' do
    let(:unlock) { subject.unlock }

    it 'is re-locked when the user calls `lock`' do
      unlock

      expect(subject.lock).to eq(:closed)
    end

    it 'can save entries and retrieve entries' do
      unlock
      subject.add_entry(ENTRY)

      expect(subject.get_entries).to eq([ENTRY])
    end
  end

end