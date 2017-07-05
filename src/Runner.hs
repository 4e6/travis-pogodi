{-# LANGUAGE RecordWildCards #-}

module Runner where

import Control.Concurrent
import Control.Monad
import Options.Applicative
import Runner.Cli
import System.Exit as SE
import System.Process as SP


run :: IO ()
run = do
  Options{..} <- execParser pinfo
  (_, _, _, h) <- SP.createProcess (SP.proc optCmd optArgs)
  _ <- forkIO . forever $ do
    threadDelay $ optDelay * 1000000
    putStrLn optMsg
  exitCode <- SP.waitForProcess h
  SE.exitWith exitCode
