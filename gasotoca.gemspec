require_relative 'lib/gasotoca/version'

Gem::Specification.new do |spec|
  spec.name          = 'gasotoca'
  spec.version       = Gasotoca::VERSION
  spec.authors       = ['Luiz Carvalho']
  spec.email         = ['contato@luizcarvalho.com']

  spec.summary       = 'Extrai informações de  valores  de combustíveis de Palmas'
  spec.description   = 'Analisa do PDF com preços de combustíveis e disponibiliza em JSON'
  spec.homepage      = 'https://luizcarvalho.com'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/luizcarvalho/gasotoca'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
