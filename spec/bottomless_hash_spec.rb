require 'spec_helper'

describe BottomlessHash do
  it 'has a version number' do
    expect(BottomlessHash::VERSION).not_to be nil
  end

  it 'does not raise on missing key' do
    expect do
      subject[:missing][:key]
    end.to_not raise_error
  end

  it 'returns an empty value on missing key' do
    expect(subject[:missing][:key]).to be_empty
  end

  it 'stores and returns keys' do
    subject[:existing][:key] = :value
    expect(subject[:existing][:key]).to eq :value
  end

  describe '#from_hash' do
    let (:hash) do
      { existing: { key: { value: :hello } } }
    end

    subject do
      described_class.from_hash(hash)
    end

    it 'returns old hash values' do
      expect(subject[:existing][:key][:value]).to eq :hello
    end

    it 'provides a bottomless version' do
      expect(subject[:missing][:key]).to be_empty
    end

    it 'stores and returns new values' do
      subject[:existing][:key] = :value
      expect(subject[:existing][:key]).to eq :value
    end

    it 'converts nested hashes as well' do
      expect do
        subject[:existing][:key][:missing]
      end.to_not raise_error
    end
  end
end
