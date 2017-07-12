module Runner.Cli where

import Data.Monoid
import Options.Applicative as Opts


data Options = Options
  { optCmd      :: String
  , optArgs     :: [String]
  , optMsg      :: String
  , optInterval :: Int }

options :: Parser Options
options = Options
  <$> pCmd
  <*> pArgs
  <*> pMsg
  <*> pInterval

pinfo :: ParserInfo Options
pinfo = info
  (   helper
  <*> options )
  (  fullDesc
  <> header "Surpass Travis no-output timeout, \
            \like travis_wait but preserve process output" )

pCmd :: Parser String
pCmd = strArgument (metavar "CMD")

pArgs :: Parser [String]
pArgs = many $ strArgument
  (metavar "-- ARGS (e.g. travis-pogodi -- ls -l)")

pMsg :: Parser String
pMsg = strOption
  ( long "message" <>
    short 'm' <>
    value "Nu, Travis, pogodi!" <>
    showDefaultWith id <>
    help "message printed to stdout" )

pInterval :: Parser Int
pInterval = option auto
  ( long "interval" <>
    short 'n' <>
    value 600 <>
    showDefaultWith show <>
    help "interval between messages in seconds")
