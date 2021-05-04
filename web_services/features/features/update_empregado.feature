#language: pt
@alterar_empregado
Funcionalidade: Alteração dos dados Empregado
  Contexto: Inserindo informações de login
    Dado que eu use usuário como "inmetrics" e senha como "automacao"

  Esquema do Cenário: Verificar mensagens de erros
    Dado que eu tenha um empregado cadastrado
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
    Quando eu realizar uma requisição do tipo PUT para o endpoint de alteração de empregado
    Então o meu response code terá o valor "400"
    E eu verei a mensagem de erro para o campo "<CAMPO>" com o texto "<MENSAGEM>"
    Exemplos:
      |ADMISSAO  |CARGO  |COMISSAO|CPF           |NOME  |SALARIO |SEXO  |TIPO_CONTRATACAO|DEPARTAMENTO|CAMPO          |MENSAGEM                           |
      |31/12/2020|SuperQA|2.000,00|111.222.333-00|string|1.000,00|e     |clt             |1           |sexo           |m, f ou i                          |
      |31/12/2020|SuperQA|2.000,00|3333          |string|1.000,00|m     |clt             |1           |cpf            |deve estar no padrão 111.222.333-00|
      |31-12-2020|SuperQA|2.000,00|111.222.333-00|string|1.000,00|m     |clt             |1           |admissao       |deve estar no padrão 31/12/2020    |
      |31/12/2020|SuperQA|2.000,00|111.222.333-00|string|1000,00 |m     |clt             |1           |comissao       |deve estar no padrão 1.000,00      |
      |31/12/2020|SuperQA|2000,00 |111.222.333-00|string|1.000,00|m     |clt             |1           |salario        |deve estar no padrão 1.000,00      |
      |31/12/2020|SuperQA|2.000,00|111.222.333-00|string|1.000,00|m     |lst             |1           |tipoContratacao|pj ou clt                          |

  Cenário: Alterar com sucesso
    Dado que eu tenha um empregado cadastrado
    Dado que eu tenha construido um body usando os parâmetros:
      |KEY            |VALUE         |
      |admissao       |31/12/2020    |
      |cargo          |VAMOSQA       |
      |comissao       |2.000,00      |
      |cpf            |111.222.333-00|
      |departamentoId |1             |
      |nome           |Eduardo Costa |
      |salario        |1.000,00      |
      |sexo           |m             |
      |tipoContratacao|clt           |
    Quando eu realizar uma requisição do tipo PUT para o endpoint de alteração de empregado
    Então o meu response code terá o valor "202"
    E eu devo validar o contrato através do schema "cadastro_empregado/cadastro"
    E o id do empregado deve ser o mesmo do cadastrado
    E o campo "cargo" deve estar com o valor "VAMOSQA"