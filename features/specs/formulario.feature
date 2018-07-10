#language: pt

@formulario
Funcionalidade: Formulario
SENDO um estudante de automacao
EU QUERO acessar a pagina de formulario
PARA que eu possa criar e listar usuarios


@criarformulario
Cenario: Criar Usuarios
Dado acessei a pagina de criacao de usuarios
Quando informo os campos e salvo
Entao o sistema apresenta a mensagem "Usuário Criado com sucesso"

@listarformulario
Cenario: Listar Usuarios
Dado acessei a pagina de listagem de usuarios
Quando Verifico a pagina
Entao o sistema apresenta os dados