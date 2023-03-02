

*** Variables

${Logo}                                                         xpath=//a[@href='https://demoqa.com']
${InputNome}                                                    xpath=//input[@placeholder='First Name']
${InputSobrenome}                                               xpath=//input[@placeholder='Last Name']
${InputEmail}                                                   xpath=//input[@id='userEmail']
${InputEndereco}                                                xpath=//textarea[@id='currentAddress']
${InputState}                                                   xpath=//div[@id='state']/..
${InputCity}                                                    xpath=//div[@id='city']/../div/div/div[2]/div
${ChkBoxGenero}                                                 xpath=//label[@for='gender-radio-2']
${InputTelefone}                                                xpath=//input[@placeholder='Mobile Number']
${Calendario}                                                   xpath=//input[@id='dateOfBirthInput']
${InputAssunto}                                                 xpath=//div[@id='subjectsContainer']
${MesNiver}                                                     xpath=//select[@class='react-datepicker__month-select']
${AnoNiver}                                                     xpath=//select[@class='react-datepicker__year-select']
${Hobbie}                                                       xpath=//div[@class='custom-control custom-checkbox custom-control-inline']//input[@id='hobbies-checkbox-3']/..
${SelecionarMes}                                                xpath=//option[@value='7']
${SelecionarAno}                                                xpath=//option[@value='1991']
${selecionarDia}                                                xpath=//div[@aria-label='Choose Sunday, August 25th, 1991']
${BtnArquivo}                                                   xpath=//label[@class='form-file-label']
${BtnSubmit}                                                    xpath=//button[contains(.,'Submit')]
${ModalMsg}                                                     xpath=//div[@class='modal-title h4']
${BtnCloseModal}                                                xpath=//button[@id='closeLargeModal']
