{-# LANGUAGE OverloadedLists   #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}


module Actions where


import qualified Configuration.Dotenv  as Dotenv
import           Control.Error
import           Control.Monad
import qualified Data.ByteString.Char8 as C8
import           System.Directory
import           System.Environment

import           Tps.Actions.Report

import           Types


action :: Actions -> Script ()

action Report{..} = do
    envExists <- scriptIO $ doesFileExist ".env"
    when envExists $
        scriptIO $ Dotenv.loadFile False ".env"

    password <-  (?? "Please set LIBANALYTICS_PASSWORD.")
             =<< scriptIO (lookupEnv "LIBANALYTICS_PASSWORD")
    genReport reportLibAnalytics reportComputingId (C8.pack password)
              reportOutput
