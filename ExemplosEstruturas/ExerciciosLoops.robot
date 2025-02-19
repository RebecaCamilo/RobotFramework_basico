*** Variables ***
@{NUMEROS}     1
...            2
...            3
...            4
...            5
...            6
...            7
...            8
...            9
...            10
...            11
...            12
...            13
...            14
...            15

*** Keywords ***
Usando FOR IN ENUMERATE
    Log To Console    ${\n}
    FOR   ${INDICE}   ${NUMERO}   IN ENUMERATE   @{NUMEROS}
        IF  ${NUMERO} == 5
            Log  message=Eu sou o número 5!  console=True
        ELSE IF  ${NUMERO} == 10
            Log  message=Eu sou o número 10!  console=True
        ELSE
            Log  message=Eu não sou o número 5 e nem o 10! Sou o número ${NUMERO}   console=True
        END
    END

*** Test Cases ***
Exercicio 01
    Usando FOR IN ENUMERATE
