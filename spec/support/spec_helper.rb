module SpecHelper
  def sign_in_user
    login_as create(:user)
  end

  def submit_form
    find('input[name="commit"]').click
  end
end