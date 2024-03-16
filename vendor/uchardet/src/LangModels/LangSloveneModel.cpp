/* -*- Mode: C++; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is Mozilla Communicator client code.
 *
 * The Initial Developer of the Original Code is
 * Netscape Communications Corporation.
 * Portions created by the Initial Developer are Copyright (C) 1998
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */

#include "../nsSBCharSetProber.h"
#include "../nsSBCharSetProber-generated.h"
#include "../nsLanguageDetector.h"
#include "../nsLanguageDetector-generated.h"

/********* Language model for: Slovene *********/

/**
 * Generated by BuildLangModel.py
 * On: 2022-12-15 00:26:24.801420
 **/

/* Character Mapping Table:
 * ILL: illegal character.
 * CTR: control character specific to the charset.
 * RET: carriage/return.
 * SYM: symbol (punctuation) that does not belong to word.
 * NUM: 0 - 9.
 *
 * Other characters are ordered by probabilities
 * (0 is the most common character in the language).
 *
 * Orders are generic to a language. So the codepoint with order X in
 * CHARSET1 maps to the same character as the codepoint with the same
 * order X in CHARSET2 for the same language.
 * As such, it is possible to get missing order. For instance the
 * ligature of 'o' and 'e' exists in ISO-8859-15 but not in ISO-8859-1
 * even though they are both used for French. Same for the euro sign.
 */
static const unsigned char Iso_8859_2_CharToOrderMap[] =
{
  CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,RET,CTR,CTR,RET,CTR,CTR, /* 0X */
  CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR, /* 1X */
  SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM, /* 2X */
  NUM,NUM,NUM,NUM,NUM,NUM,NUM,NUM,NUM,NUM,SYM,SYM,SYM,SYM,SYM,SYM, /* 3X */
  SYM,  1, 17, 21, 12,  2, 24, 18, 19,  3, 10, 11,  7, 14,  4,  0, /* 4X */
   13, 30,  5,  6,  8, 15,  9, 26, 27, 25, 16,SYM,SYM,SYM,SYM,SYM, /* 5X */
  SYM,  1, 17, 21, 12,  2, 24, 18, 19,  3, 10, 11,  7, 14,  4,  0, /* 6X */
   13, 30,  5,  6,  8, 15,  9, 26, 27, 25, 16,SYM,SYM,SYM,SYM,CTR, /* 7X */
  CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR, /* 8X */
  CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR, /* 9X */
  SYM, 54,SYM, 47,SYM, 55, 51,SYM,SYM, 22, 45, 56, 57,SYM, 23, 58, /* AX */
  SYM, 59,SYM, 47,SYM, 60, 51,SYM,SYM, 22, 45, 61, 62,SYM, 23, 63, /* BX */
    5,  1, 40, 64, 32, 65, 29, 39, 20,  2, 46, 43, 35,  3, 66, 67, /* CX */
   33, 68, 48,  0,  0, 52, 31,SYM, 37, 69, 15, 50, 28, 36, 70, 34, /* DX */
    5,  1, 40, 71, 32, 72, 29, 39, 20,  2, 46, 43, 35,  3, 73, 74, /* EX */
   33, 75, 48,  0,  0, 52, 31,SYM, 37, 76, 15, 50, 28, 36, 77,SYM, /* FX */
};
/*X0  X1  X2  X3  X4  X5  X6  X7  X8  X9  XA  XB  XC  XD  XE  XF */

static const unsigned char Iso_8859_16_CharToOrderMap[] =
{
  CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,RET,CTR,CTR,RET,CTR,CTR, /* 0X */
  CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR, /* 1X */
  SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM, /* 2X */
  NUM,NUM,NUM,NUM,NUM,NUM,NUM,NUM,NUM,NUM,SYM,SYM,SYM,SYM,SYM,SYM, /* 3X */
  SYM,  1, 17, 21, 12,  2, 24, 18, 19,  3, 10, 11,  7, 14,  4,  0, /* 4X */
   13, 30,  5,  6,  8, 15,  9, 26, 27, 25, 16,SYM,SYM,SYM,SYM,SYM, /* 5X */
  SYM,  1, 17, 21, 12,  2, 24, 18, 19,  3, 10, 11,  7, 14,  4,  0, /* 6X */
   13, 30,  5,  6,  8, 15,  9, 26, 27, 25, 16,SYM,SYM,SYM,SYM,CTR, /* 7X */
  CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR, /* 8X */
  CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR, /* 9X */
  SYM, 78, 79, 47,SYM,SYM, 22,SYM, 22,SYM, 53,SYM, 80,SYM, 81, 82, /* AX */
  SYM,SYM, 20, 47, 23,SYM,SYM,SYM, 23, 20, 53,SYM, 83, 84, 85, 86, /* BX */
   38,  1, 40, 87, 32, 29, 88, 39,  2,  2,  2, 43,  3,  3, 89, 90, /* CX */
   33, 91,  0,  0,  0, 52, 31, 51, 50, 15, 15, 92, 28, 46, 93, 34, /* DX */
   38,  1, 40, 94, 32, 29, 95, 39,  2,  2,  2, 43,  3,  3, 96, 97, /* EX */
   33, 98,  0,  0,  0, 52, 31, 51, 50, 15, 15, 99, 28, 46,100,101, /* FX */
};
/*X0  X1  X2  X3  X4  X5  X6  X7  X8  X9  XA  XB  XC  XD  XE  XF */

