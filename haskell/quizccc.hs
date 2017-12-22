import Data.Array
import Data.Matrix
import Textos
import System.Random

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
    showMenu
    jogar (criarMatriz) 1 1 0 3

qtdBuracos :: Int -> Int
qtdBuracos nivel |nivel ==1 = 8
     |nivel == 2 = 10
     |nivel == 3 = 12

incrementaScore :: Int -> Int -> Int
incrementaScore nivel score| nivel == 1 = score+50
     |nivel == 2 = score + 100
     |nivel  == 3 = score + 150
     
criarMatriz :: Matrix [Char]
criarMatriz = fromLists tabuleiro

tabuleiro = [
    ["X", "X", "X", "X", "X"],
    ["X", "X", "X", "X", "X"],
    ["X", "X", "X", "X", "X"],
    ["X", "X", "X", "X", "X"],
    ["X", "X", "X", "X", "X"]]

decrementaLife vida | vida == 0 = -1
     |otherwise  = vida -1

--Falta terminar a funcao
verificaSeEhPossivelCaminhar :: Posicao -> Bool
verificaSeEhPossivelCaminhar pos |(posX pos < 0 ||  posX pos> 4) || (posY pos< 0 || posY pos> 4) = False
     --tabuleiro[pos.posX][pos.posY].value == -1 = False
     |otherwise = True

exibirPergunta :: Int -> Int -> Int -> Int-> [Pergunta] -> IO()
exibirPergunta i  nivel score vida lista = do
     putStrLn  (texto (lista!!i))
     putStrLn  (alternativas (lista!!i))
     putStrLn "Escolha uma alternativa: "
     escolha <- getLine
     if read(escolha) == (resposta (lista!!i)) then do
        let scoreTotal = incrementaScore nivel score
        putStrLn "Parabens!"
     else do
        let vidaAtual = decrementaLife vida
        putStrLn  ("Voce errou! A resposta correta eh a alternativa:" ++(alternativas (lista!!i)))
        putStrLn ("Quantidade de vidas: " ++show(vidaAtual))

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

perguntas =
   [("Ratos sentem cocegas. Essa afirmacao eh: 1.Verdadeira \n2.Falso", 1),
   ("Alguns anfibios saltam distancias que correspondem a no maximo 50 vezes o seu tamanho. Essa afirmacao eh: 1.Verdadeira \n2.Falso", 2),
   ("As cabras tem sotaques diferentes. Essa afirmacao eh: 1.Verdadeira \n2.Falso", 1),
   ("Quantas picadas um Pica-Pau da por minuto? 1.100 \n2.1000 \n3.200 \n4.500", 1),
   ("Com quantos narizes as formigas sao equipadas? 1. 2 \n2. 5 \n3. 4 \n4. 0", 2),
   ("Os Golfinhos dao nomes uns aos outros. Essa afirmacao eh: 1.Verdadeira \n2.Falso", 1),
   ("Qual animal pode correr mais rapido do que um cavalo? 1.Gato \n2.Cachorro \n3.Barata \n4.Urso", 4),
   ("Qual animal tem o coice mais poderoso? 1.Zebra \n2.Cavalo \n3.Girafa \n4.Vaca", 3),
   ("Quanto pesa um Urso Malaio? 1. 15 a 25 Kg \n2. 25 a 45 Kg \n3.65 a 95 Kg \n4. 95 a 105 Kg", 2),
   ("Qual o animal terrestre eh mais barulhento? 1.Hiena \n2.Bugio \n3.Porco \n4.Leao", 2),
   ("Quais destes animais nao sao todos insetos? 1. Mosca, formiga e michoca \n2. Joaninha, aranha e formiga \n3. Abelha, pulga e escorpiao \n4. Escorpiao, aranha e tatu-bolinha", 4),
   ("Quais destes animais sao herbivoros? 1. Coala, cavalo e coelho \n2.Tigre, macaco e tubarao \n3.Vaca, leao e lince \n4.Cavalo, pato e onca", 1),
   ("Sarcophilus harrisii eh o nome cientifico de qual animal? 1. Tamandua-bandeira \n2. Peixe-boi \n3. Diabo-da-tasmania \n4. Leao", 3),
   ("Qual outro nome a abelha-rainha tambem eh conhecida? 1. Abelha-governadora \n2. Abelha-mestra \n3. Abelha-maior \n4. Abelha-mae", 2),
   ("Por que a abelha operaria morre apos picar alguem? 1. Porque ela perde suas asas \n2. Porque quando o ferrao se solta ela perde parte posterior do abdomem \n3. Porque ela injeta seu proprio veneno nela \n4. N.D.A", 2),
   ("Qual foi o primeiro mamifero a ser clonado? 1. Cachorro \n2. Carneiro \n3. Ovelha \n4. Elefante", 3),
   ("Qual destes animais eh o unico mamifero capaz de voar? 1. Esquilo \n2. Morcego \n3. Demonio da tazmania \n4. Passarinho", 2),
   ("Qual destes eh um reptil? 1. Mosca \n2. Leopardo \n3. Larico \n4. N.D.A", 4),
   ( "Qual alternativa a seguir so possui apenas insetos? 1. Borboleta, Louva-a-Deus, Carrapato e Mosquito. \n2. Bicho-Pau, Acaro, Barata e Grilo. \n3. Centopeia, Formiga, Mosca e Borboleta. \n4. Mosquito, Formiga, Borboleta e Barata.", 4),
   ( "Qual o inseto mais forte do mundo? 1. Escaravelho \n2. Besouro-Rinoceronte \n3. Barata-Pata-De-Leao \n4. Louva-a-Deus", 2),
   ( "Na Antartida nao ha repteis. Essa afirmacao eh verdadeira ou falsa? 1. Verdadeira \n2. Falsa", 1),
   ( "Exemplos de Aracnideos: 1. Grilo,minhoca e Aranha \n2. Centopeia, Escorpiao e Barata \n3. Aranha,Escorpiao e Grilo \n4. Acaro, Carrapato e Aranha", 4),
   ( "Quanto tempo dura a gestacao de uma vaca? 1. 9 meses \n2. 10 meses \n3. 4 meses \n4. 12 meses", 1),
   ( "Qual eh o animal terrestre mais alto do mundo? 1. Elefante \n2. Girafa \n3. Zebra \n4. Macaco", 2),
   ( "Qual eh o animal mais pesado do mundo? 1. Baleia-Azul \n2. Elefante \n3. Rinoceronte \n4. Hipopotamo", 1)]

