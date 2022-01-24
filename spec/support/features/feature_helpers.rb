module Features

  def fill_in_trix_editor(id, with)
    find(:xpath, "//\*[@id='#{id}']", visible: false).set(with)
  end

  def find_trix_editor(id)
    find(:xpath, "//*[@id='#{id}']", visible: false)
  end

end
