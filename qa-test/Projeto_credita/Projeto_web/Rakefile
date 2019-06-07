require 'rubygems'
require 'rake'
require 'cucumber'
require 'cucumber/rake/task'
require 'pry'

$validacao = 'report_html' #default ou report_html ou report_json ou rerun_log
$validacao_report = $validacao #False quando não for Report e 'report_html' quando for report
$cucumber_registro = YAML.load_file('./features/config/cucumber.yml')[$validacao]

Cucumber::Rake::Task.new(:checkbox) do |property|
  if $validacao_report == 'report_html'
   property.cucumber_opts = "-t @checkbox #{$cucumber_registro}checkbox.html versao=/dynamic_controls BROWSER=chrome"
  else
   property.cucumber_opts = "-t @checkbox #{$cucumber_registro} versao=/dynamic_controls BROWSER=chrome"
  end
end

Cucumber::Rake::Task.new(:nova_aba) do |property|
  if $validacao_report == 'report_html'
   property.cucumber_opts = "-t @nova_aba #{$cucumber_registro}nova_aba.html versao=/windows BROWSER=chrome"
  else
   property.cucumber_opts = "-t @nova_aba #{$cucumber_registro} versao=/windows BROWSER=chrome"
  end
end

 task pipeline_jenkins: [:checkbox, :nova_aba]
