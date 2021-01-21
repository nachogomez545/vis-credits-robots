*** Settings ***
Documentation     Resource for MCO Click off ATDD tests
Library           SeleniumLibrary
Library           String

*** Variables ***
${server}   carro.mercadolibre.com.co
${browser}  chrome
${delay}    0
${item permalink}   MCO-598633795-se-vende-hermosa-camioneta-toyona-rush-full-equipo-_JM
${click off mco}    https://${server}/${item permalink}
${card title text}   Simula tu crédito online
${card badge title text}   NUEVO
${card bullet 0 text}   Eliges el monto a financiar y el número de cuotas.
${card bullet 1 text}   Completas tus datos personales.
${card bullet 2 text}   Recibes un contacto del banco para otorgarte el crédito.
${card subtitle text}   Trabajamos con
${card bank logo}   https://mobile.mercadolibre.com/remote_resources/image/logo-mlbsantander-vip-card
${card bank logo height}   25
${card bank logo width}   27
${card button text}   Simular crédito
${card button link}   https://tucarro.santanderconsumer.co/landing/?idvehiculo=MCO598633795&fuente=enriquecido
${card button target}   _blank

*** Keywords ***
Credits click off card should be present and has the right content
     # Validate card title and badge content
    ${title text}=  Get Text  xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[2]/div/p
    ${title}=   get line    ${title text}   0
    ${badge}=   get line    ${title text}   1
    Should Be Equal	${title}	${card title text}
    Should Be Equal	${badge}	${card badge title text}

    # Validate bullets content
    ${bullet 0 text}=  Get Text  xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[2]/div/ul/li[1]
    Should Be Equal	${bullet 0 text}	${card bullet 0 text}

    ${bullet 1 text}=  Get Text  xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[2]/div/ul/li[2]
    Should Be Equal	${bullet 1 text}	${card bullet 1 text}

    ${bullet 2 text}=  Get Text  xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[2]/div/ul/li[3]
    Should Be Equal	${bullet 2 text}	${card bullet 2 text}

    # Validate subtitle content
    ${subtitle text}=  Get Text  xpath://*[@id="classi-credits-vip-section"]/div/div/div[1]
    Should Be Equal	${subtitle text}	${card subtitle text}

    # Validate icon access
    Element Attribute Value Should Be   xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[2]/div/div/div[2]/img    src    ${card bank logo}

    # Validate button content
    ${button text}=  Get Text  xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[2]/div/a
    Should Be Equal	${button text}	${card button text}
    Element Attribute Value Should Be   xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[2]/div/a    href    ${card button link}
    Element Attribute Value Should Be   xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[2]/div/a    target    ${card button target}










