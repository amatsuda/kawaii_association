require_relative 'lib/kawaii_association/version'

Gem::Specification.new do |spec|
  spec.name          = "kawaii_association"
  spec.version       = KawaiiAssociation::VERSION
  spec.authors       = ["Akira Matsuda"]
  spec.email         = ["ronnie@dio.jp"]

  spec.summary       = 'AR::Model.has_many { associations through: &block }'
  spec.description   = 'An Active Record DSL extension that allows you to declare multiple associaitons with a block'
  spec.homepage      = 'https://github.com/amatsuda/kawaii_association'
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'railties'
  spec.add_dependency 'activerecord'
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'test-unit-rails'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'byebug'
end
