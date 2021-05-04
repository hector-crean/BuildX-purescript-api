{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "my-project"
, dependencies =
  [ 
    "aff"
  , "aff-bus"
  , "affjax"
  , "argonaut-core"
  , "codec-argonaut"
  , "console"
  , "debug"
  , "effect"
  , "formatters"
  , "free"
  , "nonempty"
  , "now"
  , "precise-datetime"
  , "psci-support"
  , "remotedata"
  , "routing"
  , "routing-duplex"
  , "slug"
  , "variant"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}

