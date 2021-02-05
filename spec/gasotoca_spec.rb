RSpec.describe Gasotoca do
  it 'has a version number' do
    expect(Gasotoca::VERSION).not_to be nil
  end

  it 'new' do
    gastoca = Gasotoca.new
    expect(gastoca).to eq('prices')
  end
end
