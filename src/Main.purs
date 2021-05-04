-- | This module is the root of the entire application. It exports one function, `main`, which is
-- | the first thing run when a user loads up our application in the browser. This function is
-- | responsible for doing all the setup necessary for our app to run, which includes reading tokens
-- | from local storage and starting the Halogen application.
module Main where

import Prelude

import Affjax (request, printError)
import BuildX.Api.Endpoint (Endpoint(..), ArticleParams)
import BuildX.Api.Endpoint (Pagination)
import BuildX.Api.Request (BaseURL(..), RequestMethod(..), defaultRequest, readToken)
import BuildX.AppM (AppM(..), runAppM)
import BuildX.Capability.Navigate (class Navigate)
import BuildX.Capability.Now (class Now)
import BuildX.Capability.Now as Now
import BuildX.Capability.Resource.Article (class ManageArticle, getArticles, getCurrentUserFeed)
import BuildX.Capability.Resource.Article as Article
import BuildX.Capability.Resource.User (class ManageUser)
import BuildX.Capability.Resource.User as ManageUser
import BuildX.Data.Article (Article(..), Article)
import BuildX.Data.Profile as Profile
import BuildX.Data.Route (routeCodec)
import BuildX.Env (Env, LogLevel(..), UserEnv)
import Data.Bifunctor (lmap)
import Data.Codec as Codec
import Data.Codec.Argonaut (printJsonDecodeError)
import Data.Codec.Argonaut as CA
import Data.Codec.Argonaut.Record as CAR
import Data.Either (Either(..), hush)
import Data.Maybe (Maybe(..))
import Data.Traversable (traverse_)
import Effect (Effect)
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Effect.Aff.Bus as Bus
import Effect.Aff.Class (liftAff)
import Effect.Class (class MonadEffect, liftEffect)
import Effect.Class.Console (logShow)
import Effect.Ref as Ref
import Routing.Duplex (parse)
import Routing.Hash (matchesWith)
import Slug (Slug(..))
import BuildX.Data.PaginatedArray (PaginatedArray)
import BuildX.Data.Article (Article, ArticleWithMetadata)


-- | The `main` function is the first thing run in a PureScript application. In our case, that
-- | happens when a user loads our application in the browser.
-- |

-- | There's one more thing we need to do. The `main` function in a PureScript application must
-- | run in the synchronous effects monad, `Effect`. but our components run in our custom monad, 
-- | `AppM`! We'll need to unify these different monads once we're ready to run the app.








main :: Effect Unit
main = do
  let
    baseUrl :: BaseURL
    baseUrl = BaseURL ""
    logLevel :: LogLevel
    logLevel = Dev

  userEnv <- liftEffect do 
    currentUser <- Ref.new Nothing 
    userBus <- Bus.make 
    pure { currentUser, userBus }
  

  let
    environment :: Env
    environment = { baseUrl, logLevel, userEnv }

  

  logShow ""