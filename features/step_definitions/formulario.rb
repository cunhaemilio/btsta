Dado("acessei a pagina de criacao de usuarios") do
    visit '/users/new'
 end

  Quando("informo os campos e salvo") do
    find('#user_name').set 'Joao'
    find('#user_lastname').set 'Silva'
    find('#user_email').set 'jsilva@gmail.com'
    find('#user_address').set 'Brasilia'
    find('#user_university').set 'Unip'
    find('#user_profile').set 'Estudante'
    find('#user_gender').set 'Masc'
    find('#user_age').set '18'
    find('input[value="Criar"]').click

  end

  Dado("acessei a pagina de listagem de usuarios") do
    visit '/users'
  end
  
  Quando("Verifico a pagina") do
    expect(page).to have_content "Lista de Usuários!!"
  end
  
  Entao("o sistema apresenta os dados") do
    expect(page).to have_content "cunhaemilio@gmail.com"
  end
