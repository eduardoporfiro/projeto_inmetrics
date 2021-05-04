#language: pt
@listagem_empregado
Funcionalidade: Cadastro de Empregado
  Contexto: Inserindo informações de login
    Dado que eu use usuário como "inmetrics" e senha como "automacao"

  Cenário: Veficar informações de listagem
    Quando eu realizar uma requisição do tipo GET para a listagem de empregados
    Então o meu response code terá o valor "200"