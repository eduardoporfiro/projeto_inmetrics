When(/^que eu esteja na página do login$/) do
  @page = PageObjects::LoginPage.new
  @page.load
end

When(/^que eu preenchi o campo usuário com o valor "([^"]*)"$/) do |value|
  value = Faker::CPF.numeric if value == 'AUT'
  @page.usuario_field.set value
end

When(/^que eu preenchi o campo senha com o valor "([^"]*)"$/) do |value|
  @page.senha_field.set value
end

When(/^eu clicar em "Entre"$/) do
  @page.login_button.click
end

When(/^eu verei uma mensagem de erro com o texto "([^"]*)"$/) do |error_message|
  expect(@page.login_error.text).to include(error_message)
end

When(/^os campos de login e senha estarão vazios$/) do
  expect(@page.usuario_field.text).to eq('')
  expect(@page.senha_field.text).to eq('')
end

When(/^eu verei a página inicial$/) do
  raise 'Login com PROBLEMA'
end