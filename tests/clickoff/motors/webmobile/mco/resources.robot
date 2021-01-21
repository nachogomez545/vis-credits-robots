*** Settings ***
Documentation     Resource for MCO Click off ATDD tests
Library           String

*** Variables ***
${server}   carro.mercadolibre.com.co
${item permalink}   MCO-598633795-se-vende-hermosa-camioneta-toyona-rush-full-equipo-_JM
${vip}    https://${server}/${item permalink}
${card title text}   Simula tu crédito online NUEVO
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
    ${title text}=  Get Text  xpath://*[@id="classi-credits-vip-section"]/div/p
    ${title}=   get line    ${title text}   0
    Should Be Equal	${title}	${card title text}

    # Validate bullets content
    ${bullet 0 text}=  Get Text  xpath://*[@id="classi-credits-vip-section"]/div/ul/li[1]
    Should Be Equal	${bullet 0 text}	${card bullet 0 text}

    ${bullet 1 text}=  Get Text  xpath://*[@id="classi-credits-vip-section"]/div/ul/li[2]
    Should Be Equal	${bullet 1 text}	${card bullet 1 text}

    ${bullet 2 text}=  Get Text  xpath://*[@id="classi-credits-vip-section"]/div/ul/li[3]
    Should Be Equal	${bullet 2 text}	${card bullet 2 text}

    # Validate subtitle content
    ${subtitle text}=  Get Text  xpath://*[@id="classi-credits-vip-section"]/div/div/div[1]
    Should Be Equal	${subtitle text}	${card subtitle text}

    # Validate icon access
    ${card bank logo src}=  Get Element Attribute   xpath://*[@id="santander"]    src
    Should be equal    ${card bank logo}    ${card bank logo src}

    # Validate button content
    ${button text}=  Get Text  xpath://*[@id="classi-credits-card-action"]
    Should Be Equal	${button text}	${card button text}
    ${card button link text}=   Get Element Attribute   xpath://*[@id="classi-credits-card-action"]    href
    ${card button target text}=   Get Element Attribute   xpath://*[@id="classi-credits-card-action"]    target
    Should be equal    ${card button link text}    ${card button link}
    Should be equal    ${card button target text}    ${card button target}