#language: pt

@login
Funcionalidade: Login na plataforma InMetrics
  Eu como usuário
  Desejo logar na plataforma
  Para ter acesso completo ao meu sistema

  Esquema do Cenário: Verificar mensagens de erros nos campos
    Dado que eu esteja na página do login
    E que eu preenchi o campo usuário com o valor "<VALOR_USUARIO>"
    E que eu preenchi o campo senha com o valor "<VALOR_SENHA>"
    Quando eu clicar em "Entre"
    Então eu verei um placeholder no(s) campo(s) "Usuario, Senha" com o texto "<MENSAGEM_ERRO>"
  Exemplos:
    |VALOR_USUARIO|VALOR_SENHA|MENSAGEM_ERRO    |
    |             |           |Campo obrigatório|

  Cenário: Verificar mensagem de erro ao realizar login inválido
    Dado que eu esteja na página do login
    E que eu preenchi o campo usuário com o valor "<VALOR_USUARIO>"
    E que eu preenchi o campo senha com o valor "<VALOR_SENHA>"
    Quando eu clicar em "Entre"
    Então eu verei uma mensagem de erro com o texto "ERRO! Usuário ou Senha inválidos"
    E os campos de login e senha estarão vazios

  Cenário: Login com sucesso
    Dado que eu esteja na página do login
    E que eu preenchi o campo usuário com o valor "<VALOR_USUARIO>"
    E que eu preenchi o campo senha com o valor "<VALOR_SENHA>"
    Quando eu clicar em "Entre"
    Então eu verei a página inicial