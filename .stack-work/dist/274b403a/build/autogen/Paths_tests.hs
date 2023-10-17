{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_tests (
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
version = Version [0,0,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Haskell work\\haskell\\haskell_mooc\\haskell-mooc\\exercises\\.stack-work\\install\\f439e590\\bin"
libdir     = "C:\\Haskell work\\haskell\\haskell_mooc\\haskell-mooc\\exercises\\.stack-work\\install\\f439e590\\lib\\x86_64-windows-ghc-8.10.7\\tests-0.0.1-Hb9nGjymwaT9TyBfcdH5Yz"
dynlibdir  = "C:\\Haskell work\\haskell\\haskell_mooc\\haskell-mooc\\exercises\\.stack-work\\install\\f439e590\\lib\\x86_64-windows-ghc-8.10.7"
datadir    = "C:\\Haskell work\\haskell\\haskell_mooc\\haskell-mooc\\exercises\\.stack-work\\install\\f439e590\\share\\x86_64-windows-ghc-8.10.7\\tests-0.0.1"
libexecdir = "C:\\Haskell work\\haskell\\haskell_mooc\\haskell-mooc\\exercises\\.stack-work\\install\\f439e590\\libexec\\x86_64-windows-ghc-8.10.7\\tests-0.0.1"
sysconfdir = "C:\\Haskell work\\haskell\\haskell_mooc\\haskell-mooc\\exercises\\.stack-work\\install\\f439e590\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "tests_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "tests_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "tests_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "tests_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tests_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "tests_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
