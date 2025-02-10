*** Settings ***
Library    String

*** Variables ***
@{OBJETOS}     mesa   
...            caneta
...            escova   
...            cadeira   
...            lápis

&{MESES}       janeiro=31   
...            fevereiro=28
...            março=31
...            abril=30
...            maio=31
...            junho=30
...            julho=31
...            agosto=31
...            setembro=30
...            outubro=31
...            novembro=30
...            dezembro=31

${NOME}        rebeca
${SOBRENOME}   camilo

*** Keywords ***
imprime valor lista
    Log To Console    Valor do objeto na posição 0: ${OBJETOS[0]}
    Log To Console    Valor do objeto na posição 1: ${OBJETOS[1]}
    Log To Console    Valor do objeto na posição 2: ${OBJETOS[2]}
    Log To Console    Valor do objeto na posição 3: ${OBJETOS[3]}
    Log To Console    Valor do objeto na posição 4: ${OBJETOS[4]}

imprime valor dicionario
    Log To Console    Valor da chave janeiro: ${MESES.janeiro}
    Log To Console    Valor da chave fevereiro: ${MESES.fevereiro}
    Log To Console    Valor da chave março: ${MESES.março}
    Log To Console    Valor da chave abril: ${MESES.abril}
    Log To Console    Valor da chave maio: ${MESES.maio}
    Log To Console    Valor da chave junho: ${MESES.junho}
    Log To Console    Valor da chave julho: ${MESES.julho}
    Log To Console    Valor da chave agosto: ${MESES.agosto}
    Log To Console    Valor da chave setembro: ${MESES.setembro}
    Log To Console    Valor da chave outubro: ${MESES.outubro}
    Log To Console    Valor da chave novembro: ${MESES.novembro}
    Log To Console    Valor da chave dezembro: ${MESES.dezembro}

gera email
    [Arguments]     ${STRING1}   ${STRING2}
    ${RDN_STRING}    Generate Random String
    ${EMAIL}     Set Variable    ${STRING1}${STRING2}${RDN_STRING}@testerobot.com
    Log To Console    ${EMAIL}

*** Test Cases ***
Exercicio 01
    imprime valor lista

Exercicio 02
    imprime valor dicionario

Exercicio 03
    gera email    STRING1=${NOME}    STRING2=${SOBRENOME}