jogar :: Matrix [Char] -> Int -> Int -> Int -> Int -> IO()
jogar matriz 5 y jogadas vidas = putStrLn "Você venceu, parabéns!"
jogar matriz x 5 jogadas vidas = putStrLn "Você venceu, parabéns!"
jogar matriz x y jogadas 0 = putStrLn "Poxa, você perdeu!"
jogar matriz 2 1 jogadas vidas = putStrLn "Buraco! Você perdeu!"
jogar matriz 2 2 jogadas vidas = putStrLn "Buraco! Você perdeu!"
jogar matriz 3 4 jogadas vidas = putStrLn "Buraco! Você perdeu!"
jogar matriz 4 3 jogadas vidas = putStrLn "Buraco! Você perdeu!"
jogar matriz 3 5 jogadas vidas = putStrLn "Buraco! Você perdeu!"
jogar matriz 4 2 jogadas vidas = putStrLn "Buraco! Você perdeu!"
jogar matriz 4 5 jogadas vidas = putStrLn "Buraco! Você perdeu!"
jogar matriz posx posy jogada vidas = do
        print matriz
        putStrLn "Você quer ir para \n 1 - Esquerda \n 2 - Direita\n 3 - Baixo\n"
        putStrLn "Selecione a opção: "
        opcao <- getLine
        if opcao == "1" then do
            let matrizNova = setElem " " (posx, posy - 1) matriz
            putStrLn $ fst (perguntas!!jogada)
            resposta <- getLine
            if (read resposta) == snd (perguntas!!jogada) then do
                jogar matrizNova posx (posy - 1) (jogada + 1) vidas
            else do
                putStrLn "Você errou!!!"
                jogar matrizNova posx (posy - 1) (jogada + 1) $ decrementaLife vidas
        else if opcao == "2" then do
            let matrizNova = setElem " " (posx, posy + 1) matriz
            putStrLn $ fst (perguntas!!jogada)
            resposta <- getLine
            if (read resposta) == snd (perguntas!!jogada) then do
                jogar matrizNova posx (posy + 1) (jogada + 1) vidas
            else do
                putStrLn "Você errou!!!"
                jogar matrizNova posx (posy + 1) (jogada + 1) $ decrementaLife vidas
        else do
            let matrizNova = setElem " " (posx + 1, posy) matriz
            putStrLn $ fst (perguntas!!jogada)
            resposta <- getLine
            if (read resposta) == snd (perguntas!!jogada) then do
                jogar matrizNova (posx + 1) posy (jogada + 1) vidas
            else do
                putStrLn "Você errou!!!"
                jogar matrizNova (posx + 1) posy (jogada + 1) $ decrementaLife vidas
