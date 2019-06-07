After do |scenario|
    nome_cenario = scenario.name.tr(' ', '_').downcase!
    nome_cenario = scenario.name.gsub(/\s+/, '_').tr('/', '_')
    screenshot = "log/shots/#{nome_cenario}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'Clique aqui para ver a evidência!')
  end