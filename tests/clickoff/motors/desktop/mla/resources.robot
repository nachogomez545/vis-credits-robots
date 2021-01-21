*** Settings ***
Documentation     Resource for MCO Click off ATDD tests
Library           SeleniumLibrary
Library           String

*** Variables ***
${server}   auto.mercadolibre.com.ar
${item permalink}   MLA-877487392-ram-1500-57-laramie-2021-_JM
${vip}    https://${server}/${item permalink}
${web vip d2id}   898ff5f0-def4-4438-b013-51d6ac7a434c-f
${vpp d2id}   68320702-8a12-4ffd-a4c1-fbe58086e79d-f
${card title text}   Simulá tu crédito online
${card badge title text}   NUEVO
${card bullet 0 text}   Completás tus datos y los del vehículo.
${card bullet 1 text}   Ingresás tu pago inicial y la cantidad de cuotas que prefieras.
${card bullet 2 text}   Obtenés una respuesta inmediata para saber si tu crédito está aprobado.
${card subtitle text}   Trabajamos con
${card bank logo}   https://mobile.mercadolibre.com/remote_resources/image/logo-mlbsantander-vip-card
${card button vpp text}    Simular financiamiento
${card button web vip text}    Simular crédito
${card button link}   https://autoloans.santanderautos.com.ar/portalsanriopublico/#/home?publicationId=MLA877487392
${card button target}   _blank

*** Keywords ***
Credits click off card should be present and has the right content for vpp

    # Validate card title and badge content
    ${title}=  Get Text  xpath:/html/body/main/div/div[3]/div/div[2]/div[2]/div[2]/div/div[1]/h3
    ${badge}=  Get Text  xpath:/html/body/main/div/div[3]/div/div[2]/div[2]/div[2]/div/div[1]/div/p
    Should Be Equal	${title}	${card title text}
    Should Be Equal	${badge}	${card badge title text}

    # Validate bullets content
    ${bullet 0 text}=  Get Text  xpath:/html/body/main/div/div[3]/div/div[2]/div[2]/div[2]/div/ul/li[1]/p
    Should Be Equal	${bullet 0 text}	${card bullet 0 text}

    ${bullet 1 text}=  Get Text  xpath:/html/body/main/div/div[3]/div/div[2]/div[2]/div[2]/div/ul/li[2]/p
    Should Be Equal	${bullet 1 text}	${card bullet 1 text}

    ${bullet 2 text}=  Get Text  xpath:/html/body/main/div/div[3]/div/div[2]/div[2]/div[2]/div/ul/li[3]/p
    Should Be Equal	${bullet 2 text}	${card bullet 2 text}

    # Validate subtitle content
    ${subtitle text}=  Get Text  xpath:/html/body/main/div/div[3]/div/div[2]/div[2]/div[2]/div/div[2]/div/span
    Should Be Equal	${subtitle text}	${card subtitle text}

    # Validate icon access
    Element Attribute Value Should Be   xpath:/html/body/main/div/div[3]/div/div[2]/div[2]/div[2]/div/div[2]/div/img    src    ${card bank logo}

    # Validate button content
    ${button text}=  Get Text  xpath:/html/body/main/div/div[3]/div/div[2]/div[2]/div[2]/div/div[3]/div/a/span
    Should Be Equal	${button text}	${card button vpp text}
    Element Attribute Value Should Be   xpath:/html/body/main/div/div[3]/div/div[2]/div[2]/div[2]/div/div[3]/div/a    href    ${card button link}
    Element Attribute Value Should Be   xpath:/html/body/main/div/div[3]/div/div[2]/div[2]/div[2]/div/div[3]/div/a    target    ${card button target}

Credits click off card should be present and has the right content for web vip

    # Validate card title and badge content
    ${title text}=  Get Text  xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[3]/div/p
    ${title}=   get line    ${title text}   0
    ${badge}=   get line    ${title text}   1
    Should Be Equal	${title}	${card title text}
    Should Be Equal	${badge}	${card badge title text}

    # Validate bullets content
    ${bullet 0 text}=  Get Text  xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[3]/div/ul/li[1]
    Should Be Equal	${bullet 0 text}	${card bullet 0 text}

    ${bullet 1 text}=  Get Text  xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[3]/div/ul/li[2]
    Should Be Equal	${bullet 1 text}	${card bullet 1 text}

    ${bullet 2 text}=  Get Text  xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[3]/div/ul/li[3]
    Should Be Equal	${bullet 2 text}	${card bullet 2 text}

    # Validate subtitle content
    ${subtitle text}=  Get Text  xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[3]/div/div/div[1]
    Should Be Equal	${subtitle text}	${card subtitle text}

    # Validate icon access
    Element Attribute Value Should Be   xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[3]/div/div/div[2]/img    src    ${card bank logo}

    # Validate button content
    ${button text}=  Get Text  xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[3]/div/a
    Should Be Equal	${button text}	${card button web vip text}
    Element Attribute Value Should Be   xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[3]/div/a    href    ${card button link}
    Element Attribute Value Should Be   xpath:/html/body/main/div/div[1]/div[2]/div[1]/section[3]/div/a    target    ${card button target}