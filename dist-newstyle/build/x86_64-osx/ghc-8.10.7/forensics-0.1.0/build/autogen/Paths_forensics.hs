{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_forensics (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/21S/.cabal/bin"
libdir     = "/Users/21S/.cabal/lib/x86_64-osx-ghc-8.10.7/forensics-0.1.0-inplace"
dynlibdir  = "/Users/21S/.cabal/lib/x86_64-osx-ghc-8.10.7"
datadir    = "/Users/21S/.cabal/share/x86_64-osx-ghc-8.10.7/forensics-0.1.0"
libexecdir = "/Users/21S/.cabal/libexec/x86_64-osx-ghc-8.10.7/forensics-0.1.0"
sysconfdir = "/Users/21S/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "forensics_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "forensics_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "forensics_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "forensics_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "forensics_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "forensics_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
