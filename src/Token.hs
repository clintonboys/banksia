import TokenType

data Token = Token
  {
    ttype :: TokenType
    lexeme :: String
    literal :: Any
    line :: Integer
  }

instance Show Token where
  show token = (show $ ttype token) ++ " "
    ++ (lexeme token) ++ " " ++ (show $ literal token)
