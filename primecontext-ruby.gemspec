require File.expand_path('../lib/primecontext/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'primecontext-ruby'
  s.version       = Primecontext::VERSION
  s.summary       = 'Ruby gem for Primecontext CRM Api'
  s.authors       = ['Aleksey Korchagin']
  s.email         = 'lexx-kor@ya.ru'
  s.files         = Dir['{lib}/**/*.rb', 'LICENSE', 'Rakefile', '*.md']
  s.require_paths = ['lib']
  s.license       = 'MIT'
end
