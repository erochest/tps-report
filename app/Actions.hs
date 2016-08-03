{-# LANGUAGE OverloadedLists   #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}


module Actions where


import           Control.Error

import           Tps.Actions.Report

import           Types


action :: Actions -> Script ()

action Report{..} = genReport reportLibAnalytics reportComputingId undefined
                              reportOutput
