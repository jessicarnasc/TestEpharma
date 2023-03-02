***Settings***
Resource                        ../QApage/QApage.robot
Resource                        ../QAresource/QAresource.robot



*** Keywords ***    

Dado que acesso ao site Demo QA
    Execute Javascript      document.getElementById('fixedban').style.display = "none";
    Aguarda                                                                     
    Valida Elemento                             ${Logo}       
    Print Tela                            
    
Quando preencho as informações pessoais "${nome}", "${sobrenome}", "${email}", "${genero}", "${telefone}, "${dia}", "${mes}", "${ano}", "${assunto}", "${hobbie}".
    Aguarda
    Set Test Variable                       ${nomeCompleto}             ${nome} ${sobrenome}
    Set test Variable                       ${email}                                                        
    Preenche Text                           ${InputNome}                ${nome}      
    Preenche Text                           ${InputSobrenome}           ${sobrenome}
    Preenche Text                           ${InputEmail}               ${email}
    Selecionar Genero                       ${genero}
    Preenche Text                           ${InputTelefone}            ${telefone}
    Preenche calender                       ${dia}        ${mes}        ${ano}
    Preenche AutoCompletavel                ${InputAssunto}             ${assunto} 
    Aguarda  
    Selecionar Hobbie                       ${hobbie}
    Print Tela
    
E seleciono o curriculum preencho endereço, "${endereco}", State and city "${state}", "${city}" e dou click em submit
    # Execute javascript      document.body.style.zoom="90%"
    Click no Item                           ${BtnArquivo}
    Limpa input e preenche Sikuli           ${INPUT}                    ${CURDIR}
    Click Imagem                            ${CURRICULUM}
    Preenche Text                           ${InputEndereco}            ${endereco}
    Ir Até                                  ${BtnSubmit}
    Seleciona Item Combo Box                ${InputState}               ${state}
    Seleciona Item Combo Box                ${InputCity}                ${city}
    Print Tela
    Click Javascript                        ${BtnSubmit}

Entao valido a mensagem "${msg}" com os itens preenchido "${nomeCompleto}" e "${email}" corretamente e finalizo cadastro
    Valida Elemento                         ${ModalMsg}
    Verifica Se Contem o Texto              ${ModalMsg}         ${msg}
    Print Tela
    Valida Item no Modal                    ${nomeCompleto}
    Valida Item no Modal                    ${email}
    Click no Item                           ${BtnCloseModal}

