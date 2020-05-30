require 'fileutils'

# ---
class Helper
  # ---

  def take_screenshot(scenario_name, folder)
    timer     = Time.now.strftime('%d-%m-%Y %H:%M:%S').to_s
    file_path = "results/screenshots/#{folder}/#{scenario_name}/"
    file      = "#{timer}.png"
    FileUtils.mkdir_p(file_path) unless File.exist?(file_path)
    Capybara.page.save_screenshot(file_path.concat(file))
  end
end
