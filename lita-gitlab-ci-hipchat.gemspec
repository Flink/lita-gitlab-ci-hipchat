Gem::Specification.new do |spec|
  spec.name          = "lita-gitlab-ci-hipchat"
  spec.version       = "1.1.0"
  spec.authors       = ["Loïc Guitaut"]
  spec.email         = ["flink@belfalas.eu"]
  spec.description   = %q{Receive and display nicely web hooks from GitLab CI in HipChat.}
  spec.summary       = %q{A Lita handler to receive GitLab CI web hooks}
  spec.homepage      = "https://github.com/Flink/lita-gitlab-ci-hipchat"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", "~> 4.0"
  spec.add_runtime_dependency "hipchat", "~> 1.3.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "fabrication"
end
