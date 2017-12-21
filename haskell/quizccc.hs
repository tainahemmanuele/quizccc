import Textos
import Data.Array


-- Definindo tipos
--type Posicao = (Int, Int)
--type Pergunta = (String, String, Int)
--type Celula = (Int, Pergunta)

type Tabuleiro = Array Posicao Celula

data Pergunta = Pergunta { texto :: String,
     alternativas :: String,
     resposta :: Int
}

data Celula = Celula { value :: Int,
    pergunta :: Pergunta
}

data Posicao  = Posicao { posX :: Int,
    posY:: Int
}

main = do
    Textos.textoInicial
    Textos.textoObjetivo
    Textos.textoFinal

qtdBuracos :: Int -> Int
qtdBuracos nivel |nivel ==1 = 8
     |nivel == 2 = 10
     |nivel == 3 = 12

incrementaScore :: Int -> Int -> Int
incrementaScore nivel score| nivel == 1 = score+50
     |nivel == 2 = score + 100
     |nivel  == 3 = score + 150

decrementaLife :: Int -> Int
decrementaLife vida | vida == 0 = -1
     |otherwise  = vida -1

--Falta terminar a funcao
verificaSeEhPossivelCaminhar :: Posicao -> Bool
verificaSeEhPossivelCaminhar pos |(posX pos < 0 ||  posX pos> 4) || (posY pos< 0 || posY pos> 4) = False
     --tabuleiro[pos.posX][pos.posY].value == -1 = False
     |otherwise = True

exibirPergunta :: Int -> Int -> Int -> Int-> Array Int Pergunta -> IO()
exibirPergunta i  nivel score vida lista = do
     putStrLn  (texto (lista!i))
     putStrLn  (alternativas (lista!i))
     escolha <- getLine
     if read(escolha) == (resposta (lista!i)) then do
        let scoreTotal = incrementaScore nivel score
        putStrLn "Parabens!"
     else do
        let vidaAtual = decrementaLife vida
        putStrLn  ("Voce errou! A resposta correta eh a alternativa:" ++(alternativas (lista!i)))
        putStrLn ("Quantidade de vidas: " ++show(vidaAtual))

