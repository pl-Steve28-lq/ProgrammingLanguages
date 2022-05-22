import Data.Char
import Data.Map (Map)
import qualified Data.Map as Map

bF :: String -> Int -> String
bF code size = map chr (snd (bFData code size))

bFData :: String -> Int -> ([Int], [Int])
bFData "" size = ((replicate size 0), [])
bFData x size = bFImpl x (fst (bFData "" size)) 0 (length x) []

bFImpl :: String -> [Int] -> Int -> Int -> [Int] -> ([Int], [Int])
bFImpl _ states _ 0 outputs = (states, outputs)
bFImpl cmds states ptr idx outputs =
  let len = length cmds
      ridx = len - idx
      cmd = cmds!!ridx
  in  bFImpl cmds
      (bFChange cmd states ptr)
      (bFMove cmd ptr)
      (len - bFPos cmds cmd (states!!ptr) ridx)
      (bFOutput cmd (states!!ptr) outputs)

bFChange :: Char -> [Int] -> Int -> [Int]
bFChange cmd states ptr
  | cmd == '+' = setIndex states ptr (item + 1)
  | cmd == '-' = setIndex states ptr (item - 1)
  | otherwise = states
  where item = states!!ptr

bFMove :: Char -> Int -> Int
bFMove cmd ptr
  | cmd == '>' = ptr + 1
  | cmd == '<' = ptr - 1
  | otherwise = ptr

bFPos :: String -> Char -> Int -> Int -> Int
bFPos cmds cmd state idx
  | cmd == '[' && Map.member idx loop && state == 0
      = loop Map.! idx
  | cmd == ']' && Map.member idx loop && state /= 0
      = loop Map.! idx
  | otherwise = idx + 1
  where loop = findLoop cmds

bFOutput :: Char -> Int -> [Int] -> [Int]
bFOutput cmd state outputs
  | cmd == '.' = outputs ++ [state]
  | otherwise = outputs

findLoop :: String -> Map.Map Int Int
findLoop cmds = findLoopImpl cmds (length cmds) [] Map.empty

findLoopImpl :: String -> Int -> [Int] -> Map.Map Int Int -> Map.Map Int Int
findLoopImpl _ 0 _ res = res
findLoopImpl cmds idx [] res
  | cmd == '[' = findLoopImpl cmds (idx - 1) [ridx] res
  | cmd == ']' = error "Empty Stack"
  | otherwise = findLoopImpl cmds (idx - 1) [] res
  where ridx = (length cmds) - idx
        cmd = cmds!!ridx
findLoopImpl cmds idx (st:sts) res
  | cmd == '[' = findLoopImpl cmds (idx - 1) (ridx:st:sts) res
  | cmd == ']' = 
    findLoopImpl cmds (idx - 1) sts
      (Map.insert st ridx (Map.insert ridx st res))
  | otherwise = findLoopImpl cmds (idx - 1) (st:sts) res
  where ridx = (length cmds) - idx
        cmd = cmds!!ridx

setIndex :: [Int] -> Int -> Int -> [Int]
setIndex xs idx val = take idx xs ++ [val] ++ drop (idx + 1) xs

main = do
  let code = "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++++++++++++++.------------.<<+++++++++++++++.>.+++.------.--------.>+."
  print (bF code 16)
