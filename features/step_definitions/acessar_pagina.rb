Dado("acessei a pagina de automacao") do
    visit '/#'
  end
  
  Quando("informo clico no botao comecar automacao web") do
    click_on('Começar Automação Web')
  end
  
  Entao("o sistema apresenta a mensagem {string}") do |msg|
    @mensagem = msg
    expect(page).to have_content @mensagem
  end
  