# ---

Dado('que eu estou na página Dynamic Controls') do
  dynamic_ctrls_page.access_dynamic_controls_page
end

Quando('eu clico no botão dinâmico') do
  dynamic_ctrls_page.click_dynamic_button
end

Então('o checkbox deverá estar invisível') do
  dynamic_ctrls_page.wait_until_checkbox_invisible
end

Então('o checkbox deverá estar visível') do
  dynamic_ctrls_page.wait_until_checkbox_visible
end

Então('a frase {string} deverá ser apresentada') do |frase|
  dynamic_ctrls_page.validate_presented_phrase(frase)
end
