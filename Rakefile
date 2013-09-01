require "bundler/gem_tasks"
load 'tasks/install_asset.rake'

task :default => [:spec]
begin
	require 'rspec/core/rake_task'
	RSpec::Core::RakeTask.new(:spec) do |spec|
		spec.pattern = 'spec/**/*_spec.rb'
	end
rescue LoadError => e
end
