Before do
  @checkbox = CheckboxPage.new
  @aba = WindowPage.new
end

After do |scenario|
  nome_do_cenario = scenario.name.tr(" ", "_").downcase!
  nome_do_cenario = nome_do_cenario.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
  
  screenshot = "logs/shots/#{nome_do_cenario}.png"
  page.save_screenshot(screenshot)
  embed(screenshot, 'image/png', 'Clique aqui para ver a evidencia!')
end