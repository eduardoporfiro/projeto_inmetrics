module PageObjects
  class LoginPage < SitePrism::Page
    set_url ''
    element :usuario_field, "input[name='username']"
    element :senha_field, "input[name='pass']"
    element :login_button, "button.login100-form-btn"
    element :login_error, ".alert-danger"
  end
end