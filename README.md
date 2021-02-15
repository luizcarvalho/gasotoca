# Gasotoca

Projeto para buscar e transcrever preços das gasolinas praticadas em postos de Palmas.
O script busca informações dos PDFs disponibilizados pelo Procon-TO

## Installation

Adicione essa linha no Gemfile de seu projeto:

```ruby
gem 'gasotoca'
```

E execute isso:

    $ bundle install

Ou instale diretamente assim:

    $ gem install gasotoca

## Usage

Buscar preços por combustível

```ruby
Gasotoca.find(:gasolina)
```

Buscar preço por combustível e por bandeira

```ruby
Gasotoca.find(:gasolina, bandeira: 'BR')
```

Buscar preço por combustível, bandeira e região

```ruby
Gasotoca.find(:gasolina, bandeira: 'BR', regiao: 'Região Sul')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests são bem vindos no GitHub em https://github.com/luizcarvalho/gasotoca. Sua contribuição é  muito bem vinda, veja nosso [código de contuda (en)](https://github.com/luizcarvalho/gasotoca/blob/master/CODE_OF_CONDUCT.md).


## License

Essa gem é disponibilizada como código aberto, nos termos da [Licensa MIT](https://opensource.org/licenses/MIT).

