#language: pt
@listagem_empregado
Funcionalidade: Listagem de Empregado
  Contexto: Inserindo informações de login
    Dado que eu use usuário como "inmetrics" e senha como "automacao"

  Cenário: Veficar informações de listagem de todos
    Quando eu realizar uma requisição do tipo GET para a listagem de empregados
    Então o meu response code terá o valor "202"

  Cenário: Veficar informações de um único empregado
    Dado que eu tenha um empregado cadastrado
    Quando eu realizar uma requisição do tipo GET para a listagem de empregados com o empregado criado
    Então o meu response code terá o valor "202"
    E eu devo validar o contrato através do schema "cadastro_empregado/cadastro"