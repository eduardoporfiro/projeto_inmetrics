#language: pt
@deletar_empregado
Funcionalidade: Remoção de Empregado
  Contexto: Inserindo informações de login
    Dado que eu use usuário como "inmetrics" e senha como "automacao"

  Cenário: Veficar mensagem de erro quando deletado um usuário inexistente
    Dado que eu tenha um empregado cadastrado
    E que eu já removi este empregado
    Quando eu realizar uma requisição do tipo DELETE para o empregado cadastrado
    Então o meu response code terá o valor "400"
    E eu verei no corpo do response com o texto "Empregado não cadastrado"

  Cenário: Veficar mensagem de sucesso ao deletar
    Dado que eu tenha um empregado cadastrado
    Quando eu realizar uma requisição do tipo DELETE para o empregado cadastrado
    Então o meu response code terá o valor "202"
    E eu verei no corpo do response com o texto "Deletado"