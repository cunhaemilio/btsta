
Dado("Que eu esteja logado na aplicação. Será apresentada a tela com o formulário da aba Início.") do
#preon
visit 'https://prehom.dpf.gov.br/siproquim-internet/#!/'
#desenv
#visit 'https://sistemasdesenv.dpf.gov.br/siproquim-internet/#/'

#Preom
find('#username').set 'teste@gmail.com'

#Desenv
#  find('#username').set 'teste@hotmail.com'
  find('#password').set 'Teste@2017'
  find('#kc-login').click
end

Então("Eu verifico se login foi efetuado com sucesso") do
  expect(page).to have_content ('Dados Pessoais')
end

Dado("Eu acesso o cenário de emissão de requerimento CRC") do
  find('#menuRequerimento').click
  find('#subMenuEmissao').click
  find('#subItemEmissaoCrc').click
  find('#btnNovoRequerimento').click
  find('#dadosRequerente').click
  end

  Então("verifico se o cenário foi aberto corretamente") do
    expect(page).to have_content ('Dados de Identificação')
  end

Quando("eu informo o cnpj a aplicação apresenta os campos para preechimento") do
  sleep 2
  find('input[name="cnpj"]').set '43202472000130'
  sleep 2
  find(:xpath, "//html/body/div[1]/main/article/section[2]/div/div/div[2]/div/div/div/ng-transclude/div/fieldset[1]/div[4]/fieldset[1]/div[1]/div[1]/div/div/div/label/div[1]/label[3]").click
  end

E ("Eu preencho todos os campos obrigatórios") do
  #find( "label" , text="Entidades particulares de caráter assistencial, filantrópico e sem fins lucrativos" ).click
  find('input[name="dto_email"]').set 'teste@gmail.com'
  find('input[name="dto_email-confirmar"]').set 'teste@gmail.com'
  find('option[label="Celular"]').click
  find('#telefoneNumero').set '6193102510'

  find('#btnAdicionarListaTelefone').click
  find('#Salvar').click
  
  #Incluir comprovante de isenção
  #find('#Anexar').click
  #sleep 2
  #find('option[label="COMPROVANTE DE ISENCAO"').click
  #find('option[label="Requerimento de Renovação da CEBAS"').click
  #find('#upload > input[type="file"]', visible: false).set 'C:\\Users\\WesleyBarros\\Downloads\\Classificados Etapa Avalia__o de Conhecimentos - SQF Geben-Prisma - ASA 2014.pdf'
  #find('#upload > input[type="file"]', visible: false).set Dir.pwd + '/features/support/documents/Md_Proc.pdf'
  #find('#salvarAnexo').click
  #find('button[ng-click="vm.fechar()"]').click
end

Então("verifico se a aplicação abriu as abas para cadastro") do
  expect(page).to have_content ('Dados de Identificação')
end

E ("Eu adiciono uma pessoa vinculada") do
  find('#pessoasVinculadas').click
  sleep 3
  find('input[name="cpf"]').set '02314375106'
  sleep 3
  find('input[name="dto_email"]').set 'teste@gmail.com'
  find('input[name="dto_email-confirmar"]').set 'teste@gmail.com'
  find('option[label="Celular"]').click
  find('#telefoneNumero').set '6193102510'

  find('#btnAdicionarListaTelefone').click
  sleep 2
  find('option[label="Despachante"]').click
  find('#adicionarRelacao').click
  sleep 1

  find('#anexar').click
  sleep 2
  find('option[label="Procuração"').click
  find('input[ng-model="vm.dto.validadeProcuracao"]').click
  
  # Hugo.. Criar uma pasta dentro de suport com o nome documents e colocar lá dentro um PDF qualquer com o nome Md_Proc
  # O caminho abaixo aponta para essa pasta e esse aquivo
  find('#upload > input[type="file"]', visible: false).set Dir.pwd + '/features/support/documents/Md_Proc.pdf'

  find('#salvarAnexo').click
  find('button[ng-click="vm.fechar()"]').click
  find('#adicionarRelacao').click

end

E ("Eu verifico se existem pendencias") do
  find('#verificarRequerimento').click
  @msg = "Verificar Inconsistências"
  expect(page).to have_content @msg

end
Entao("finalizo o fluxo de cadastro") do
  sleep 4
#  expect(page).to have_content ('Não existe inconsistências para este requerimento')
  find('#subItemEmissaoCrc').click
  find('input[name="cpfCnpj"]').set '57014854000144'
  find('#pesquisar').click
  find('a[ng-click="vm.excluir(item)"]').click # Excluindo a solicitação
  find('#ok').click #modal de Confirmação
end
