import Data.Char
import Data.Map (Map)
import qualified Data.Map as Map

brainFuck :: String -> Int -> String
brainFuck code size = map chr (snd (brainFuckData code size))

brainFuckData :: String -> Int -> ([Int], [Int])
brainFuckData "" size = ((replicate size 0), [])
brainFuckData x size = brainFuckImpl x (fst (brainFuckData "" size)) 0 (length x) []

brainFuckImpl :: String -> [Int] -> Int -> Int -> [Int] -> ([Int], [Int])
brainFuckImpl _ states _ 0 outputs = (states, outputs)
brainFuckImpl cmds states ptr idx outputs =
  let len = length cmds
      ridx = len - idx
      cmd = cmds!!ridx
  in  brainFuckImpl cmds
      (brainFuckChange cmd states ptr)
      (brainFuckMove cmd ptr)
      (len - brainFuckPos cmds cmd (states!!ptr) ridx)
      (brainFuckOutput cmd (states!!ptr) outputs)

brainFuckChange :: Char -> [Int] -> Int -> [Int]
brainFuckChange cmd states ptr
  | cmd == '+' = setIndex states ptr (item + 1)
  | cmd == '-' = setIndex states ptr (item - 1)
  | otherwise = states
  where item = states!!ptr

brainFuckMove :: Char -> Int -> Int
brainFuckMove cmd ptr
  | cmd == '>' = ptr + 1
  | cmd == '<' = ptr - 1
  | otherwise = ptr

brainFuckPos :: String -> Char -> Int -> Int -> Int
brainFuckPos cmds cmd state idx
  | cmd == '[' && Map.member idx loop && state == 0
      = loop Map.! idx
  | cmd == ']' && Map.member idx loop && state /= 0
      = loop Map.! idx
  | otherwise = idx + 1
  where loop = findLoop cmds

brainFuckOutput :: Char -> Int -> [Int] -> [Int]
brainFuckOutput cmd state outputs
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
  print (brainFuck code 16)
