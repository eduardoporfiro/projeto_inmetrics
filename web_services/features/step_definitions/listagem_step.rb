Before do
  @page = PageObjects::EmpregadoController.new
end

When(/^eu realizar uma requisição do tipo GET para a listagem de empregados$/) do
  @response = @page.listar
end

When(/^que eu tenha um empregado cadastrado$/) do
  body = {:admissao=>"31/12/2020",
          :cargo=>"SuperQA",
          :comissao=>"2.000,00",
          :cpf=>"111.222.333-00",
          :departamentoId=>"1",
          :nome=>"Eduardo Costa",
          :salario=>"1.000,00",
          :sexo=>"m",
          :tipoContratacao=>"clt"}
  @page.set_body(body)
  step('eu realizar uma requisição do tipo POST para o endpoint de cadastro de empregado')
  step('o meu response code terá o valor "202"')
  step('eu devo validar o contrato através do schema "cadastro_empregado/cadastro"')
  @employe_id = JSON.parse(@response.body)['empregadoId']
end

When(/^eu realizar uma requisição do tipo GET para a listagem de empregados com o empregado criado$/) do
  @response = @page.get_empregado @employe_id
end