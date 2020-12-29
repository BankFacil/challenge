page = Newaba.new


Given("que estou na  home page windows") do   
    page.has_text?('Click Here')
    expect(page.has_text?('Click Here')).to eq true
  end
  
  Given("clico no link Click Here") do
    page.selecioneCliqueHere.click
  end
  
  Then("sou direcionado para uma nova aba") do
    page.switch_to_window  {page.title == "New Window"}
    expect(page).to have_content 'New Window'

  end