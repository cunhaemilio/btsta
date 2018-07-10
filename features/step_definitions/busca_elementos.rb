Dado("acessei a pagina de links") do
    visit 'buscaelementos/links'
  end
  
  Quando("clico no link") do
    click_link('Ok 200 - Sucess')
  end

  Dado("acessei a pagina de botoes") do
    visit '/buscaelementos/botoes'
  end
  
  Quando("clico no botao Raised") do
    find('a[class="waves-light btn"]').click
  end

  Quando("clico no botao Floating") do
    find('a[onclick="ativaedesativa2()"]').click
    sleep 1
    find('a[onclick="ativaedesativa2()"]').double_click
  end

  Quando("clico no botao Submmit") do
    click_button(class: 'btn waves-light')
  end

  Dado("acessei a pagina de radio e check") do
    visit '/buscaelementos/radioecheckbox'
  end
  
  Quando("clico no radio Red") do
    find('label[for="red"]').click
  end
  
  Entao("o sistema marca o radio red") do
    expect(page).to have_content 'Red'
  end

  Quando("clico no check purple") do
    #colocar elemento visivel pois o mesmo é um input
    check('purple', allow_label_click: true)
  end
  
  Entao("o sistema marca o purple") do
    expect(page).to have_content 'purple'
  end

  Quando("clico no radio Yellow") do
    find('label[for="yellow"]').click
  end
  
  Entao("o sistema marca o radio Yellow") do
    expect(page).to have_content 'Yellow'
  end

  Quando("clico no check White") do
   
    find('label[for="white"]').click
  end
  
  Entao("o sistema marca o White") do
    expect(page).to have_content 'White'
  end

  Dado("acessei a pagina de dropdown e select") do
    visit '/buscaelementos/dropdowneselect'
  end
  
  Quando("clico no mail box") do
    #colocar ponto entre o espaco da classe  find('.btn dropdown-button').click
    find('.btn.dropdown-button').click
    sleep 2
    find('a[onclick="ativaedesativadrop2()"]').click
    
  end

  Quando("seleciono os campos") do
    find(:xpath, "/html/body/div[2]/div[2]/div/div[5]/div[1]/div/input").click
    find(:xpath, "/html/body/div[2]/div[2]/div/div[5]/div[1]/div/input").send_keys(:down)
    find(:xpath, "/html/body/div[2]/div[2]/div/div[5]/div[1]/div/input").send_keys(:enter)
    sleep 1
   

  end
  
