When(/^que eu esteja na página de cadastro$/) do
  @login_page = PageObjects::CadastroPage.new
  @login_page.load
end

When(/^que eu preenchi o campo confirmar senha com o valor "([^"]*)"$/) do |value|
  @login_page.confirmar_senha_field.set value
end

When(/^eu clicar em "Cadastrar"$/) do
  @login_page.cadastrar_button.click
end

When(/^eu verei um placeholder no\(s\) campo\(s\) "([^"]*)" com o texto "([^"]*)"$/) do |fields, error_message|
  fields.split(', ').each do |value|
    value = (value.downcase.gsub(' ', '_') + '_field').to_sym
    expect(@login_page.send(value).find(:xpath, '..')[:class]).to include('alert-validate')
    expect(@login_page.send(value).find(:xpath, '..')["data-validate"]).to eq(error_message)
  end
end

When(/^eu verei um poupup de alerta no campo "([^"]*)" com a mensagem "([^"]*)"$/) do |fields, error_message|
  fields.split(', ').each do |value|
    value = (value.downcase.gsub(' ', '_') + '_field').to_sym
    expect(@login_page.send(value)["validationMessage"]).to eq(error_message)
  end
end

When(/^eu serei direcionado para a página de login$/) do
  @login_page = PageObjects::LoginPage.new
  @login_page.usuario_field
  expect(@login_page).to have_usuario_field
end