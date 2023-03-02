*** Settings ***        
Library                         SeleniumLibrary
Library                         AutoRecorder
Library                         FakerLibrary                locale=pt_BR
Library                         OperatingSystem
Library                         String
Library                         DateTime
Library                         SikuliLibrary


*** Variables ***
${BROWSER}                    chrome
${URL}                        https://demoqa.com/automation-practice-form
${CURRICULUM}                 ${CURDIR}\\imagens\\Curriculum.png
${SCROLL}                     ${CURDIR}\\imagens\\scroll.png
${INPUT}                      ${CURDIR}\\imagens\\path.png

*** Keywords ***

Abrir navegador
    [Arguments]                                         ${tela}
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Open Browser    ${tela}    chrome    options=${chrome_options}
    Maximize Browser Window
    Print Tela
    
Fechar navegador
    Print Tela
    Close Browser
    
Aguarda
    Sleep                                               1

Valida Item no Modal
    [Arguments]         ${item}
    ${element}      Set Variable        //div[@class='modal-body']//tr[contains(.,'${item}')]
    Valida Elemento                     ${element}     

Ir Até
    [Arguments]                                         ${element}
    Valida Elemento                                     ${element}
    Scroll Element Into View                            ${element}

Preenche calender
    [Arguments]    ${dia}    ${mes}    ${ano}
    ${day}        Set Variable                  //div[@class='react-datepicker__month-container']//div[@class='react-datepicker__month']//div[@aria-disabled='false'][contains(.,'${dia}')]
    ${month}      Set Variable                  //option[contains(.,'${mes}')]
    ${year}       Set Variable                  //option[contains(.,'${ano}')]
    Click no Item                               ${Calendario}
    Click no Item                               ${MesNiver}
    Click no Item                               ${month}
    Click no Item                               ${MesNiver}
    Click no Item                               ${AnoNiver}
    Click no Item                               ${year}
    Click no Item                               ${AnoNiver}
    Aguarda
    Aguarda
    Click Javascript                            ${day}

Seleciona Item Combo Box
    [Arguments]                                         ${ComboBox}                 ${item}
    Click no Item                                       ${ComboBox}
    Preenche AutoCompletavel                            ${ComboBox}                 ${item}

Preenche Teclando
    [Arguments]             ${input}         ${teclas}
    Press Keys              ${input}         ${teclas}

Esta Visivel
    [Arguments]                                         ${element}
    Wait Until Element Is Visible                       ${element}          3

Duplo Click
    [Arguments]                                         ${item}
    Aguarda
    Valida Elemento                                     ${item}
    SeleniumLibrary.Double Click Element                ${item}

Preenche AutoCompletavel
    [Arguments]                                         ${input}    ${texto}
    Preenche Teclando                                   ${input}    ${texto[:2]}
    ${element}      Set Variable                        //*[contains(text(),'${texto}')]
    Click no Item                                       ${element}

Click no Texto
    [Arguments]                                         ${texto}
    ${element}      Set Variable                        //*[contains(text(),'${texto}')]
    Click no Item                                       ${element}

Click no Item
    [Arguments]                                         ${item}
    Aguarda
    Valida Elemento                                     ${item}
    SeleniumLibrary.Click Element                       ${item}

Click Imagem
    [Arguments]                                         ${imagem}
    SikuliLibrary.Exists                                ${imagem}
    SikuliLibrary.Double Click                          ${imagem}

Limpa input e preenche Sikuli
    [Arguments]            ${ìnput}          ${text}
    SikuliLibrary.Click                      ${ìnput}
    SikuliLibrary.Press Special Key    DELETE
    SikuliLibrary.Input Text    ${ìnput}    ${text}
    SikuliLibrary.Press Special Key    ENTER

Click Com Mouse
    [Arguments]                                         ${element}
    Aguarda
    Valida Elemento                                     ${element}
    Mouse Over                                          ${element}
    Click no Item                                       ${element}

Preenche Text
    [Arguments]                                         ${input}            ${item}
    Valida Elemento                                     ${input}
    SeleniumLibrary.Input Text                          ${input}            ${item}

Verifica Se Contem o Texto
    [Arguments]                                         ${element}          ${text}
    Valida Elemento                                     ${element}
    Element Should Contain                              ${element}          ${text}

Valida Pagina 
    [Arguments]                                         ${element}
    Aguarda
    Title Should Be                                     ${element}

Print Tela
    SeleniumLibrary.Capture Page Screenshot     

Valida Elemento
    [Arguments]                                         ${element}
    ${status}       Run Keyword And Return Status       Esta Visivel        ${element}
    Aguarda
    Run Keyword If     '${status}' == 'False'    Fatal Error     msg=O Elemento '${element}' não encontrado na tela
   
Valida que não esta na tela
    [Arguments]                                         ${element}
    ${status}       Run Keyword And Return Status       Esta Visivel        ${element}
    Run Keyword If  '${status}' == 'True'               Fatal Error     msg=O Elemento '${element}' não deveria aparecer na tela
    
Click Javascript
    [Arguments]                                         ${elemento}
    Valida Elemento                                     ${elemento}
    ${elemento2}         Get WebElement                 ${elemento}
    Execute Javascript   arguments[0].click();     ARGUMENTS    ${elemento2}
    Capture Page Screenshot  

