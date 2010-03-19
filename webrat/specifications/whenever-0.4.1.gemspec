# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{whenever}
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Javan Makhmali"]
  s.date = %q{2009-11-30}
  s.description = %q{Clean ruby syntax for defining and deploying messy cron jobs.}
  s.email = %q{javan@javan.us}
  s.executables = ["whenever", "wheneverize"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = [".gitignore", "CHANGELOG.rdoc", "README.rdoc", "Rakefile", "bin/whenever", "bin/wheneverize", "lib/whenever.rb", "lib/whenever/base.rb", "lib/whenever/command_line.rb", "lib/whenever/job_list.rb", "lib/whenever/job_types/default.rb", "lib/whenever/job_types/rake_task.rb", "lib/whenever/job_types/runner.rb", "lib/whenever/outputs/cron.rb", "lib/whenever/outputs/cron/output_redirection.rb", "lib/whenever/version.rb", "test/command_line_test.rb", "test/cron_test.rb", "test/output_at_test.rb", "test/output_command_test.rb", "test/output_env_test.rb", "test/output_rake_test.rb", "test/output_redirection_test.rb", "test/output_runner_test.rb", "test/test_helper.rb", "whenever.gemspec"]
  s.homepage = %q{http://github.com/javan/whenever}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Clean ruby syntax for defining and deploying messy cron jobs.}
  s.test_files = ["test/command_line_test.rb", "test/cron_test.rb", "test/output_at_test.rb", "test/output_command_test.rb", "test/output_env_test.rb", "test/output_rake_test.rb", "test/output_redirection_test.rb", "test/output_runner_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chronic>, [">= 0.2.3"])
    else
      s.add_dependency(%q<chronic>, [">= 0.2.3"])
    end
  else
    s.add_dependency(%q<chronic>, [">= 0.2.3"])
  end
end
