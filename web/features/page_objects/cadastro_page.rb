module PageObjects
  class CadastroPage < SitePrism::Page
    set_url '/accounts/signup/'
    element :usuario_field, "input[name='username']"
    element :senha_field, "input[name='pass']"
    element :confirmar_senha_field, "input[name='confirmpass']"
    element :cadastrar_button, "button.login100-form-btn"
    element :login_error, '.container-login100-form-btn', match: :first
  end
end