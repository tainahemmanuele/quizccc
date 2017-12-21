module Perguntas
(
preenchePerguntasNivelUm,
preenchePerguntasNivelDois,
preenchePerguntasNivelTres
)where

data Pergunta = Pergunta { texto :: [Char],
     alternativas :: [Char],
     resposta :: Int
}

preenchePerguntasNivelUm :: [Pergunta]
preenchePerguntasNivelUm = [
    Pergunta "Ratos sentem cocegas. Essa afirmacao eh:" "1.Verdadeira \n2.Falso" 1,
    Pergunta "Alguns anfibios saltam distancias que correspondem a no maximo 50 vezes o seu tamanho. Essa afirmacao eh:" "1.Verdadeira \n2.Falso" 2,
    Pergunta "As cabras tem sotaques diferentes. Essa afirmacao eh:" "1.Verdadeira \n2.Falso" 1,
    Pergunta "Quantas picadas um Pica-Pau da por minuto?" "1.100 \n2.1000 \n3.200 \n4.500" 1,
    Pergunta "Com quantos narizes as formigas sao equipadas?" "1. 2 \n2. 5 \n3. 4 \n4. 0" 2,
    Pergunta "Os Golfinhos dao nomes uns aos outros. Essa afirmacao eh:" "1.Verdadeira \n2.Falso" 1,
    Pergunta "Qual animal pode correr mais rapido do que um cavalo?" "1.Gato \n2.Cachorro \n3.Barata \n4.Urso" 4,
    Pergunta "Qual animal tem o coice mais poderoso?" "1.Zebra \n2.Cavalo \n3.Girafa \n4.Vaca" 3,
    Pergunta "Quanto pesa um Urso Malaio?" "1. 15 a 25 Kg \n2. 25 a 45 Kg \n3.65 a 95 Kg \n4. 95 a 105 Kg" 2,
    Pergunta "Qual o animal terrestre eh mais barulhento?" "1.Hiena \n2.Bugio \n3.Porco \n4.Leao" 2,
    Pergunta "Quais destes animais nao sao todos insetos?" "1. Mosca, formiga e michoca \n2. Joaninha, aranha e formiga \n3. Abelha, pulga e escorpiao \n4. Escorpiao, aranha e tatu-bolinha" 4,
    Pergunta "Quais destes animais sao herbivoros?" "1. Coala, cavalo e coelho \n2.Tigre, macaco e tubarao \n3.Vaca, leao e lince \n4.Cavalo, pato e onca" 1,
    Pergunta "Sarcophilus harrisii eh o nome cientifico de qual animal?" "1. Tamandua-bandeira \n2. Peixe-boi \n3. Diabo-da-tasmania \n4. Leao" 3,
    Pergunta "Qual outro nome a abelha-rainha tambem eh conhecida?" "1. Abelha-governadora \n2. Abelha-mestra \n3. Abelha-maior \n4. Abelha-mae" 2,
    Pergunta "Por que a abelha operaria morre apos picar alguem?" "1. Porque ela perde suas asas \n2. Porque quando o ferrao se solta ela perde parte posterior do abdomem \n3. Porque ela injeta seu proprio veneno nela \n4. N.D.A" 2,
    Pergunta "Qual foi o primeiro mamifero a ser clonado?" "1. Cachorro \n2. Carneiro \n3. Ovelha \n4. Elefante" 3,
    Pergunta "Qual destes animais eh o unico mamifero capaz de voar?" "1. Esquilo \n2. Morcego \n3. Demonio da tazmania \n4. Passarinho" 2,
    Pergunta "Qual destes eh um reptil?" "1. Mosca \n2. Leopardo \n3. Larico \n4. N.D.A" 4,
    Pergunta "Qual alternativa a seguir so possui apenas insetos?" "1. Borboleta, Louva-a-Deus, Carrapato e Mosquito. \n2. Bicho-Pau, Acaro, Barata e Grilo. \n3. Centopeia, Formiga, Mosca e Borboleta. \n4. Mosquito, Formiga, Borboleta e Barata." 4,
    Pergunta "Qual o inseto mais forte do mundo?" "1. Escaravelho \n2. Besouro-Rinoceronte \n3. Barata-Pata-De-Leao \n4. Louva-a-Deus" 2,
    Pergunta "Na Antartida nao ha repteis. Essa afirmacao eh verdadeira ou falsa?" "1. Verdadeira \n2. Falsa" 1,
    Pergunta "Exemplos de Aracnideos:" "1. Grilo,minhoca e Aranha \n2. Centopeia, Escorpiao e Barata \n3. Aranha,Escorpiao e Grilo \n4. Acaro, Carrapato e Aranha" 4,
    Pergunta "Quanto tempo dura a gestacao de uma vaca?" "1. 9 meses \n2. 10 meses \n3. 4 meses \n4. 12 meses" 1,
    Pergunta "Qual eh o animal terrestre mais alto do mundo?" "1. Elefante \n2. Girafa \n3. Zebra \n4. Macaco" 2,
    Pergunta "Qual eh o animal mais pesado do mundo?" "1. Baleia-Azul \n2. Elefante \n3. Rinoceronte \n4. Hipopotamo" 1]

