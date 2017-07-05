module Runner.Cli where

import Data.Monoid
import Options.Applicative as Opts


data Options = Options
  { optCmd   :: String
  , optArgs  :: [String]
  , optMsg   :: String
  , optDelay :: Int }

options :: Parser Options
options = Options
  <$> pCmd
  <*> pArgs
  <*> pMsg
  <*> pDelay

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
    value "Nu Travis, pogodi!" <>
    showDefaultWith id <>
    help "message printed to stdout" )

pDelay :: Parser Int
pDelay = option auto
  ( long "delay" <>
    short 'd' <>
    value 600 <>
    showDefaultWith show <>
    help "delay between messages in seconds")
