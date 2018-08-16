-- | The data type of compiler options
module Language.PureScript.Options where

import Prelude.Compat
import qualified Data.Set as S

-- | The data type of compiler options
data Options = Options
  { optionsVerboseErrors :: Bool
  -- ^ Verbose error message
  , optionsNoComments :: Bool
  -- ^ Remove the comments from the generated js
  , optionsCodegenTargets :: S.Set CodegenTarget
  -- ^ Codegen targets (JS, CoreFn, etc.)
  , optionsDependencyTargets :: S.Set FilePath
  -- ^ Codegen dependency targets (e.g. precompiled modules)
  } deriving Show

-- Default make options
defaultOptions :: Options
defaultOptions = Options False False (S.singleton JS) (S.empty)

data CodegenTarget = JS | JSSourceMap | CoreFn
  deriving (Eq, Ord, Show)
