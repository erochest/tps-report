{-# LANGUAGE LambdaCase #-}


module Opts
    ( Actions(..)
    , opts
    , execParser
    , parseOpts
    ) where


-- import           Control.Monad       (mzero)
-- import qualified Data.List           as L
import qualified Data.Text           as T
import           Network.URI
import           Options.Applicative

-- import           Tps.Types

import           Types


-- textOption :: Mod OptionFields T.Text -> Parser T.Text
-- textOption = option (T.pack <$> str)

outputOpt :: Parser FilePath
outputOpt = strOption (  short 'o' <> long "output" <> metavar "OUTPUT_FILE"
                      <> help "The file to write back to.")

{-
 - inputOpt :: Parser FilePath
 - inputOpt = strOption (  short 'i' <> long "input" <> metavar "INPUT_FILE"
 -                      <> help "The input file to process.")
 -}

readURI :: ReadM URI
readURI = maybe (fail "Invalid URL.") return . parseURI =<< str

-- inputsOpt :: Parser [FilePath]
-- inputsOpt = many (strArgument (  metavar "INPUT_FILES ..."
                              -- <> help "Input data files."))

reportOpts :: Parser Actions
reportOpts = Report
           <$> option readURI (  short 'l' <> long "libanalytics"
                              <> metavar "URI"
                              <> help "The URL for libanalytics. The password\
                                      \ information for this should be read\
                                      \ in from the 'LIBANALYTICS_PASSWORD'\
                                      \ environment variables.")
           <*> option (T.pack <$> str)
                      (  short 'u' <> long "username" <> metavar "COMPUTING_ID"
                      <> help "The computing ID for logging into the\
                              \ libanalytics and searching for interactions.")
           <*> outputOpt

{-
 - opts' :: Parser Actions
 - opts' = subparser
 -       (  command "report" (info (helper <*> reportOpts)
 -                           (progDesc "Default action and options."))
 -       )
 -}

opts :: ParserInfo Actions
opts = info (helper <*> reportOpts)
            (  fullDesc
            <> progDesc "Monthly activity report automation."
            <> header "tps-report - TPS report")

parseOpts :: IO Actions
parseOpts = execParser opts
