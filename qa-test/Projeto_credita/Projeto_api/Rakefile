require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'


desc "Criar pasta para report"
task :new_pasta_report do
  $directory_name = "report"
  Dir.mkdir($directory_name) unless File.exists?($directory_name)
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "-t @criar_post -f html -o report/teste_report.html"
end


task :default => [:new_pasta_report, :features]
                 