static const unsigned char Windows_1250_CharToOrderMap[] =
{
  CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,RET,CTR,CTR,RET,CTR,CTR, /* 0X */
  CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR, /* 1X */
  SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM, /* 2X */
  NUM,NUM,NUM,NUM,NUM,NUM,NUM,NUM,NUM,NUM,SYM,SYM,SYM,SYM,SYM,SYM, /* 3X */
  SYM,  1, 17, 21, 12,  2, 24, 18, 19,  3, 10, 11,  7, 14,  4,  0, /* 4X */
   13, 30,  5,  6,  8, 15,  9, 26, 27, 25, 16,SYM,SYM,SYM,SYM,SYM, /* 5X */
  SYM,  1, 17, 21, 12,  2, 24, 18, 19,  3, 10, 11,  7, 14,  4,  0, /* 6X */
   13, 30,  5,  6,  8, 15,  9, 26, 27, 25, 16,SYM,SYM,SYM,SYM,CTR, /* 7X */
  SYM,ILL,SYM,ILL,SYM,SYM,SYM,SYM,ILL,SYM, 22,SYM, 51,102, 23,103, /* 8X */
  ILL,SYM,SYM,SYM,SYM,SYM,SYM,SYM,ILL,SYM, 22,SYM, 51,104, 23,105, /* 9X */
  SYM,SYM,SYM, 47,SYM,106,SYM,SYM,SYM,SYM, 45,SYM,SYM,SYM,SYM,107, /* AX */
  SYM,SYM,SYM, 47,SYM,SYM,SYM,SYM,SYM,108, 45,SYM,109,SYM,110,111, /* BX */
    5,  1, 40,112, 32,113, 29, 39, 20,  2, 46, 43, 35,  3,114,115, /* CX */
   33,116, 48,  0,  0, 52, 31,SYM, 37,117, 15, 50, 28, 36,118, 34, /* DX */
    5,  1, 40,119, 32,120, 29, 39, 20,  2, 46, 43, 35,  3,121,122, /* EX */
   33,123, 48,  0,  0, 52, 31,SYM, 37,124, 15, 50, 28, 36,125,SYM, /* FX */
};
/*X0  X1  X2  X3  X4  X5  X6  X7  X8  X9  XA  XB  XC  XD  XE  XF */

static const unsigned char Ibm852_CharToOrderMap[] =
{
  CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,RET,CTR,CTR,RET,CTR,CTR, /* 0X */
  CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR, /* 1X */
  SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM, /* 2X */
  NUM,NUM,NUM,NUM,NUM,NUM,NUM,NUM,NUM,NUM,SYM,SYM,SYM,SYM,SYM,SYM, /* 3X */
  SYM,  1, 17, 21, 12,  2, 24, 18, 19,  3, 10, 11,  7, 14,  4,  0, /* 4X */
   13, 30,  5,  6,  8, 15,  9, 26, 27, 25, 16,SYM,SYM,SYM,SYM,SYM, /* 5X */
  SYM,  1, 17, 21, 12,  2, 24, 18, 19,  3, 10, 11,  7, 14,  4,  0, /* 6X */
   13, 30,  5,  6,  8, 15,  9, 26, 27, 25, 16,SYM,SYM,SYM,SYM,CTR, /* 7X */
   39, 28,  2, 40, 32,126, 29, 39, 47, 43, 52, 52,127,128, 32, 29, /* 8X */
    2,129,130,  0, 31,131,132, 51, 51, 31, 28,133,134, 47,SYM, 20, /* 9X */
    1,  3,  0, 15,135,136, 23, 23, 46, 46,SYM,137, 20, 45,SYM,SYM, /* AX */
  SYM,SYM,SYM,SYM,SYM,  1, 40, 35, 45,SYM,SYM,SYM,SYM,138,139,SYM, /* BX */
  SYM,SYM,SYM,SYM,SYM,SYM,140,141,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM, /* CX */
   33, 33,142, 43,143, 48,  3,144, 35,SYM,SYM,SYM,SYM,145,146,SYM, /* DX */
    0, 34,  0,147,148, 48, 22, 22,  5, 15,  5, 50, 36, 36,149,SYM, /* EX */
  SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM, 50, 37, 37,SYM,SYM, /* FX */
};
/*X0  X1  X2  X3  X4  X5  X6  X7  X8  X9  XA  XB  XC  XD  XE  XF */

