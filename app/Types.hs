module Types where


import           Data.Text
import           Network.URI

-- import           Tps.Types


data Actions
    = Report { reportLibAnalytics :: !URI
             , reportComputingId  :: !Text
             , reportOutput       :: !FilePath
             }
    deriving (Show, Eq)
