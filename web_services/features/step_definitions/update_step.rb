Before do
  @page = PageObjects::EmpregadoController.new
end
When(/^eu realizar uma requisição do tipo PUT para o endpoint de alteração de empregado$/) do
  @response = @page.alterar @employe_id
end

When(/^o id do empregado deve ser o mesmo do cadastrado$/) do
  expect(JSON.parse(@response.body)['empregadoId']).to eq(@employe_id)
end

When(/^o campo "([^"]*)" deve estar com o valor "([^"]*)"$/) do |field, value|
  expect(JSON.parse(@response.body)[field]).to eq(value)
end