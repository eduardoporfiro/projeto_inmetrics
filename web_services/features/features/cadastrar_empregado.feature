#language: pt
@cadastro_empregado
  Funcionalidade: Cadastro de Empregado
    Contexto: Inserindo informações de login
      Dado que eu use usuário como "inmetrics" e senha como "automacao"

    Esquema do Cenário: Verificar mensagens de erros
      Dado que eu tenha construido um body usando os parâmetros:
      |KEY            |VALUE             |
      |admissao       |<ADMISSAO>        |
      |cargo          |<CARGO>           |
      |comissao       |<COMISSAO>        |
      |cpf            |<CPF>             |
      |departamentoId |<DEPARTAMENTO>    |
      |nome           |<NOME>            |
      |salario        |<SALARIO>         |
      |sexo           |<SEXO>            |
      |tipoContratacao|<TIPO_CONTRATACAO>|
      Quando eu realizar uma requisição do tipo POST para o endpoint de cadastro de empregado
      Então o meu response code terá o valor "400"
      E eu verei a mensagem de erro para o campo "<CAMPO>" com o texto "<MENSAGEM>"
      Exemplos:
      |ADMISSAO|CARGO |COMISSAO|CPF   |NOME  |SALARIO|SEXO  |TIPO_CONTRATACAO|DEPARTAMENTO|CAMPO          |MENSAGEM                           |
      |string  |string|string  |string|string|string |string|string          |0           |sexo           |m, f ou i                          |
      |string  |string|string  |string|string|string |string|string          |0           |cpf            |deve estar no padrão 111.222.333-00|
      |string  |string|string  |string|string|string |string|string          |0           |admissao       |deve estar no padrão 31/12/2020    |
      |string  |string|string  |string|string|string |string|string          |0           |comissao       |deve estar no padrão 1.000,00      |
      |string  |string|string  |string|string|string |string|string          |0           |salario        |deve estar no padrão 1.000,00      |
      |string  |string|string  |string|string|string |string|string          |0           |tipoContratacao|pj ou clt                          |

    Cenário: Mensagem de erro para vínculo de departamento
      Dado que eu tenha construido um body usando os parâmetros:
        |KEY            |VALUE         |
        |admissao       |31/12/2020    |
        |cargo          |SuperQA       |
        |comissao       |2.000,00       |
        |cpf            |111.222.333-00|
        |departamentoId |0             |
        |nome           |Eduardo Costa |
        |salario        |1.000,00       |
        |sexo           |m             |
        |tipoContratacao|clt           |
      Quando eu realizar uma requisição do tipo POST para o endpoint de cadastro de empregado
      Então o meu response code terá o valor "400"
      E eu verei no corpo do response com o texto "Departamento não cadastrado"

    Cenário: Realizar cadastro com sucesso
      Dado que eu tenha construido um body usando os parâmetros:
        |KEY            |VALUE         |
        |admissao       |31/12/2020    |
        |cargo          |SuperQA       |
        |comissao       |2.000,00      |
        |cpf            |111.222.333-00|
        |departamentoId |1             |
        |nome           |Eduardo Costa |
        |salario        |1.000,00      |
        |sexo           |m             |
        |tipoContratacao|clt           |
      Quando eu realizar uma requisição do tipo POST para o endpoint de cadastro de empregado
      Então o meu response code terá o valor "202"
      E eu devo validar o contrato através do schema "cadastro_empregado/cadastro"