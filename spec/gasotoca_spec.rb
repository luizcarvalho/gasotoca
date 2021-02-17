RSpec.describe Gasotoca do
  it 'has a version number' do
    expect(Gasotoca::VERSION).not_to be nil
  end

  it 'find by fuel' do
    expect(Gasotoca.find(:gasoline)).to be_kind_of(Array)
  end

  it 'find by fuel and flag' do
    expect(Gasotoca.find(:gasoline, flag: 'BR')).to be_kind_of(Array)
  end

  it 'find by fuel and flag and region' do
    ranking = Gasotoca.find(:gasoline, flag: 'BR', region: 'Região Sul')
    expect(ranking).to be_kind_of(Array)
  end
end
