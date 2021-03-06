-- | Comments are only used when viewing an article. Still, they're an example of an *entity* with
-- | a persistent identity. They're a resource users can manage directly: users can create, delete,
-- | and perhaps eventually modify them.
module BuildX.Data.Comment where

import Prelude

import BuildX.Data.Profile (Author)
import BuildX.Data.Profile as Profile
import BuildX.Data.Username (Username)
import Data.Codec.Argonaut (JsonCodec)
import Data.Codec.Argonaut as CA
import Data.Codec.Argonaut.Record as CAR
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)
import Data.Profunctor (wrapIso)

-- | This type exists purely as an identifier to distinguish it from a normal `String`, so we'll
-- | create a simple newtype which can be freely wrapped or unwrapped.
newtype CommentId = CommentId Int

derive instance newtypeCommentId :: Newtype CommentId _
derive instance eqCommentId :: Eq CommentId
derive instance ordCommentId :: Ord CommentId

-- | Next, we'll define our larger comment type. A comment consists of a persistent unique
-- | identifier, a timestamp, a user-created body, and information about the user who created
-- | the comment.
type Comment =
  { id :: CommentId
  , createdAt :: String
  , body :: String
  , author :: Author
  }

codec :: Maybe Username -> JsonCodec Comment
codec mbUsername =
  CAR.object "Comment"
    { id: wrapIso CommentId CA.int
    , createdAt: CA.string
    , body: CA.string
    , author: Profile.authorCodec mbUsername
    }
