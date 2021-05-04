Before do
  @page = PageObjects::EmpregadoController.new
end

When(/^que eu já removi este empregado$/) do
  @page.deletar @employe_id
end

When(/^eu realizar uma requisição do tipo DELETE para o empregado cadastrado$/) do
  @response = @page.deletar @employe_id
end