#language: pt

@cadastrar
Funcionalidade: Realizar cadastro na plataforma InMetrics
  Eu como usuário
  Desejo cadastrar na plataforma
  Para ter acesso completo ao meu sistema

  Esquema do Cenário: Verificar erros no campo de cadastro
    Dado que eu esteja na página de cadastro
    E que eu preenchi o campo usuário com o valor "<VALOR_USUARIO>"
    E que eu preenchi o campo senha com o valor "<VALOR_SENHA>"
    E que eu preenchi o campo confirmar senha com o valor "<VALOR_CONFIRMAR_SENHA>"
    Quando eu clicar em "Cadastrar"
    Então eu verei um placeholder no(s) campo(s) "<CAMPOS>" com o texto "<MENSAGEM_ERRO>"
  Exemplos:
    |VALOR_USUARIO|VALOR_SENHA|VALOR_CONFIRMAR_SENHA|CAMPOS                         |MENSAGEM_ERRO    |
    |             |           |                     |Usuario, Senha, Confirmar Senha|Campo obrigatório|

  Esquema do Cenário: Verificar erros no campo de cadastro
    Dado que eu esteja na página de cadastro
    E que eu preenchi o campo usuário com o valor "<VALOR_USUARIO>"
    E que eu preenchi o campo senha com o valor "<VALOR_SENHA>"
    E que eu preenchi o campo confirmar senha com o valor "<VALOR_CONFIRMAR_SENHA>"
    Quando eu clicar em "Cadastrar"
    Então eu verei um poupup de alerta no campo "<CAMPO>" com a mensagem "<MENSAGEM_ERRO>"
  Exemplos:
      |VALOR_USUARIO|VALOR_SENHA|VALOR_CONFIRMAR_SENHA|CAMPO          |MENSAGEM_ERRO                                                                          |
      |A            |           |                     |Usuario        |Aumente esse texto para 8 caracteres ou mais. No momento, você está usando 1 caractere.|

  Cenário: Verificar erro de cadastro já existente
    Dado que eu esteja na página de cadastro
    E que eu preenchi o campo usuário com o valor "11223344"
    E que eu preenchi o campo senha com o valor "11223344"
    E que eu preenchi o campo confirmar senha com o valor "11223344"
    Quando eu clicar em "Cadastrar"
    Então eu verei uma mensagem de erro com o texto "Usuário já cadastrado"
    
  Cenário: Realizar cadastro com sucesso
    Dado que eu esteja na página de cadastro
    E que eu preenchi o campo usuário com o valor "AUT"
    E que eu preenchi o campo senha com o valor "teste123"
    E que eu preenchi o campo confirmar senha com o valor "teste123"
    Quando eu clicar em "Cadastrar"
    Então eu serei direcionado para a página de login
