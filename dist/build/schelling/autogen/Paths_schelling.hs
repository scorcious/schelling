{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_schelling (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/richard/.cabal/bin"
libdir     = "/home/richard/.cabal/lib/x86_64-linux-ghc-8.4.4/schelling-0.1.0.0-I35koBLF1aZ6pKAlsNFN7v"
dynlibdir  = "/home/richard/.cabal/lib/x86_64-linux-ghc-8.4.4"
datadir    = "/home/richard/.cabal/share/x86_64-linux-ghc-8.4.4/schelling-0.1.0.0"
libexecdir = "/home/richard/.cabal/libexec/x86_64-linux-ghc-8.4.4/schelling-0.1.0.0"
sysconfdir = "/home/richard/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "schelling_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "schelling_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "schelling_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "schelling_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "schelling_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "schelling_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
