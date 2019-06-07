require "secret_diary"

describe SecretDiary do

ENTRY = "Dear diary..."

  context 'is locked' do
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

  context 'is unlocked' do
    let(:unlock) { subject.unlock }

    it 'is locked when the user calls `lock`' do
      unlock

      expect(subject.lock).to eq(:closed)
    end

    it 'returns entries if user adds entry' do
      unlock

      expect{subject.add_entry(ENTRY)}.to change{subject.entries.count}.from(0).to(1)
    end

    it 'returns entries if user gets entry' do
      unlock
      subject.add_entry(ENTRY)

      expect(subject.get_entries).to eq([ENTRY])
    end
  end

end