preenchePerguntasNivelDois :: [Pergunta]
preenchePerguntasNivelDois = [
    Pergunta "Quantos anos vive um Cavalo?" "1. 20 anos \n2. 30 anos \n3. 50 anos \n4. 45 anos" 1,
    Pergunta "Qual eh o maior tubarao?" "1. Tubarao-Branco \n2. Tubarao-Tigre \n3. Tubarao-Baleia \n4. Tubarao-Serra" 3,
    Pergunta "Qual eh o animal terrestre mais rapido do mundo?" "1. Leopardo \n2. Cavalo \n3. Tigre \n4. Guepardo" 4,
    Pergunta "Qual eh o animal terrestre mais alto do mundo?" "1. Elefante \n2. Girafa \n3. Zebra \n4. Macaco" 2,
    Pergunta "Qual eh o animal mais pesado do mundo?" "1. Baleia-Azul \n2. Elefante \n3. Rinoceronte \n4. Hipopotamo" 1,
    Pergunta "Qual animal a seguir eh o mais lento?" "1. Tartaruga \n2. Leao \n3. Rinoceronte \n4. Lesma" 4,
    Pergunta "Qual passaro consegue parar no ar?" "1. Pardal \n2. Andorinha \n3. Tico-Tico \n4. Beija-Flor" 4,
    Pergunta "Qual eh o peixe mais voraz?" "1. Lambari \n2. Carca \n3. Tilapia \n4.Piranha" 4,
    Pergunta "Qual desses mamiferos nao consegue pular?" "1. Elefante \n2. Golfinho \n3. Foca \n4. Prequica" 1,
    Pergunta "O guecko eh um tipo de?" "1.Peixe \n2.Lagarto \n3.Mamifero \n4.Inseto" 2,
    Pergunta "Qual eh a diferenca entre viviparos e oviparos" "1. Viviparo eh o animal que nasce do utero da mae, ovipararo eh o animal que nasce do ovo que a mae bota. \n2. Viviparo eh o animal que nasce do ovo que a mae bota, oviparo eh o animal que nasce do utero da mae" 1,
    Pergunta "O narval eh um tipo de:" "1. Peixe \n2. Cobra \n3. Aracnideo \n4. Baleia" 4,
    Pergunta "Qual eh a alternativa correta?" "1. O maior animal do mundo eh a formiga. \n2. Os peixes sao animais invertebrados e de sangue frio. \n3. Existem cerca de 5 mil especies diferentes de mamiferos. \n4. O tamandua tem uma lingua pequena." 3,
    Pergunta "A pele dos repteis sao:" "1. Seca, grossa e impermeavel. \n2. Fofa, rosa e macia. \n3. Peluda, verde e brilhante. \n4. Lisa, colorida e feia." 1,
    Pergunta "Qual eh o unico animal que pode se queimar se for exposto ao sol?" "1. Elefante \n2. Porco \n3. Rato \n4. Rinoceronte" 2,
    Pergunta "Se um peixe dourado for colocado em um local escuro ficara branco. Essa afirmacao eh verdadeira ou falsa?" "1. Verdadeira \n2. Falso" 1,
    Pergunta "Os lagartos e jacares, quando sao atacados na cauda, desprendem-as para poder escapar. Verdadeiro ou falso?" "1. Verdadeira \n 2. Falso" 2,
    Pergunta "A especie de peixe Lambari sao uma das mais agressivas que existem. Verdadeiro ou falso?" "1. Verdadeira \n 2. Falso" 2,
    Pergunta "As moscas comuns podem viver por aproximadamente quanto tempo?" "1. 2 meses \n 2. 1 dia \n 3. 2 dias \n 4. 1 semana" 1,
    Pergunta "Os olhos de um hamster podem cair se pendurados de cabeca para baixo. Verdadeiro ou falso?" "1. Verdadeiro \n 2. Falso" 1,
    Pergunta "Os cangurus nao sao capazes de andar para tras. Verdadeiro ou falso?" "1. Verdadeiro \n 2. Falso" 1,
    Pergunta "As borboletas sentem o gosto com os pes. Essa afirmacao eh verdadeira ou falsa?" "1. Verdadeira \n2. Falsa" 1,
    Pergunta "Qual destes eh um reptil?" "1. Mosca \n2. Leopardo \n3. Larico \n4. N.D.A" 4,
    Pergunta "Qual alternativa a seguir so possui apenas insetos?" "1. Borboleta, Louva-a-Deus, Carrapato e Mosquito. \n2. Bicho-Pau, Acaro, Barata e Grilo. \n3. Centopeia, Formiga, Mosca e Borboleta. \n4. Mosquito, Formiga, Borboleta e Barata." 4,
    Pergunta "Qual o inseto mais forte do mundo?" "1. Escaravelho \n2. Besouro-Rinoceronte \n3. Barata-Pata-De-Leao \n4. Louva-a-Deus" 2 ]

