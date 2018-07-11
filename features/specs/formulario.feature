# language: pt
@EmissaoCRC

Funcionalidade: Emitir Requerimento CRC

Contexto: Atendimento Externo

Cenario: Acionar no menu lateral a opção Requerimento  Emissão  CRC  Novo Requerimento Cadastral  Selecionar um requerente.

 Dado Que eu esteja logado na aplicação. Será apresentada a tela com o formulário da aba Início.
 Então Eu verifico se login foi efetuado com sucesso
 
 E Eu acesso o cenário de emissão de requerimento CRC
 Então verifico se o cenário foi aberto corretamente

 Quando eu informo o cnpj a aplicação apresenta os campos para preechimento
 E Eu preencho todos os campos obrigatórios
 Então verifico se a aplicação abriu as abas para cadastro
 
 Quando Eu adiciono uma pessoa vinculada
 E Eu verifico se existem pendencias
 Então finalizo o fluxo de cadastro
