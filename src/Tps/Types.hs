-- {-# LANGUAGE DeriveDataTypeable         #-}
-- {-# LANGUAGE DeriveFunctor              #-}
-- {-# LANGUAGE DeriveGeneric              #-}
-- {-# LANGUAGE DeriveTraversable          #-}
-- {-# LANGUAGE GeneralizedNewtypeDeriving #-}
-- {-# LANGUAGE OverloadedLists            #-}
-- {-# LANGUAGE OverloadedStrings          #-}
-- {-# LANGUAGE RankNTypes                 #-}
-- {-# LANGUAGE RecordWildCards            #-}
-- {-# LANGUAGE TemplateHaskell            #-}


module Tps.Types where


-- import           Control.Lens
-- import           Data.Data
import qualified Data.Text              as T
-- import           GHC.Generics           hiding (to)


type ComputingID = T.Text
type AuthInfo    = (T.Text, T.Text)
