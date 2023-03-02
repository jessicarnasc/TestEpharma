***Settings***
Resource                        ../QApage/QApage.robot
Resource                        ../QAsteps/QAsteps.robot


Test Setup                      Abrir navegador                 ${URL} 
# Test Teardown                   Fechar navegador

*** Test Cases ***

# robot -t "CT01:Cadatro Novo" -d ./results "QAtest\QAtest.robot"
CT01:Cadatro Novo
  Dado que acesso ao site Demo QA
  Quando preencho as informações pessoais "Jessica", "Nascimento", "jessicarochalima21@gmail.com", "11987793226", "25", "August", "1991", "Computer Science".
  E seleciono o curriculum preencho endereço, "Rua Valdemir Pereira de Camargo, 186", State and city "NCR", "Delhi" e dou click em submit
  Entao valido a mensagem "Thanks for submitting the form" com os itens preenchido "${nomeCompleto}" e "${email}" corretamente e finalizo cadastro