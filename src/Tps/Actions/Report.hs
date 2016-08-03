{-# LANGUAGE OverloadedStrings #-}


module Tps.Actions.Report where


import           Control.Error
import qualified Data.ByteString as BS
import           Network.URI

import           Tps.Types


genReport :: URI -> ComputingID -> BS.ByteString -> FilePath -> Script ()
genReport = undefined
