RSpec.describe Gasotoca do
  it 'has a version number' do
    expect(Gasotoca::VERSION).not_to be nil
  end

  it 'last_pdf_link is a link' do
    expect(Gasotoca.last_pdf_link).to match(/http/)
  end

  it 'prices have bandeiras' do
    expect(Gasotoca.prices).to match(/IPIRANGA/)
  end
end