static const unsigned char Mac_Centraleurope_CharToOrderMap[] =
{
  CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,RET,CTR,CTR,RET,CTR,CTR, /* 0X */
  CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR,CTR, /* 1X */
  SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM, /* 2X */
  NUM,NUM,NUM,NUM,NUM,NUM,NUM,NUM,NUM,NUM,SYM,SYM,SYM,SYM,SYM,SYM, /* 3X */
  SYM,  1, 17, 21, 12,  2, 24, 18, 19,  3, 10, 11,  7, 14,  4,  0, /* 4X */
   13, 30,  5,  6,  8, 15,  9, 26, 27, 25, 16,SYM,SYM,SYM,SYM,SYM, /* 5X */
  SYM,  1, 17, 21, 12,  2, 24, 18, 19,  3, 10, 11,  7, 14,  4,  0, /* 6X */
   13, 30,  5,  6,  8, 15,  9, 26, 27, 25, 16,SYM,SYM,SYM,SYM,CTR, /* 7X */
   32, 42, 42,  2,150, 31, 28,  1,151, 20, 32, 20, 29, 29,  2,152, /* 8X */
  153,154,  3,155, 41, 41,156,  0,157,  0, 31,158, 15, 35, 35, 28, /* 9X */
  SYM,SYM, 46,SYM,SYM,SYM,SYM, 34,SYM,SYM,SYM, 46,SYM,SYM,159,160, /* AX */
  161, 49,SYM,SYM, 49,162,SYM,SYM, 47,163,164,165,166,167,168,169, /* BX */
  170,171,SYM,SYM,172, 48,SYM,SYM,SYM,SYM,SYM, 48, 52,173, 52, 44, /* CX */
  SYM,SYM,SYM,SYM,SYM,SYM,SYM,SYM, 44,  5,  5, 37,SYM,SYM, 37,174, /* DX */
  175, 22,SYM,SYM, 22, 51, 51,  1,176,177,  3, 23, 23,178,  0,  0, /* EX */
  179,180, 15,181, 50, 50,182,183, 36, 36,184,185, 47,186,187,SYM, /* FX */
};
/*X0  X1  X2  X3  X4  X5  X6  X7  X8  X9  XA  XB  XC  XD  XE  XF */

static const int Unicode_Char_size = 81;
static const unsigned int Unicode_CharOrder[] =
{
    32,  0,   65,  1,   66, 17,   67, 21,   68, 12,   69,  2,   70, 24,  71, 18,
    72, 19,   73,  3,   74, 10,   75, 11,   76,  7,   77, 14,   78,  4,  79,  0,
    80, 13,   82,  5,   83,  6,   84,  8,   85, 15,   86,  9,   90, 16,  97,  1,
    98, 17,   99, 21,  100, 12,  101,  2,  102, 24,  103, 18,  104, 19, 105,  3,
   106, 10,  107, 11,  108,  7,  109, 14,  110,  4,  111,  0,  112, 13, 114,  5,
   115,  6,  116,  8,  117, 15,  118,  9,  122, 16,  225,  1,  232,  2, 233,  2,
   234,  2,  236,  3,  237,  3,  242,  0,  243,  0,  244,  0,  249, 15, 250, 15,
   268, 20,  269, 20,  341,  5,  352, 22,  353, 22,  381, 23,  382, 23, 513,  1,
   515,  1,  517,  2,  519,  2,  521,  3,  523,  3,  525,  0,  527,  0, 531,  5,
   533, 15,  535, 15,  601,  2,  768,  2,  769,  0,  783,  2,  785,  0,7865,  2,
  7885,  0,
};


