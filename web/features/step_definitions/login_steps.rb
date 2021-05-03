When(/^que eu esteja na página do login$/) do
  @login_page = PageObjects::LoginPage.new
  @login_page.load
end

When(/^que eu preenchi o campo usuário com o valor "([^"]*)"$/) do |value|
  value = Faker::CPF.numeric if value == 'AUT'
  @login_page.usuario_field.set value
end

When(/^que eu preenchi o campo senha com o valor "([^"]*)"$/) do |value|
  @login_page.senha_field.set value
end

When(/^eu clicar em "Entre"$/) do
  @login_page.login_button.click
end

When(/^eu verei uma mensagem de erro com o texto "([^"]*)"$/) do |error_message|
  expect(@login_page.login_error.text).to include(error_message)
end

When(/^os campos de login e senha estarão vazios$/) do
  expect(@login_page.usuario_field.text).to eq('')
  expect(@login_page.senha_field.text).to eq('')
end

When(/^eu verei a página inicial$/) do
  raise 'Login com PROBLEMA'
end