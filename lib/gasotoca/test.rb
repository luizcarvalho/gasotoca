def meu_metodo(valor)
  valor if valor.even?
end

variavel = nil

[2, 3, 4, 5, 6].each do |valor|
  tmp = meu_metodo(valor)
  variavel = tmp unless tmp.nil?
  puts variavel
end
