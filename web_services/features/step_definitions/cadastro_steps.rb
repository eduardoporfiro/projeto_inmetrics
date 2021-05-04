Before do
  @page = PageObjects::EmpregadoController.new
end

When(/^que eu use usuário como "([^"]*)" e senha como "([^"]*)"$/) do |username, password|
  @page.set_login username, password
end

When(/^que eu tenha construido um body usando os parâmetros:$/) do |table|
  @page.set_body(table.hashes)
end

When(/^eu realizar uma requisição do tipo POST para o endpoint de cadastro de empregado/) do
  @response = @page.cadastrar
end

When(/^o meu response code terá o valor "([^"]*)"$/) do |response_code|
  expect(@response.code.to_s).to eq response_code
end

When(/^eu verei a mensagem de erro para o campo "([^"]*)" com o texto "([^"]*)"$/) do |field, error_mesage|
  response = JSON.parse @response.body
  response.each do |value|
    response_field, message = value.split ': '
    expect(message).to eq(error_mesage) if response_field == field
  end
end

When(/^eu verei no corpo do response com o texto "([^"]*)"$/) do |error_message|
  expect(@response.body).to eq(error_message)
end

When(/^eu devo validar o contrato através do schema "([^"]*)"$/) do |schema|
  expect(@response.body).to match_json_schema(schema)
end