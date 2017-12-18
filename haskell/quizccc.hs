import Textos


-- Definindo tipos
type Posicao = (Int, Int)
--type Pergunta = (String, String, Int)
--type Celula = (Int, Pergunta)

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

data Pergunta = Pergunta { texto :: String,
     alternativas :: String,
     resposta :: Int
}

data Celula = Celula { value :: Int,
    pergunta :: Pergunta
}

-- Inicialmente salvei tema e nivel dentro da funcao, precisamos ver como
-- utilizar isso pras demais funcoes
showMenu = do
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
