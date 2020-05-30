# ---
Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')]
  .each { |file| require file }

module Pages
  def dynamic_ctrls_page
    @dynamic_ctrls_page ||= DynamicControlsPage.new
  end

  def windows_page
    @windows_page ||= WindowsPage.new
  end
end