/* Model Table:
 * Total considered sequences: 892 / 625
 * - Positive sequences: first 425 (0.9950503733060554)
 * - Probable sequences: next 141 (566-425) (0.003955359577353934)
 * - Neutral sequences: last 59 (0.0009942671165906747)
 * - Negative sequences: -267 (off-ratio)
 * Negative sequences: TODO
 */
static const PRUint8 SloveneLangModel[] =
{
  3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
  3,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
  3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
  3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
  3,3,3,3,3,3,3,2,3,2,3,3,3,3,2,3,3,3,3,2,3,3,3,2,3,
  3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,
  3,3,3,3,3,3,3,3,3,3,2,3,1,3,3,3,2,3,1,3,1,3,0,0,3,
  3,3,3,3,3,1,3,3,3,2,3,3,3,3,3,3,2,3,3,2,2,3,2,3,3,
  3,3,3,3,3,3,3,3,3,3,3,3,2,2,3,3,3,2,2,3,1,2,0,0,2,
  3,3,3,3,3,3,3,3,3,1,3,3,3,3,2,3,3,3,3,2,3,3,3,2,1,
  3,3,3,3,3,1,3,2,2,3,1,3,3,3,3,3,2,3,1,2,1,3,3,0,1,
  3,3,3,3,3,3,3,3,3,3,3,1,3,2,3,3,1,1,2,2,1,3,2,0,1,
  3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,3,2,
  3,3,3,3,3,3,3,3,3,1,2,2,2,2,1,3,1,1,0,2,2,2,2,0,1,
  3,3,3,3,3,3,3,3,1,2,1,2,2,3,2,3,1,3,1,1,3,3,3,1,2,
  3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,3,2,
  3,3,3,3,3,3,3,3,2,3,3,3,3,3,3,3,2,3,3,3,2,2,3,0,0,
  3,3,3,3,3,3,3,3,2,2,3,2,3,0,3,3,2,2,1,1,3,2,2,1,1,
  3,3,3,3,3,3,2,3,1,2,1,1,2,1,2,3,1,1,2,2,0,1,0,0,1,
  3,3,3,3,3,3,2,3,3,1,1,3,2,1,2,3,1,1,1,1,2,1,0,0,1,
  3,3,3,3,3,3,1,3,1,2,3,3,0,1,1,3,0,2,0,0,0,1,0,0,0,
  3,3,3,3,2,2,1,3,2,2,1,3,1,1,3,3,1,1,1,3,1,2,0,0,1,
  3,3,3,3,3,1,0,3,3,2,3,3,1,3,3,2,0,0,0,0,3,1,0,0,0,
  3,3,3,3,3,2,1,1,0,1,3,2,1,0,2,3,0,3,2,0,1,1,0,0,0,
  3,3,3,3,2,3,3,3,2,1,2,1,1,1,1,3,0,1,1,0,0,1,1,0,2,
};


const SequenceModel Iso_8859_2SloveneModel =
{
  Iso_8859_2_CharToOrderMap,
  SloveneLangModel,
  25,
  (float)0.9990057328834093,
  PR_FALSE,
  "ISO-8859-2",
  "sl"
};

const SequenceModel Iso_8859_16SloveneModel =
{
  Iso_8859_16_CharToOrderMap,
  SloveneLangModel,
  25,
  (float)0.9990057328834093,
  PR_FALSE,
  "ISO-8859-16",
  "sl"
};

const SequenceModel Windows_1250SloveneModel =
{
  Windows_1250_CharToOrderMap,
  SloveneLangModel,
  25,
  (float)0.9990057328834093,
  PR_FALSE,
  "WINDOWS-1250",
  "sl"
};

const SequenceModel Ibm852SloveneModel =
{
  Ibm852_CharToOrderMap,
  SloveneLangModel,
  25,
  (float)0.9990057328834093,
  PR_FALSE,
  "IBM852",
  "sl"
};

const SequenceModel Mac_CentraleuropeSloveneModel =
{
  Mac_Centraleurope_CharToOrderMap,
  SloveneLangModel,
  25,
  (float)0.9990057328834093,
  PR_FALSE,
  "MAC-CENTRALEUROPE",
  "sl"
};

const LanguageModel SloveneModel =
{
  "sl",
  Unicode_CharOrder,
  81,
  SloveneLangModel,
  25,
  3,
  (float)0.402267667868288,
  19,
  (float)0.03413859894544281,
};