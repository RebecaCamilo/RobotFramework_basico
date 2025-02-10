*** Settings ***
Library    SeleniumLibrary


*** Variables ***

${URL}                        https://www.amazon.com.br/
${MENU_ELETRONICOS}           //a[contains(@data-csa-c-content-id,'electronics')]
${HEADER_ELETRONICOS}         //h2//span[contains(.,'Eletrônicos e Tecnologia')]


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//span[@class='a-size-base-plus'][contains(.,'${NOME_CATEGORIA}')]
    
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa, listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[3]

Clicar no produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=//img[contains(@alt,'${PRODUTO}')]
    Click Element    locator=//img[contains(@alt,'${PRODUTO}')]

Clicar no botao Adicionar ao Carrinho
    Wait Until Element Is Visible    locator=//input[contains(@name,'submit.add-to-cart')]
    Click Element    locator=//input[contains(@name,'submit.add-to-cart')]

Adicionar o produto "${PRODUTO}" no carrinho
    Clicar no produto "${PRODUTO}"
    Clicar no botao Adicionar ao Carrinho

Navegar ate a pagina do Carrinho
    Wait Until Element Is Visible    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
    Click Element    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
    Click Element    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]

Remover o produto "${PRODUTO}" do carrinho
    Wait Until Element Is Visible    locator=//button[contains(@aria-label,'Excluir ${PRODUTO}')]
    Click Button    locator=//button[@aria-label='Excluir Console Xbox Series S']

Verificar se o produto "${PRODUTO}" é retirado do carrinho
    Page Should Contain    text=${PRODUTO}
    Page Should Contain    text=foi removido de Carrinho de compras.

# GUERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página    
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    
Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, listando o produto "Console Xbox Series S"

E um produto "${PRODUTO}" ser adicionado ao carrinho
    Adicionar o produto "${PRODUTO}" no carrinho

Então o produto "${PRODUTO}" deve ser visualizado na página do carrinho
    Verificar se o produto "${PRODUTO}" foi adicionado com sucesso

E o produto "${PRODUTO}" deve ser removido do carrinho com sucesso
    Verificar se o produto "${PRODUTO}" é retirado do carrinho
