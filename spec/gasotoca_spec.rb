RSpec.describe Gasotoca do
  it 'has a version number' do
    expect(Gasotoca::VERSION).not_to be nil
  end

  it 'find by fuel' do
    expect(Gasotoca.find(:gasolina)).to be_kind_of(Array)
  end

  it 'find by fuel and bandeira' do
    expect(Gasotoca.find(:gasolina, bandeira: 'BR')).to be_kind_of(Array)
  end

  it 'find by fuel and bandeira and região' do
    expect(Gasotoca.find(:gasolina, bandeira: 'BR', regiao: 'Região Sul')).to be_kind_of(Array)
  end
end
