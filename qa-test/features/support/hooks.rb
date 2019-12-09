Before ("@checkbox") do
    visit 'https://the-internet.herokuapp.com/dynamic_controls'
end

Before ("@aba") do
    visit 'https://the-internet.herokuapp.com/windows'
end

After do |scenario|
    nome_funcionalidade = scenario.feature.name.tr(' ', '').downcase!
    nome_funcionalidade = nome_funcionalidade.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\ˆ\$\+\-]+)/,'')
    nome_cenario = scenario.name.tr(' ', '').downcase!
    screenshot = "report/screenshot/#{nome_funcionalidade} - #{nome_cenario}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'Clique para ver a evidência!')

end