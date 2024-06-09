module Config where

import IHP.Prelude
import IHP.Environment
import IHP.FrameworkConfig

import qualified IHP.Log as Log
import IHP.Log.Types

import Data.String.Interpolate (i)

config :: ConfigBuilder
config = do
    -- See https://ihp.digitallyinduced.com/Guide/config.html
    -- for what you can do here
    logger <- liftIO $ newLogger def {
        level = Info,
        formatter = myLogFormatter,
        destination = File "Log/test.log" (SizeRotate (Bytes (4 * 1024 * 1024)) 7) defaultBufSize
    }
    option logger
    pure ()


myLogFormatter :: LogFormatter
myLogFormatter time level mgs = fromString [i|[#{show level} - #{show time} ]: #{show mgs}|]  
