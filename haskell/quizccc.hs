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

exibirPergunta :: Int -> Int -> Int -> Int-> [Pergunta] -> IO()
exibirPergunta i  nivel score vida lista = do
     putStrLn  (texto (lista!!i))
     putStrLn  (alternativas (lista!!i))
     escolha <- getLine
     if read(escolha) == (resposta (lista!!i)) then do
        let scoreTotal = incrementaScore nivel score
        putStrLn "Parabens!"
     else do
        let vidaAtual = decrementaLife vida
        putStrLn  ("Voce errou! A resposta correta eh a alternativa:" ++(alternativas (lista!!i)))
        putStrLn ("Quantidade de vidas: " ++show(vidaAtual))

perguntasN1 :: Array Int Pergunta
perguntasN1 = array (1,25) [(1, Pergunta {texto = "Ratos sentem cocegas. Essa afirmacao eh:", alternativas = "1.Verdadeira \n2.Falso", resposta = 1}), 
    (2, Pergunta {texto = "Alguns anfibios saltam distancias que correspondem a no maximo 50 vezes o seu tamanho. Essa afirmacao eh:", alternativas = "1.Verdadeira \n2.Falso", resposta = 2}),
    (3, Pergunta {texto = "As cabras tem sotaques diferentes. Essa afirmacao eh:", alternativas = "1.Verdadeira \n2.Falso", resposta = 1}),
    (4, Pergunta {texto = "Quantas picadas um Pica-Pau da por minuto?", alternativas = "1.100 \n2.1000 \n3.200 \n4.500", resposta = 1}),
    (5, Pergunta {texto = "Com quantos narizes as formigas sao equipadas?", alternativas = "1. 2 \n2. 5 \n3. 4 \n4. 0", resposta = 2}),
    (6, Pergunta {texto = "Os Golfinhos dao nomes uns aos outros. Essa afirmacao eh:", alternativas = "1.Verdadeira \n2.Falso", resposta = 1}),
    (7, Pergunta {texto = "Qual animal pode correr mais rapido do que um cavalo?", alternativas = "1.Gato \n2.Cachorro \n3.Barata \n4.Urso", resposta = 4}),
    (8, Pergunta {texto = "Qual animal tem o coice mais poderoso?", alternativas = "1.Zebra \n2.Cavalo \n3.Girafa \n4.Vaca", resposta = 3})]
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
