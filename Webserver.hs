{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Webserver where

import Network.Wai.Handler.Warp
import Servant

type API = Verb 'PUT 200 '[PlainText] NoContent

server :: Server API
server = return NoContent

userAPI :: Proxy API
userAPI = Proxy

app :: Application
app = serve userAPI server

main :: IO ()
main = run 8080 app
