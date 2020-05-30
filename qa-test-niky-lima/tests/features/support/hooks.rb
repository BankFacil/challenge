# ---
require_relative 'helper.rb'

After do |scenario|
  ## after each scenario it takes a print,
  ## remove bars and change generic spaces
  ## to blank space and removes:
  ## commas
  ## parentheses
  ## and sharps
  scenario_name = scenario.name.gsub(/\s+/, ' ').tr('/', ' ')
  scenario_name = scenario_name.delete(',', '')
  scenario_name = scenario_name.delete('(', '')
  scenario_name = scenario_name.delete(')', '')
  scenario_name = scenario_name.delete('#', '')
  (0..scenario.source_tag_names.length - 1).each do |tag_idx|
    unless scenario.source_tag_names[tag_idx].eql? '@api'
      @helper = Helper.new
      ## take screenshot if scenario fails,
      if scenario.failed?
        @helper.take_screenshot(scenario_name, 'scenario_failed')
      ## the same if scenario passes...
      else
        @helper.take_screenshot(scenario_name, 'scenario_passed')
      end
      # ---
      puts 'O cenário ' + scenario_name + ' foi finalizado!'
    else
      puts 'O cenário ' + scenario_name + ' foi finalizado!'
    end
  end
end
