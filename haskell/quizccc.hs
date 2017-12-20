import Textos
import Data.Array


-- Definindo tipos
--type Posicao = (Int, Int)
--type Pergunta = (String, String, Int)
--type Celula = (Int, Pergunta)

type Tabuleiro = Array Posicao Celula

main = do
    Textos.textoInicial
    Textos.textoObjetivo
    Textos.textoFinal


qtdBuracos :: Int -> Int
qtdBuracos x |x==1 = 8
     |x == 2 = 10
     |x == 3 = 12

incrementaScore :: Int -> Int -> Int
incrementaScore x  y| x == 1 = y+50
     | x == 2 = y + 100
     | x == 3 = y + 150

decrementaLife :: Int -> Int
decrementaLife x | x == 0 = -1
     |otherwise  = x -1

--Falta terminar a funcao
verificaSeEhPossivelCaminhar :: Posicao -> Bool
verificaSeEhPossivelCaminhar pos |(posX pos < 0 ||  posX pos> 4) || (posY pos< 0 || posY pos> 4) = False
     --tabuleiro[pos.posX][pos.posY].value == -1 = False
     |otherwise = True


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
