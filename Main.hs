module Main where

-- Define Abstract Syntax Tree
data JsonValue = JsonNull
  | JsonBool Bool
  | JsonNumber Integer -- Note: No support for floats, yet
  | JsonString String
  | JsonArray [JsonValue] -- type is recursive
  | JsonObject [(String, JsonValue)] -- Map is in containers package, (Map String JsonValue)
  deriving (Show, Eq)

-- Define individual parsers

-- Most full implementation could look like below (returning char and line number and type of error)
-- parser :: String -> Either (Int, Int, String) (String, a)
-- More moderate implementation below for now, no proper error reporting
-- type Parser a = String -> Maybe (String, a)
-- Can use pattern below to wrap a function to a Parser, or unwrap with runParser
newtype Parser a = Parser
  { runParser :: String -> Maybe (String, a)
  }

jsonNull :: Parser JsonValue
jsonNull = undefined

-- explained 'holes' e.g. _a to show bindings in scope
-- helper parser that parses a single char
-- runParser (charP 'n') "nice" 
charP :: Char -> Parser Char
-- charP x = Parser $ \input ->
--   case input of
--     y:ys | y == x -> Just (ys, x)
--     _    -> Nothing -- handles empty [] as well as if y /= x

-- Reformulated using 'where' rather than lambda
-- charP x = Parser f
--   where 
--     f input =
--       case input of
--         y:ys
--           | y == x -> Just (ys, x)
--         _ -> Nothing

-- Reformulated with pattern matching happening at the function level
charP x = Parser f
  where
    f (y:ys)
      | y == x = Just (ys, x)
      | otherwise = Nothing
    f [] = Nothing

-- got to 45:43, but need to rewatch again from 35:55 to grok Functor and Applicative 

stringP :: String -> Parser String
stringP = undefined

jsonValue :: Parser JsonValue
jsonValue = undefined

main :: IO()
main = undefined