perguntasN1Animais :: Array Int Pergunta
perguntasN1Animais = array (1,25) [(1, Pergunta {texto = "Ratos sentem cocegas. Essa afirmacao eh:", alternativas = "1.Verdadeira \n2.Falso", resposta = 1}), 
    (2, Pergunta {texto = "Alguns anfibios saltam distancias que correspondem a no maximo 50 vezes o seu tamanho. Essa afirmacao eh:", alternativas = "1.Verdadeira \n2.Falso", resposta = 2}),
    (3, Pergunta {texto = "As cabras tem sotaques diferentes. Essa afirmacao eh:", alternativas = "1.Verdadeira \n2.Falso", resposta = 1}),
    (4, Pergunta {texto = "Quantas picadas um Pica-Pau da por minuto?", alternativas = "1.100 \n2.1000 \n3.200 \n4.500", resposta = 1}),
    (5, Pergunta {texto = "Com quantos narizes as formigas sao equipadas?", alternativas = "1. 2 \n2. 5 \n3. 4 \n4. 0", resposta = 2}),
    (6, Pergunta {texto = "Os Golfinhos dao nomes uns aos outros. Essa afirmacao eh:", alternativas = "1.Verdadeira \n2.Falso", resposta = 1}),
    (7, Pergunta {texto = "Qual animal pode correr mais rapido do que um cavalo?", alternativas = "1.Gato \n2.Cachorro \n3.Barata \n4.Urso", resposta = 4}),
    (8, Pergunta {texto = "Qual animal tem o coice mais poderoso?", alternativas = "1.Zebra \n2.Cavalo \n3.Girafa \n4.Vaca", resposta = 3}),
    (9, Pergunta {texto = "Quanto pesa um Urso Malaio?", alternativas = "1. 15 a 25 Kg \n2. 25 a 45 Kg \n3.65 a 95 Kg \n4. 95 a 105 Kg", resposta = 2}),
    (10, Pergunta {texto = "Qual o animal terrestre eh mais barulhento?", alternativas = "1.Hiena \n2.Bugio \n3.Porco \n4.Leao", resposta = 2}),
    (11, Pergunta {texto = "Quais destes animais nao sao todos insetos?", alternativas = "1. Mosca, formiga e michoca \n2. Joaninha, aranha e formiga \n3. Abelha, pulga e escorpiao \n4. Escorpiao, aranha e tatu-bolinha", resposta = 4}),
    (12, Pergunta {texto = "Quais destes animais sao herbivoros?", alternativas = "1. Coala, cavalo e coelho \n2.Tigre, macaco e tubarao \n3.Vaca, leao e lince \n4.Cavalo, pato e onca", resposta = 1}),
    (13, Pergunta {texto = "Sarcophilus harrisii eh o nome cientifico de qual animal?", alternativas = "1. Tamandua-bandeira \n2. Peixe-boi \n3. Diabo-da-tasmania \n4. Leao", resposta = 3}),
    (14, Pergunta {texto = "Qual outro nome a abelha-rainha tambem eh conhecida?", alternativas =  "1. Abelha-governadora \n2. Abelha-mestra \n3. Abelha-maior \n4. Abelha-mae", resposta = 2}),
    (15, Pergunta {texto = "Por que a abelha operaria morre apos picar alguem?", alternativas =  "1. Porque ela perde suas asas \n2. Porque quando o ferrao se solta ela perde parte posterior do abdomem \n3. Porque ela injeta seu proprio veneno nela \n4. N.D.A", resposta = 2}),
    (16, Pergunta {texto = "Qual foi o primeiro mamifero a ser clonado?", alternativas =  "1. Cachorro \n2. Carneiro \n3. Ovelha \n4. Elefante", resposta = 3}),
    (17, Pergunta {texto = "Qual destes animais eh o unico mamifero capaz de voar?", alternativas =  "1. Esquilo \n2. Morcego \n3. Demonio da tazmania \n4. Passarinho", resposta = 2}),
    (18, Pergunta {texto = "Qual destes eh um reptil?", alternativas =  "1. Mosca \n2. Leopardo \n3. Larico \n4. N.D.A", resposta = 4}),
    (19, Pergunta {texto = "Qual alternativa a seguir so possui apenas insetos?", alternativas = "1. Borboleta, Louva-a-Deus, Carrapato e Mosquito. \n2. Bicho-Pau, Acaro, Barata e Grilo. \n3. Centopeia, Formiga, Mosca e Borboleta. \n4. Mosquito, Formiga, Borboleta e Barata.", resposta = 4}),
    (20, Pergunta {texto = "Qual o inseto mais forte do mundo?", alternativas =  "1. Escaravelho \n2. Besouro-Rinoceronte \n3. Barata-Pata-De-Leao \n4. Louva-a-Deus", resposta = 2}),
    (21, Pergunta {texto = "Na Antartida nao ha repteis. Essa afirmacao eh verdadeira ou falsa?", alternativas =  "1. Verdadeira \n2. Falsa", resposta = 1}),
    (22, Pergunta {texto = "Exemplos de Aracnideos:", alternativas =   "1. Grilo,minhoca e Aranha \n2. Centopeia, Escorpiao e Barata \n3. Aranha,Escorpiao e Grilo \n4. Acaro, Carrapato e Aranha", resposta = 4}),
    (23, Pergunta {texto = "Quanto tempo dura a gestacao de uma vaca?", alternativas = "1. 9 meses \n2. 10 meses \n3. 4 meses \n4. 12 meses", resposta = 1}),
    (24, Pergunta {texto = "Qual eh o animal terrestre mais alto do mundo?", alternativas = "1. Elefante \n2. Girafa \n3. Zebra \n4. Macaco", resposta = 2}),
    (25, Pergunta {texto = "Qual eh o animal mais pesado do mundo?", alternativas = "1. Baleia-Azul \n2. Elefante \n3. Rinoceronte \n4. Hipopotamo", resposta = 1})]
    
-- Inicialmente salvei tema e nivel dentro da funcao, precisamos ver como
-- utilizar isso pras demais funcoes
showMenu = do
    --let tabuleiro = array ((1,1)(5,5)) 
    putStrLn "\n"
    putStrLn "Indique o numero correspondente ao tema que voce deseja jogar:"
    putStrLn "\n"
    putStrLn "1 - Animais\n"
    -- Lembrando que falta criar perguntas para os temas seguintes,
    -- e analisar a sugestao da prof de adicionar temas de PLP
    putStrLn "2 - Comida\n"
    putStrLn "3 - Esportes\n"
    
    tema <- getLine
    
    putStrLn "\n"
    putStrLn "Indique o numero correspondente ao nivel desejado"
    putStrLn "\n"
    -- Tambem precisamos analisar como separar as perguntas por niveis
    putStrLn "1 - Facil\n"
    putStrLn "2 - Medio\n"
    putStrLn "3 - Dificil\n"
    
    nivel <- getLine

    putStrLn "\n"
    putStrLn "Excelente, agora vamos iniciar o jogo\n"
