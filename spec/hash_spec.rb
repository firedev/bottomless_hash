require_relative '../lib/bottomless_hash'

describe Hash do
  subject do
    {
      existing: {
        key: :hello
      }
    }.bottomless
  end
  it 'is a BottomlessHash now' do
    expect(subject).to be_a BottomlessHash
  end

  it 'returns values for existing keys' do
    expect(subject[:existing][:key]).to eq :hello
  end

  it 'bottomlessly stores values' do
    subject[:new][:value] = :omg
    expect(subject[:new][:value]).to eq :omg
  end

  it 'does not raise error on missing keys' do
    expect do
      subject[:missing][:key]
    end.to_not raise_error
  end
end
