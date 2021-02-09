require_relative '../parser'

parser = Gasotoca::Parser.new('https://central3.to.gov.br/arquivo/551691/')
parser.extract_prices

csv_file = "REGIAO;NOME;BANDEIRA;ENDERECO;GASOLINA;GASOLINA_A;ETANOL;DIESEL;DIESEL_S10\n"

parser.prices.each_pair do |regiao, datas|
  datas.each do |data|
    csv_file << "#{regiao};#{data.values.join(';')}\n"
  end
end

puts csv_file
