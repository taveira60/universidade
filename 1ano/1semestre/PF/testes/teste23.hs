unlines' :: [String] -> String
unlines' [] = ""
unlines' [x] = x
unlines' (h:t) = h ++ "\n" ++ unlines t  

type Mat = [[Int]]

stringToMat :: String -> Mat
