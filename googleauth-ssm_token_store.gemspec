Gem::Specification.new do |spec|
  spec.name          = "googleauth-ssm_token_store"
  spec.version       = '0.0.0'
  spec.authors       = ["Kasumi Hanazuki"]
  spec.email         = ["kasumi@rollingapple.net"]

  spec.summary       = %q{Google::Auth::Stores::SSMParameterStore}
  spec.description   = %q{Provides Google::Auth::Stores::SSMParameterStore}
  spec.homepage      = "https://github.com/hanazuki/googleauth-ssm_token_store"
  spec.license       = "MIT-0"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'aws-sdk-ssm'
  spec.add_runtime_dependency 'googleauth'
end
