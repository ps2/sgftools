DIR = File.dirname(__FILE__)
LIB = File.join(DIR, *%w[lib sgf_tools.rb])
VERSION = open(LIB) { |lib|
  lib.each { |line|
    if v = line[/^\s*VERSION\s*=\s*(['"])(\d\.\d\.\d)\1/, 2]
      break v
    end
  }
}

SPEC = Gem::Specification.new do |s|
  s.name = "sgfparser"
  s.version = VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Pete Schwamb"]
  s.email = ["pete@schwamb.net"]
  s.homepage = "http://github.com/ps2/sgfparser"
  s.summary = "A ruby library for working with SGF files"
  s.description = <<-END_DESCRIPTION.gsub(/\s+/, " ").strip
  This library reads sgf files, described at http://www.red-bean.com/sgf/
  END_DESCRIPTION

  s.required_rubygems_version = "~> 1.9.2"
  s.required_rubygems_version = "~> 1.3.6"

  s.add_development_dependency "rspec"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- spec/*_spec.rb`.split("\n")
  s.require_paths = %w[lib]
end
