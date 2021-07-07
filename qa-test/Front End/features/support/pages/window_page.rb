class WindowPage < SitePrism::Page
  set_url '/windows'
    
  element :link, 'a[href="/windows/new"]'
  element :text, 'h3'

  def open_window
    @janela = window_opened_by do
      link.click 
    end
  end

  def switch_window
    switch_to_window windows.last
  end

end
