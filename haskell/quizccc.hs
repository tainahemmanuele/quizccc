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
