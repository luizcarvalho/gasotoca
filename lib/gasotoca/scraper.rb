require 'open-uri'
require 'date'

BASE_URL = 'https://procon.to.gov.br/servicos/pesquisa-de-precos/-pesquisas-de-precos'.freeze
YEAR = Time.new.year
PATH = 'combustivel-palmas-/'.freeze
FULL_URL = "#{BASE_URL}-#{YEAR}/#{PATH}".freeze
LINKS_REGEX = %r{<li><a href="(https://central3\.to\.gov\.br/arquivo/\d*)/">(.*)</a>}.freeze
MONTHS = %w[Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro].freeze

page = URI.parse(FULL_URL).read

links = page.scan(LINKS_REGEX)

data_links = []

def readable_date(name)
  name[/Palmas_Pesquisa de Combustível (.*)\.pdf/, 1]
end

def convert_month_name(month_name)
  MONTHS.index(month_name) + 1
end

def extract_day(string)
  string[/\d{2}/, 0]
end

def convert_date(date_name)
  day = extract_day(date_name)
  date_name.gsub!("#{day} de ", '')
  month = convert_month_name(date_name)

  Date.new(YEAR, month, day.to_i)
end


  data_links = links.map do |link|
    {
      link: link[0],
      file_name: link[1],
      human_date: readable_date(link[1]),
      date: convert_date(readable_date(link[1]))
    }
  end