preenchePerguntasNivelTres :: [Pergunta]
preenchePerguntasNivelTres = [
    Pergunta "Se um peixe dourado for colocado em um local escuro ficara branco. Essa afirmacao eh verdadeira ou falsa?" "1. Verdadeira \n2. Falso" 1,
    Pergunta "Os lagartos e jacares, quando sao atacados na cauda, desprendem-as para poder escapar. Verdadeiro ou falso?" "1. Verdadeira \n2. Falso" 2,
    Pergunta "A especie de peixe Lambari sao uma das mais agressivas que existem. Verdadeiro ou falso?" "1. Verdadeira \n2. Falso" 2,
    Pergunta "As moscas comuns podem viver por aproximadamente quanto tempo?" "1. 2 meses \n2. 1 dia \n3. 2 dias \n4. 1 semana" 1,
    Pergunta "Os olhos de um hamster podem cair se pendurados de cabeca para baixo. Verdadeiro ou falso?" "1. Verdadeiro \n2. Falso" 1,
    Pergunta "Os cangurus nao sao capazes de andar para tras. Verdadeiro ou falso?" "1. Verdadeiro \n2. Falso" 1,
    Pergunta "As borboletas sentem o gosto com os pes. Essa afirmacao eh verdadeira ou falsa?" "1. Verdadeira \n2. Falsa" 1,
    Pergunta "Qual destes eh um reptil?" "1. Mosca \n2. Leopardo \n3. Larico \n4. N.D.A" 4,
    Pergunta "Qual alternativa a seguir so possui apenas insetos?" "1. Borboleta, Louva-a-Deus, Carrapato e Mosquito. \n2. Bicho-Pau, Acaro, Barata e Grilo. \n3. Centopeia, Formiga, Mosca e Borboleta. \n4. Mosquito, Formiga, Borboleta e Barata." 4,
    Pergunta "Qual o inseto mais forte do mundo?" "1. Escaravelho \n2. Besouro-Rinoceronte \n3. Barata-Pata-De-Leao \n4. Louva-a-Deus" 2,
    Pergunta "Na Antartida nao ha repteis. Essa afirmacao eh verdadeira ou falsa?" "1. Verdadeira \n2. Falsa" 1,
    Pergunta "Exemplos de Aracnideos:" "1. Grilo,minhoca e Aranha \n2. Centopeia, Escorpiao e Barata \n3. Aranha,Escorpiao e Grilo \n4. Acaro, Carrapato e Aranha" 4,
    Pergunta "Quanto tempo dura a gestacao de uma vaca?" "1. 9 meses \n2. 10 meses \n3. 4 meses \n4. 12 meses" 1,
    Pergunta "Qual eh o animal terrestre mais alto do mundo?" "1. Elefante \n2. Girafa \n3. Zebra \n4. Macaco" 2,
    Pergunta "Qual eh o animal mais pesado do mundo?" "1. Baleia-Azul \n2. Elefante \n3. Rinoceronte \n4. Hipopotamo" 1,
    Pergunta "Qual animal a seguir eh o mais lento?" "1. Tartaruga \n2. Leao \n3. Rinoceronte \n4. Lesma" 4,
    Pergunta "Qual passaro consegue parar no ar?" "1. Pardal \n2. Andorinha \n3. Tico-Tico \n4. Beija-Flor" 4,
    Pergunta "Qual eh o peixe mais voraz?" "1. Lambari \n2. Carca \n3. Tilapia \n4.Piranha" 4,
    Pergunta "Qual desses mamiferos nao consegue pular?" "1. Elefante \n2. Golfinho \n3. Foca \n4. Prequica" 1,
    Pergunta "O guecko eh um tipo de?" "1.Peixe \n2.Lagarto \n3.Mamifero \n4.Inseto" 2,
    Pergunta "Qual eh a diferenca entre viviparos e oviparos" "1. Viviparo eh o animal que nasce do utero da mae, ovipararo eh o animal que nasce do ovo que a mae bota. \n2. Viviparo eh o animal que nasce do ovo que a mae bota, oviparo eh o animal que nasce do utero da mae" 1,
    Pergunta "O narval eh um tipo de:" "1. Peixe \n2. Cobra \n3. Aracnideo \n4. Baleia" 4,
    Pergunta "Qual eh a alternativa correta?" "1. O maior animal do mundo eh a formiga. \n2. Os peixes sao animais invertebrados e de sangue frio. \n3. Existem cerca de 5 mil especies diferentes de mamiferos. \n4. O tamandua tem uma lingua pequena." 3,
    Pergunta "A pele dos repteis sao:" "1. Seca, grossa e impermeavel. \n2. Fofa, rosa e macia. \n3. Peluda, verde e brilhante. \n4. Lisa, colorida e feia." 1,
    Pergunta "Qual eh o unico animal que pode se queimar se for exposto ao sol?" "1. Elefante \n2. Porco \n3. Rato \n4. Rinoceronte" 2
    ]
