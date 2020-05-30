# ---

Dado('que eu estou na página Windows') do
  windows_page.access_windows_page
end

Quando('eu clico no link disponibilizado na página') do
  windows_page.click_on_link
end

Então('a nova página deverá ser apresentada com o caminho {string}') do |caminho|
  windows_page.open_new_window(caminho)
  expect(windows_page.current_url).to end_with(caminho)
end
