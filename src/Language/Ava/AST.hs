{-# LANGUAGE OverloadedStrings #-}
-- |
-- Module      : Language.Ava.AST
-- Copyright   : (c) 2016 Owain Lewis
--
-- License     : BSD-style
-- Maintainer  : owain@owainlewis.com
-- Stability   : experimental
-- Portability : GHC
--
-- Defines the basic AST for the Ava language
--
module Language.Ava.AST where

import           Data.List   (intersperse)
import           Data.Monoid ((<>))

data Value = Word! String
           | Integer! Int
           | Float! Double
           | Vector! [Value]
           | String! String
           | Boolean! Bool
           | LetStmt! String Value
           | IfStmt! [Value] [Value] [Value]
           | Procedure! String [Value]
           deriving ( Show )

instance Eq Value where
  (Word x)          == (Word y)          = x == y
  (Integer x)       == (Integer y)       = x == y
  (Float x)         == (Float y)         = x == y
  (Vector xs)       == (Vector ys)       = xs == ys
  (String x)        == (String y)        = x == y
  (Boolean x)       == (Boolean y)       = x == y
  (LetStmt k1 v1)   == (LetStmt k2 v2)   = k1 == k2 && v1 == v2
  (IfStmt x1 y1 z1) == (IfStmt x2 y2 z2) = x1 == x2 && y1 == y2 && z1 == z2
  (Procedure x1 y1) == (Procedure x2 y2) = x1 == x2 && y1 == y2
  x                 == y                 = False

instance Ord Value where
  (Word x)          `compare` (Word y)          = x  `compare` y
  (Integer x)       `compare` (Integer y)       = x  `compare` y
  (Float x)         `compare` (Float y)         = x  `compare` y
  (Vector xs)       `compare` (Vector ys)       = xs `compare` ys
  (String x)        `compare` (String y)        = x  `compare` y
  (Boolean x)       `compare` (Boolean y)       = x  `compare` y
  (LetStmt k1 v1)   `compare` (LetStmt k2 v2)   = k1 `compare` k2
  (IfStmt x1 y1 z1) `compare` (IfStmt x2 y2 z2) = x1 `compare` x2
  (Procedure x1 y1) `compare` (Procedure x2 y2) = x1 `compare` x2

isWord :: Value -> Bool
isWord (Word _) = True
isWord _        = False

isInteger :: Value -> Bool
isInteger (Integer _) = True
isInteger _           = False

isFloat :: Value -> Bool
isFloat (Float _) = True
isFloat _         = False

isVector :: Value -> Bool
isVector (Vector _) = True
isVector _          = False

isString :: Value -> Bool
isString (String _) = True
isString _          = False

isBoolean :: Value -> Bool
isBoolean (Boolean _) = True
isBoolean _           = False

isProc :: Value -> Bool
isProc (Procedure _ _) = True
isProc _               = False