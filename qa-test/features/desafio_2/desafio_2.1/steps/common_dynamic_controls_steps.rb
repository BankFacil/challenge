Given("that i access the main screen page of the system") do
    visit "https://the-internet.herokuapp.com/dynamic_controls"
    expect(page).to have_text("This example demonstrates when controls (e.g., checkbox, option button, etc.) are added or removed asynchronously.")
    sleep(5)
end

Given("has a checkbox visible on screen") do
    expect(page).to have_css(desafio_segunda_parte_a.verify_check_box)
end