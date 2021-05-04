Before do
  @page = PageObjects::EmpregadoController.new
end

When(/^eu realizar uma requisição do tipo GET para a listagem de empregados$/) do
  @response = @page.listar
end