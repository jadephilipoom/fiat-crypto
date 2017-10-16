Require Import Coq.ZArith.ZArith.
Require Export Crypto.Compilers.Syntax.
Require Import Crypto.Compilers.Z.Syntax.
Require Export Bedrock.Word.
Require Export Crypto.Util.Notations.

Notation Const x := (Op (OpConst x) TT).
(* python:
<<
#!/usr/bin/env python
from __future__ import with_statement
import math

systematic_nums \
    = (list(range(128)) +
       [2**i + j for i in range(256) for j in (1, 0, -1)])
nums = tuple(sorted(set(systematic_nums + [
    187,
    189,
    317,
    481,
    569,
    765,
    114687,
    121665,
    130307,
    131039,
    131067,
    261167,
    261575,
    262131,
    262139,
    523807,
    524101,
    524263,
    524269,
    524271,
    524279,
    1048471,
    1048549,
    1048557,
    1048559,
    1048573,
    2096128,
    2097127,
    2097135,
    2097143,
    4193987,
    4194115,
    4194275,
    4194279,
    4194285,
    4194287,
    4194293,
    8388491,
    8388577,
    8388581,
    8388591,
    8388599,
    8388605,
    8388606,
    16711679,
    16776959,
    16777191,
    16777199,
    16777201,
    16777213,
    33554413,
    33554417,
    33554429,
    67108833,
    67108855,
    67108859,
    67108861,
    67108862,
    134217690,
    134217710,
    134217726,
    268431360,
    268435454,
    536870893,
    536870906,
    536870910,
    1073741822,
    4294967107,
    4294967271,
    4294967294,
    8589934559,
    8589934567,
    8589934575,
    8589934587,
    34359738341,
    34359738349,
    34359738355,
    68719476707,
    68719476727,
    68719476733,
    137436856320,
    137438952991,
    137438953285,
    137438953355,
    274877906927,
    274877906933,
    274877906939,
    274877906941,
    549755813783,
    549755813869,
    1099511627761,
    1425929142271,
    2199023255543,
    4398046511079,
    4398046511099,
    8796090925055,
    8796093021443,
    8796093022189,
    8796093022193,
    17592186044399,
    17592186044413,
    35184372088829,
    70368735789055,
    70368744177637,
    70368744177647,
    70368744177659,
    70368744177661,
    140737488355303,
    140737488355313,
    281470681743359,
    281474976645119,
    281474976710339,
    281474976710639,
    281474976710647,
    281474976710653,
    562949953421293,
    1125899873288191,
    1125899906842593,
    1125899906842607,
    2251799813160960,
    2251799813685210,
    2251799813685217,
    2251799813685229,
    4503599627370458,
    4503599627370479,
    4503599627370494,
    9007199187632127,
    72057594037927934,
    18446744069414584321,
    18446744073709551614,
    77371252455336267181195254,
    77371252455336267181195262,
    340282366841710300967557013911933812736,
])))

def log2_up(i):
    return int(math.ceil(math.log(i, 2)))

def word(i, width=None):
    assert(i >= 0)
    if width is None:
        if i == 0: return word(i, width=1)
        return word(i, width=2**log2_up(log2_up(i + 1)))
    return 'WO~' + '~'.join(bin(i)[2:].rjust(width, '0'))

word_formats = tuple(sorted([(n, hex(n), bin(n), word(n)) for n in nums]))

def header():
    return (r"""Require Import Coq.ZArith.ZArith.
Require Export Crypto.Compilers.Syntax.
Require Import Crypto.Compilers.Z.Syntax.
Require Export Bedrock.Word.
Require Export Crypto.Util.Notations.

Notation Const x := (Op (OpConst x) TT).
(""" + r"""* python:
<<
""" +
            open(__file__).read() +
            r""">>
 *""" + r""")""")


def hex_nots():
    return ('\n'.join('''Notation "'%s'" (* %d (%s) *)\n  := (Const %s%%Z).\nNotation "'%s'" (* %d (%s) *)\n  := (Const %s).''' % (h, d, h, d, h, d, h, w)
                      for d, h, b, w in word_formats))
def bin_nots():
    return ('\n'.join('''Notation "'%s'" (* %d (%s) *)\n  := (Const %s).''' % (b, d, h, w)
                      for d, h, b, w in word_formats))

with open('HexNotationConstants.v', 'w') as f:
    f.write(header() + '\n' + hex_nots() + '\n')

with open('BinaryNotationConstants.v', 'w') as f:
    f.write(header() + '\n' + bin_nots() + '\n')
>>
 *)
Notation "'0x0'" (* 0 (0x0) *)
  := (Const 0%Z).
Notation "'0x0'" (* 0 (0x0) *)
  := (Const WO~0).
Notation "'0x1'" (* 1 (0x1) *)
  := (Const 1%Z).
Notation "'0x1'" (* 1 (0x1) *)
  := (Const WO~1).
Notation "'0x2'" (* 2 (0x2) *)
  := (Const 2%Z).
Notation "'0x2'" (* 2 (0x2) *)
  := (Const WO~1~0).
Notation "'0x3'" (* 3 (0x3) *)
  := (Const 3%Z).
Notation "'0x3'" (* 3 (0x3) *)
  := (Const WO~1~1).
Notation "'0x4'" (* 4 (0x4) *)
  := (Const 4%Z).
Notation "'0x4'" (* 4 (0x4) *)
  := (Const WO~0~1~0~0).
Notation "'0x5'" (* 5 (0x5) *)
  := (Const 5%Z).
Notation "'0x5'" (* 5 (0x5) *)
  := (Const WO~0~1~0~1).
Notation "'0x6'" (* 6 (0x6) *)
  := (Const 6%Z).
Notation "'0x6'" (* 6 (0x6) *)
  := (Const WO~0~1~1~0).
Notation "'0x7'" (* 7 (0x7) *)
  := (Const 7%Z).
Notation "'0x7'" (* 7 (0x7) *)
  := (Const WO~0~1~1~1).
Notation "'0x8'" (* 8 (0x8) *)
  := (Const 8%Z).
Notation "'0x8'" (* 8 (0x8) *)
  := (Const WO~1~0~0~0).
Notation "'0x9'" (* 9 (0x9) *)
  := (Const 9%Z).
Notation "'0x9'" (* 9 (0x9) *)
  := (Const WO~1~0~0~1).
Notation "'0xa'" (* 10 (0xa) *)
  := (Const 10%Z).
Notation "'0xa'" (* 10 (0xa) *)
  := (Const WO~1~0~1~0).
Notation "'0xb'" (* 11 (0xb) *)
  := (Const 11%Z).
Notation "'0xb'" (* 11 (0xb) *)
  := (Const WO~1~0~1~1).
Notation "'0xc'" (* 12 (0xc) *)
  := (Const 12%Z).
Notation "'0xc'" (* 12 (0xc) *)
  := (Const WO~1~1~0~0).
Notation "'0xd'" (* 13 (0xd) *)
  := (Const 13%Z).
Notation "'0xd'" (* 13 (0xd) *)
  := (Const WO~1~1~0~1).
Notation "'0xe'" (* 14 (0xe) *)
  := (Const 14%Z).
Notation "'0xe'" (* 14 (0xe) *)
  := (Const WO~1~1~1~0).
Notation "'0xf'" (* 15 (0xf) *)
  := (Const 15%Z).
Notation "'0xf'" (* 15 (0xf) *)
  := (Const WO~1~1~1~1).
Notation "'0x10'" (* 16 (0x10) *)
  := (Const 16%Z).
Notation "'0x10'" (* 16 (0x10) *)
  := (Const WO~0~0~0~1~0~0~0~0).
Notation "'0x11'" (* 17 (0x11) *)
  := (Const 17%Z).
Notation "'0x11'" (* 17 (0x11) *)
  := (Const WO~0~0~0~1~0~0~0~1).
Notation "'0x12'" (* 18 (0x12) *)
  := (Const 18%Z).
Notation "'0x12'" (* 18 (0x12) *)
  := (Const WO~0~0~0~1~0~0~1~0).
Notation "'0x13'" (* 19 (0x13) *)
  := (Const 19%Z).
Notation "'0x13'" (* 19 (0x13) *)
  := (Const WO~0~0~0~1~0~0~1~1).
Notation "'0x14'" (* 20 (0x14) *)
  := (Const 20%Z).
Notation "'0x14'" (* 20 (0x14) *)
  := (Const WO~0~0~0~1~0~1~0~0).
Notation "'0x15'" (* 21 (0x15) *)
  := (Const 21%Z).
Notation "'0x15'" (* 21 (0x15) *)
  := (Const WO~0~0~0~1~0~1~0~1).
Notation "'0x16'" (* 22 (0x16) *)
  := (Const 22%Z).
Notation "'0x16'" (* 22 (0x16) *)
  := (Const WO~0~0~0~1~0~1~1~0).
Notation "'0x17'" (* 23 (0x17) *)
  := (Const 23%Z).
Notation "'0x17'" (* 23 (0x17) *)
  := (Const WO~0~0~0~1~0~1~1~1).
Notation "'0x18'" (* 24 (0x18) *)
  := (Const 24%Z).
Notation "'0x18'" (* 24 (0x18) *)
  := (Const WO~0~0~0~1~1~0~0~0).
Notation "'0x19'" (* 25 (0x19) *)
  := (Const 25%Z).
Notation "'0x19'" (* 25 (0x19) *)
  := (Const WO~0~0~0~1~1~0~0~1).
Notation "'0x1a'" (* 26 (0x1a) *)
  := (Const 26%Z).
Notation "'0x1a'" (* 26 (0x1a) *)
  := (Const WO~0~0~0~1~1~0~1~0).
Notation "'0x1b'" (* 27 (0x1b) *)
  := (Const 27%Z).
Notation "'0x1b'" (* 27 (0x1b) *)
  := (Const WO~0~0~0~1~1~0~1~1).
Notation "'0x1c'" (* 28 (0x1c) *)
  := (Const 28%Z).
Notation "'0x1c'" (* 28 (0x1c) *)
  := (Const WO~0~0~0~1~1~1~0~0).
Notation "'0x1d'" (* 29 (0x1d) *)
  := (Const 29%Z).
Notation "'0x1d'" (* 29 (0x1d) *)
  := (Const WO~0~0~0~1~1~1~0~1).
Notation "'0x1e'" (* 30 (0x1e) *)
  := (Const 30%Z).
Notation "'0x1e'" (* 30 (0x1e) *)
  := (Const WO~0~0~0~1~1~1~1~0).
Notation "'0x1f'" (* 31 (0x1f) *)
  := (Const 31%Z).
Notation "'0x1f'" (* 31 (0x1f) *)
  := (Const WO~0~0~0~1~1~1~1~1).
Notation "'0x20'" (* 32 (0x20) *)
  := (Const 32%Z).
Notation "'0x20'" (* 32 (0x20) *)
  := (Const WO~0~0~1~0~0~0~0~0).
Notation "'0x21'" (* 33 (0x21) *)
  := (Const 33%Z).
Notation "'0x21'" (* 33 (0x21) *)
  := (Const WO~0~0~1~0~0~0~0~1).
Notation "'0x22'" (* 34 (0x22) *)
  := (Const 34%Z).
Notation "'0x22'" (* 34 (0x22) *)
  := (Const WO~0~0~1~0~0~0~1~0).
Notation "'0x23'" (* 35 (0x23) *)
  := (Const 35%Z).
Notation "'0x23'" (* 35 (0x23) *)
  := (Const WO~0~0~1~0~0~0~1~1).
Notation "'0x24'" (* 36 (0x24) *)
  := (Const 36%Z).
Notation "'0x24'" (* 36 (0x24) *)
  := (Const WO~0~0~1~0~0~1~0~0).
Notation "'0x25'" (* 37 (0x25) *)
  := (Const 37%Z).
Notation "'0x25'" (* 37 (0x25) *)
  := (Const WO~0~0~1~0~0~1~0~1).
Notation "'0x26'" (* 38 (0x26) *)
  := (Const 38%Z).
Notation "'0x26'" (* 38 (0x26) *)
  := (Const WO~0~0~1~0~0~1~1~0).
Notation "'0x27'" (* 39 (0x27) *)
  := (Const 39%Z).
Notation "'0x27'" (* 39 (0x27) *)
  := (Const WO~0~0~1~0~0~1~1~1).
Notation "'0x28'" (* 40 (0x28) *)
  := (Const 40%Z).
Notation "'0x28'" (* 40 (0x28) *)
  := (Const WO~0~0~1~0~1~0~0~0).
Notation "'0x29'" (* 41 (0x29) *)
  := (Const 41%Z).
Notation "'0x29'" (* 41 (0x29) *)
  := (Const WO~0~0~1~0~1~0~0~1).
Notation "'0x2a'" (* 42 (0x2a) *)
  := (Const 42%Z).
Notation "'0x2a'" (* 42 (0x2a) *)
  := (Const WO~0~0~1~0~1~0~1~0).
Notation "'0x2b'" (* 43 (0x2b) *)
  := (Const 43%Z).
Notation "'0x2b'" (* 43 (0x2b) *)
  := (Const WO~0~0~1~0~1~0~1~1).
Notation "'0x2c'" (* 44 (0x2c) *)
  := (Const 44%Z).
Notation "'0x2c'" (* 44 (0x2c) *)
  := (Const WO~0~0~1~0~1~1~0~0).
Notation "'0x2d'" (* 45 (0x2d) *)
  := (Const 45%Z).
Notation "'0x2d'" (* 45 (0x2d) *)
  := (Const WO~0~0~1~0~1~1~0~1).
Notation "'0x2e'" (* 46 (0x2e) *)
  := (Const 46%Z).
Notation "'0x2e'" (* 46 (0x2e) *)
  := (Const WO~0~0~1~0~1~1~1~0).
Notation "'0x2f'" (* 47 (0x2f) *)
  := (Const 47%Z).
Notation "'0x2f'" (* 47 (0x2f) *)
  := (Const WO~0~0~1~0~1~1~1~1).
Notation "'0x30'" (* 48 (0x30) *)
  := (Const 48%Z).
Notation "'0x30'" (* 48 (0x30) *)
  := (Const WO~0~0~1~1~0~0~0~0).
Notation "'0x31'" (* 49 (0x31) *)
  := (Const 49%Z).
Notation "'0x31'" (* 49 (0x31) *)
  := (Const WO~0~0~1~1~0~0~0~1).
Notation "'0x32'" (* 50 (0x32) *)
  := (Const 50%Z).
Notation "'0x32'" (* 50 (0x32) *)
  := (Const WO~0~0~1~1~0~0~1~0).
Notation "'0x33'" (* 51 (0x33) *)
  := (Const 51%Z).
Notation "'0x33'" (* 51 (0x33) *)
  := (Const WO~0~0~1~1~0~0~1~1).
Notation "'0x34'" (* 52 (0x34) *)
  := (Const 52%Z).
Notation "'0x34'" (* 52 (0x34) *)
  := (Const WO~0~0~1~1~0~1~0~0).
Notation "'0x35'" (* 53 (0x35) *)
  := (Const 53%Z).
Notation "'0x35'" (* 53 (0x35) *)
  := (Const WO~0~0~1~1~0~1~0~1).
Notation "'0x36'" (* 54 (0x36) *)
  := (Const 54%Z).
Notation "'0x36'" (* 54 (0x36) *)
  := (Const WO~0~0~1~1~0~1~1~0).
Notation "'0x37'" (* 55 (0x37) *)
  := (Const 55%Z).
Notation "'0x37'" (* 55 (0x37) *)
  := (Const WO~0~0~1~1~0~1~1~1).
Notation "'0x38'" (* 56 (0x38) *)
  := (Const 56%Z).
Notation "'0x38'" (* 56 (0x38) *)
  := (Const WO~0~0~1~1~1~0~0~0).
Notation "'0x39'" (* 57 (0x39) *)
  := (Const 57%Z).
Notation "'0x39'" (* 57 (0x39) *)
  := (Const WO~0~0~1~1~1~0~0~1).
Notation "'0x3a'" (* 58 (0x3a) *)
  := (Const 58%Z).
Notation "'0x3a'" (* 58 (0x3a) *)
  := (Const WO~0~0~1~1~1~0~1~0).
Notation "'0x3b'" (* 59 (0x3b) *)
  := (Const 59%Z).
Notation "'0x3b'" (* 59 (0x3b) *)
  := (Const WO~0~0~1~1~1~0~1~1).
Notation "'0x3c'" (* 60 (0x3c) *)
  := (Const 60%Z).
Notation "'0x3c'" (* 60 (0x3c) *)
  := (Const WO~0~0~1~1~1~1~0~0).
Notation "'0x3d'" (* 61 (0x3d) *)
  := (Const 61%Z).
Notation "'0x3d'" (* 61 (0x3d) *)
  := (Const WO~0~0~1~1~1~1~0~1).
Notation "'0x3e'" (* 62 (0x3e) *)
  := (Const 62%Z).
Notation "'0x3e'" (* 62 (0x3e) *)
  := (Const WO~0~0~1~1~1~1~1~0).
Notation "'0x3f'" (* 63 (0x3f) *)
  := (Const 63%Z).
Notation "'0x3f'" (* 63 (0x3f) *)
  := (Const WO~0~0~1~1~1~1~1~1).
Notation "'0x40'" (* 64 (0x40) *)
  := (Const 64%Z).
Notation "'0x40'" (* 64 (0x40) *)
  := (Const WO~0~1~0~0~0~0~0~0).
Notation "'0x41'" (* 65 (0x41) *)
  := (Const 65%Z).
Notation "'0x41'" (* 65 (0x41) *)
  := (Const WO~0~1~0~0~0~0~0~1).
Notation "'0x42'" (* 66 (0x42) *)
  := (Const 66%Z).
Notation "'0x42'" (* 66 (0x42) *)
  := (Const WO~0~1~0~0~0~0~1~0).
Notation "'0x43'" (* 67 (0x43) *)
  := (Const 67%Z).
Notation "'0x43'" (* 67 (0x43) *)
  := (Const WO~0~1~0~0~0~0~1~1).
Notation "'0x44'" (* 68 (0x44) *)
  := (Const 68%Z).
Notation "'0x44'" (* 68 (0x44) *)
  := (Const WO~0~1~0~0~0~1~0~0).
Notation "'0x45'" (* 69 (0x45) *)
  := (Const 69%Z).
Notation "'0x45'" (* 69 (0x45) *)
  := (Const WO~0~1~0~0~0~1~0~1).
Notation "'0x46'" (* 70 (0x46) *)
  := (Const 70%Z).
Notation "'0x46'" (* 70 (0x46) *)
  := (Const WO~0~1~0~0~0~1~1~0).
Notation "'0x47'" (* 71 (0x47) *)
  := (Const 71%Z).
Notation "'0x47'" (* 71 (0x47) *)
  := (Const WO~0~1~0~0~0~1~1~1).
Notation "'0x48'" (* 72 (0x48) *)
  := (Const 72%Z).
Notation "'0x48'" (* 72 (0x48) *)
  := (Const WO~0~1~0~0~1~0~0~0).
Notation "'0x49'" (* 73 (0x49) *)
  := (Const 73%Z).
Notation "'0x49'" (* 73 (0x49) *)
  := (Const WO~0~1~0~0~1~0~0~1).
Notation "'0x4a'" (* 74 (0x4a) *)
  := (Const 74%Z).
Notation "'0x4a'" (* 74 (0x4a) *)
  := (Const WO~0~1~0~0~1~0~1~0).
Notation "'0x4b'" (* 75 (0x4b) *)
  := (Const 75%Z).
Notation "'0x4b'" (* 75 (0x4b) *)
  := (Const WO~0~1~0~0~1~0~1~1).
Notation "'0x4c'" (* 76 (0x4c) *)
  := (Const 76%Z).
Notation "'0x4c'" (* 76 (0x4c) *)
  := (Const WO~0~1~0~0~1~1~0~0).
Notation "'0x4d'" (* 77 (0x4d) *)
  := (Const 77%Z).
Notation "'0x4d'" (* 77 (0x4d) *)
  := (Const WO~0~1~0~0~1~1~0~1).
Notation "'0x4e'" (* 78 (0x4e) *)
  := (Const 78%Z).
Notation "'0x4e'" (* 78 (0x4e) *)
  := (Const WO~0~1~0~0~1~1~1~0).
Notation "'0x4f'" (* 79 (0x4f) *)
  := (Const 79%Z).
Notation "'0x4f'" (* 79 (0x4f) *)
  := (Const WO~0~1~0~0~1~1~1~1).
Notation "'0x50'" (* 80 (0x50) *)
  := (Const 80%Z).
Notation "'0x50'" (* 80 (0x50) *)
  := (Const WO~0~1~0~1~0~0~0~0).
Notation "'0x51'" (* 81 (0x51) *)
  := (Const 81%Z).
Notation "'0x51'" (* 81 (0x51) *)
  := (Const WO~0~1~0~1~0~0~0~1).
Notation "'0x52'" (* 82 (0x52) *)
  := (Const 82%Z).
Notation "'0x52'" (* 82 (0x52) *)
  := (Const WO~0~1~0~1~0~0~1~0).
Notation "'0x53'" (* 83 (0x53) *)
  := (Const 83%Z).
Notation "'0x53'" (* 83 (0x53) *)
  := (Const WO~0~1~0~1~0~0~1~1).
Notation "'0x54'" (* 84 (0x54) *)
  := (Const 84%Z).
Notation "'0x54'" (* 84 (0x54) *)
  := (Const WO~0~1~0~1~0~1~0~0).
Notation "'0x55'" (* 85 (0x55) *)
  := (Const 85%Z).
Notation "'0x55'" (* 85 (0x55) *)
  := (Const WO~0~1~0~1~0~1~0~1).
Notation "'0x56'" (* 86 (0x56) *)
  := (Const 86%Z).
Notation "'0x56'" (* 86 (0x56) *)
  := (Const WO~0~1~0~1~0~1~1~0).
Notation "'0x57'" (* 87 (0x57) *)
  := (Const 87%Z).
Notation "'0x57'" (* 87 (0x57) *)
  := (Const WO~0~1~0~1~0~1~1~1).
Notation "'0x58'" (* 88 (0x58) *)
  := (Const 88%Z).
Notation "'0x58'" (* 88 (0x58) *)
  := (Const WO~0~1~0~1~1~0~0~0).
Notation "'0x59'" (* 89 (0x59) *)
  := (Const 89%Z).
Notation "'0x59'" (* 89 (0x59) *)
  := (Const WO~0~1~0~1~1~0~0~1).
Notation "'0x5a'" (* 90 (0x5a) *)
  := (Const 90%Z).
Notation "'0x5a'" (* 90 (0x5a) *)
  := (Const WO~0~1~0~1~1~0~1~0).
Notation "'0x5b'" (* 91 (0x5b) *)
  := (Const 91%Z).
Notation "'0x5b'" (* 91 (0x5b) *)
  := (Const WO~0~1~0~1~1~0~1~1).
Notation "'0x5c'" (* 92 (0x5c) *)
  := (Const 92%Z).
Notation "'0x5c'" (* 92 (0x5c) *)
  := (Const WO~0~1~0~1~1~1~0~0).
Notation "'0x5d'" (* 93 (0x5d) *)
  := (Const 93%Z).
Notation "'0x5d'" (* 93 (0x5d) *)
  := (Const WO~0~1~0~1~1~1~0~1).
Notation "'0x5e'" (* 94 (0x5e) *)
  := (Const 94%Z).
Notation "'0x5e'" (* 94 (0x5e) *)
  := (Const WO~0~1~0~1~1~1~1~0).
Notation "'0x5f'" (* 95 (0x5f) *)
  := (Const 95%Z).
Notation "'0x5f'" (* 95 (0x5f) *)
  := (Const WO~0~1~0~1~1~1~1~1).
Notation "'0x60'" (* 96 (0x60) *)
  := (Const 96%Z).
Notation "'0x60'" (* 96 (0x60) *)
  := (Const WO~0~1~1~0~0~0~0~0).
Notation "'0x61'" (* 97 (0x61) *)
  := (Const 97%Z).
Notation "'0x61'" (* 97 (0x61) *)
  := (Const WO~0~1~1~0~0~0~0~1).
Notation "'0x62'" (* 98 (0x62) *)
  := (Const 98%Z).
Notation "'0x62'" (* 98 (0x62) *)
  := (Const WO~0~1~1~0~0~0~1~0).
Notation "'0x63'" (* 99 (0x63) *)
  := (Const 99%Z).
Notation "'0x63'" (* 99 (0x63) *)
  := (Const WO~0~1~1~0~0~0~1~1).
Notation "'0x64'" (* 100 (0x64) *)
  := (Const 100%Z).
Notation "'0x64'" (* 100 (0x64) *)
  := (Const WO~0~1~1~0~0~1~0~0).
Notation "'0x65'" (* 101 (0x65) *)
  := (Const 101%Z).
Notation "'0x65'" (* 101 (0x65) *)
  := (Const WO~0~1~1~0~0~1~0~1).
Notation "'0x66'" (* 102 (0x66) *)
  := (Const 102%Z).
Notation "'0x66'" (* 102 (0x66) *)
  := (Const WO~0~1~1~0~0~1~1~0).
Notation "'0x67'" (* 103 (0x67) *)
  := (Const 103%Z).
Notation "'0x67'" (* 103 (0x67) *)
  := (Const WO~0~1~1~0~0~1~1~1).
Notation "'0x68'" (* 104 (0x68) *)
  := (Const 104%Z).
Notation "'0x68'" (* 104 (0x68) *)
  := (Const WO~0~1~1~0~1~0~0~0).
Notation "'0x69'" (* 105 (0x69) *)
  := (Const 105%Z).
Notation "'0x69'" (* 105 (0x69) *)
  := (Const WO~0~1~1~0~1~0~0~1).
Notation "'0x6a'" (* 106 (0x6a) *)
  := (Const 106%Z).
Notation "'0x6a'" (* 106 (0x6a) *)
  := (Const WO~0~1~1~0~1~0~1~0).
Notation "'0x6b'" (* 107 (0x6b) *)
  := (Const 107%Z).
Notation "'0x6b'" (* 107 (0x6b) *)
  := (Const WO~0~1~1~0~1~0~1~1).
Notation "'0x6c'" (* 108 (0x6c) *)
  := (Const 108%Z).
Notation "'0x6c'" (* 108 (0x6c) *)
  := (Const WO~0~1~1~0~1~1~0~0).
Notation "'0x6d'" (* 109 (0x6d) *)
  := (Const 109%Z).
Notation "'0x6d'" (* 109 (0x6d) *)
  := (Const WO~0~1~1~0~1~1~0~1).
Notation "'0x6e'" (* 110 (0x6e) *)
  := (Const 110%Z).
Notation "'0x6e'" (* 110 (0x6e) *)
  := (Const WO~0~1~1~0~1~1~1~0).
Notation "'0x6f'" (* 111 (0x6f) *)
  := (Const 111%Z).
Notation "'0x6f'" (* 111 (0x6f) *)
  := (Const WO~0~1~1~0~1~1~1~1).
Notation "'0x70'" (* 112 (0x70) *)
  := (Const 112%Z).
Notation "'0x70'" (* 112 (0x70) *)
  := (Const WO~0~1~1~1~0~0~0~0).
Notation "'0x71'" (* 113 (0x71) *)
  := (Const 113%Z).
Notation "'0x71'" (* 113 (0x71) *)
  := (Const WO~0~1~1~1~0~0~0~1).
Notation "'0x72'" (* 114 (0x72) *)
  := (Const 114%Z).
Notation "'0x72'" (* 114 (0x72) *)
  := (Const WO~0~1~1~1~0~0~1~0).
Notation "'0x73'" (* 115 (0x73) *)
  := (Const 115%Z).
Notation "'0x73'" (* 115 (0x73) *)
  := (Const WO~0~1~1~1~0~0~1~1).
Notation "'0x74'" (* 116 (0x74) *)
  := (Const 116%Z).
Notation "'0x74'" (* 116 (0x74) *)
  := (Const WO~0~1~1~1~0~1~0~0).
Notation "'0x75'" (* 117 (0x75) *)
  := (Const 117%Z).
Notation "'0x75'" (* 117 (0x75) *)
  := (Const WO~0~1~1~1~0~1~0~1).
Notation "'0x76'" (* 118 (0x76) *)
  := (Const 118%Z).
Notation "'0x76'" (* 118 (0x76) *)
  := (Const WO~0~1~1~1~0~1~1~0).
Notation "'0x77'" (* 119 (0x77) *)
  := (Const 119%Z).
Notation "'0x77'" (* 119 (0x77) *)
  := (Const WO~0~1~1~1~0~1~1~1).
Notation "'0x78'" (* 120 (0x78) *)
  := (Const 120%Z).
Notation "'0x78'" (* 120 (0x78) *)
  := (Const WO~0~1~1~1~1~0~0~0).
Notation "'0x79'" (* 121 (0x79) *)
  := (Const 121%Z).
Notation "'0x79'" (* 121 (0x79) *)
  := (Const WO~0~1~1~1~1~0~0~1).
Notation "'0x7a'" (* 122 (0x7a) *)
  := (Const 122%Z).
Notation "'0x7a'" (* 122 (0x7a) *)
  := (Const WO~0~1~1~1~1~0~1~0).
Notation "'0x7b'" (* 123 (0x7b) *)
  := (Const 123%Z).
Notation "'0x7b'" (* 123 (0x7b) *)
  := (Const WO~0~1~1~1~1~0~1~1).
Notation "'0x7c'" (* 124 (0x7c) *)
  := (Const 124%Z).
Notation "'0x7c'" (* 124 (0x7c) *)
  := (Const WO~0~1~1~1~1~1~0~0).
Notation "'0x7d'" (* 125 (0x7d) *)
  := (Const 125%Z).
Notation "'0x7d'" (* 125 (0x7d) *)
  := (Const WO~0~1~1~1~1~1~0~1).
Notation "'0x7e'" (* 126 (0x7e) *)
  := (Const 126%Z).
Notation "'0x7e'" (* 126 (0x7e) *)
  := (Const WO~0~1~1~1~1~1~1~0).
Notation "'0x7f'" (* 127 (0x7f) *)
  := (Const 127%Z).
Notation "'0x7f'" (* 127 (0x7f) *)
  := (Const WO~0~1~1~1~1~1~1~1).
Notation "'0x80'" (* 128 (0x80) *)
  := (Const 128%Z).
Notation "'0x80'" (* 128 (0x80) *)
  := (Const WO~1~0~0~0~0~0~0~0).
Notation "'0x81'" (* 129 (0x81) *)
  := (Const 129%Z).
Notation "'0x81'" (* 129 (0x81) *)
  := (Const WO~1~0~0~0~0~0~0~1).
Notation "'0xbb'" (* 187 (0xbb) *)
  := (Const 187%Z).
Notation "'0xbb'" (* 187 (0xbb) *)
  := (Const WO~1~0~1~1~1~0~1~1).
Notation "'0xbd'" (* 189 (0xbd) *)
  := (Const 189%Z).
Notation "'0xbd'" (* 189 (0xbd) *)
  := (Const WO~1~0~1~1~1~1~0~1).
Notation "'0xff'" (* 255 (0xff) *)
  := (Const 255%Z).
Notation "'0xff'" (* 255 (0xff) *)
  := (Const WO~1~1~1~1~1~1~1~1).
Notation "'0x100'" (* 256 (0x100) *)
  := (Const 256%Z).
Notation "'0x100'" (* 256 (0x100) *)
  := (Const WO~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0).
Notation "'0x101'" (* 257 (0x101) *)
  := (Const 257%Z).
Notation "'0x101'" (* 257 (0x101) *)
  := (Const WO~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~1).
Notation "'0x13d'" (* 317 (0x13d) *)
  := (Const 317%Z).
Notation "'0x13d'" (* 317 (0x13d) *)
  := (Const WO~0~0~0~0~0~0~0~1~0~0~1~1~1~1~0~1).
Notation "'0x1e1'" (* 481 (0x1e1) *)
  := (Const 481%Z).
Notation "'0x1e1'" (* 481 (0x1e1) *)
  := (Const WO~0~0~0~0~0~0~0~1~1~1~1~0~0~0~0~1).
Notation "'0x1ff'" (* 511 (0x1ff) *)
  := (Const 511%Z).
Notation "'0x1ff'" (* 511 (0x1ff) *)
  := (Const WO~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1).
Notation "'0x200'" (* 512 (0x200) *)
  := (Const 512%Z).
Notation "'0x200'" (* 512 (0x200) *)
  := (Const WO~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0).
Notation "'0x201'" (* 513 (0x201) *)
  := (Const 513%Z).
Notation "'0x201'" (* 513 (0x201) *)
  := (Const WO~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~1).
Notation "'0x239'" (* 569 (0x239) *)
  := (Const 569%Z).
Notation "'0x239'" (* 569 (0x239) *)
  := (Const WO~0~0~0~0~0~0~1~0~0~0~1~1~1~0~0~1).
Notation "'0x2fd'" (* 765 (0x2fd) *)
  := (Const 765%Z).
Notation "'0x2fd'" (* 765 (0x2fd) *)
  := (Const WO~0~0~0~0~0~0~1~0~1~1~1~1~1~1~0~1).
Notation "'0x3ff'" (* 1023 (0x3ff) *)
  := (Const 1023%Z).
Notation "'0x3ff'" (* 1023 (0x3ff) *)
  := (Const WO~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400'" (* 1024 (0x400) *)
  := (Const 1024%Z).
Notation "'0x400'" (* 1024 (0x400) *)
  := (Const WO~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0).
Notation "'0x401'" (* 1025 (0x401) *)
  := (Const 1025%Z).
Notation "'0x401'" (* 1025 (0x401) *)
  := (Const WO~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ff'" (* 2047 (0x7ff) *)
  := (Const 2047%Z).
Notation "'0x7ff'" (* 2047 (0x7ff) *)
  := (Const WO~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800'" (* 2048 (0x800) *)
  := (Const 2048%Z).
Notation "'0x800'" (* 2048 (0x800) *)
  := (Const WO~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x801'" (* 2049 (0x801) *)
  := (Const 2049%Z).
Notation "'0x801'" (* 2049 (0x801) *)
  := (Const WO~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfff'" (* 4095 (0xfff) *)
  := (Const 4095%Z).
Notation "'0xfff'" (* 4095 (0xfff) *)
  := (Const WO~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000'" (* 4096 (0x1000) *)
  := (Const 4096%Z).
Notation "'0x1000'" (* 4096 (0x1000) *)
  := (Const WO~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1001'" (* 4097 (0x1001) *)
  := (Const 4097%Z).
Notation "'0x1001'" (* 4097 (0x1001) *)
  := (Const WO~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fff'" (* 8191 (0x1fff) *)
  := (Const 8191%Z).
Notation "'0x1fff'" (* 8191 (0x1fff) *)
  := (Const WO~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000'" (* 8192 (0x2000) *)
  := (Const 8192%Z).
Notation "'0x2000'" (* 8192 (0x2000) *)
  := (Const WO~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2001'" (* 8193 (0x2001) *)
  := (Const 8193%Z).
Notation "'0x2001'" (* 8193 (0x2001) *)
  := (Const WO~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fff'" (* 16383 (0x3fff) *)
  := (Const 16383%Z).
Notation "'0x3fff'" (* 16383 (0x3fff) *)
  := (Const WO~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000'" (* 16384 (0x4000) *)
  := (Const 16384%Z).
Notation "'0x4000'" (* 16384 (0x4000) *)
  := (Const WO~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4001'" (* 16385 (0x4001) *)
  := (Const 16385%Z).
Notation "'0x4001'" (* 16385 (0x4001) *)
  := (Const WO~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fff'" (* 32767 (0x7fff) *)
  := (Const 32767%Z).
Notation "'0x7fff'" (* 32767 (0x7fff) *)
  := (Const WO~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000'" (* 32768 (0x8000) *)
  := (Const 32768%Z).
Notation "'0x8000'" (* 32768 (0x8000) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8001'" (* 32769 (0x8001) *)
  := (Const 32769%Z).
Notation "'0x8001'" (* 32769 (0x8001) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffff'" (* 65535 (0xffff) *)
  := (Const 65535%Z).
Notation "'0xffff'" (* 65535 (0xffff) *)
  := (Const WO~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000'" (* 65536 (0x10000) *)
  := (Const 65536%Z).
Notation "'0x10000'" (* 65536 (0x10000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10001'" (* 65537 (0x10001) *)
  := (Const 65537%Z).
Notation "'0x10001'" (* 65537 (0x10001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1bfff'" (* 114687 (0x1bfff) *)
  := (Const 114687%Z).
Notation "'0x1bfff'" (* 114687 (0x1bfff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1db41'" (* 121665 (0x1db41) *)
  := (Const 121665%Z).
Notation "'0x1db41'" (* 121665 (0x1db41) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~0~1~1~0~1~1~0~1~0~0~0~0~0~1).
Notation "'0x1fd03'" (* 130307 (0x1fd03) *)
  := (Const 130307%Z).
Notation "'0x1fd03'" (* 130307 (0x1fd03) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~0~1~0~0~0~0~0~0~1~1).
Notation "'0x1ffdf'" (* 131039 (0x1ffdf) *)
  := (Const 131039%Z).
Notation "'0x1ffdf'" (* 131039 (0x1ffdf) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1~1).
Notation "'0x1fffb'" (* 131067 (0x1fffb) *)
  := (Const 131067%Z).
Notation "'0x1fffb'" (* 131067 (0x1fffb) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1).
Notation "'0x1ffff'" (* 131071 (0x1ffff) *)
  := (Const 131071%Z).
Notation "'0x1ffff'" (* 131071 (0x1ffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000'" (* 131072 (0x20000) *)
  := (Const 131072%Z).
Notation "'0x20000'" (* 131072 (0x20000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20001'" (* 131073 (0x20001) *)
  := (Const 131073%Z).
Notation "'0x20001'" (* 131073 (0x20001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fc2f'" (* 261167 (0x3fc2f) *)
  := (Const 261167%Z).
Notation "'0x3fc2f'" (* 261167 (0x3fc2f) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~0~0~0~0~1~0~1~1~1~1).
Notation "'0x3fdc7'" (* 261575 (0x3fdc7) *)
  := (Const 261575%Z).
Notation "'0x3fdc7'" (* 261575 (0x3fdc7) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~0~1~1~1~0~0~0~1~1~1).
Notation "'0x3fff3'" (* 262131 (0x3fff3) *)
  := (Const 262131%Z).
Notation "'0x3fff3'" (* 262131 (0x3fff3) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~1).
Notation "'0x3fffb'" (* 262139 (0x3fffb) *)
  := (Const 262139%Z).
Notation "'0x3fffb'" (* 262139 (0x3fffb) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1).
Notation "'0x3ffff'" (* 262143 (0x3ffff) *)
  := (Const 262143%Z).
Notation "'0x3ffff'" (* 262143 (0x3ffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000'" (* 262144 (0x40000) *)
  := (Const 262144%Z).
Notation "'0x40000'" (* 262144 (0x40000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40001'" (* 262145 (0x40001) *)
  := (Const 262145%Z).
Notation "'0x40001'" (* 262145 (0x40001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fe1f'" (* 523807 (0x7fe1f) *)
  := (Const 523807%Z).
Notation "'0x7fe1f'" (* 523807 (0x7fe1f) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~0~0~0~0~1~1~1~1~1).
Notation "'0x7ff45'" (* 524101 (0x7ff45) *)
  := (Const 524101%Z).
Notation "'0x7ff45'" (* 524101 (0x7ff45) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~0~1~0~0~0~1~0~1).
Notation "'0x7ffe7'" (* 524263 (0x7ffe7) *)
  := (Const 524263%Z).
Notation "'0x7ffe7'" (* 524263 (0x7ffe7) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~1~1).
Notation "'0x7ffed'" (* 524269 (0x7ffed) *)
  := (Const 524269%Z).
Notation "'0x7ffed'" (* 524269 (0x7ffed) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1).
Notation "'0x7ffef'" (* 524271 (0x7ffef) *)
  := (Const 524271%Z).
Notation "'0x7ffef'" (* 524271 (0x7ffef) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1).
Notation "'0x7fff7'" (* 524279 (0x7fff7) *)
  := (Const 524279%Z).
Notation "'0x7fff7'" (* 524279 (0x7fff7) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1).
Notation "'0x7ffff'" (* 524287 (0x7ffff) *)
  := (Const 524287%Z).
Notation "'0x7ffff'" (* 524287 (0x7ffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000'" (* 524288 (0x80000) *)
  := (Const 524288%Z).
Notation "'0x80000'" (* 524288 (0x80000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80001'" (* 524289 (0x80001) *)
  := (Const 524289%Z).
Notation "'0x80001'" (* 524289 (0x80001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfff97'" (* 1048471 (0xfff97) *)
  := (Const 1048471%Z).
Notation "'0xfff97'" (* 1048471 (0xfff97) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~0~1~1~1).
Notation "'0xfffe5'" (* 1048549 (0xfffe5) *)
  := (Const 1048549%Z).
Notation "'0xfffe5'" (* 1048549 (0xfffe5) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~0~1).
Notation "'0xfffed'" (* 1048557 (0xfffed) *)
  := (Const 1048557%Z).
Notation "'0xfffed'" (* 1048557 (0xfffed) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1).
Notation "'0xfffef'" (* 1048559 (0xfffef) *)
  := (Const 1048559%Z).
Notation "'0xfffef'" (* 1048559 (0xfffef) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1).
Notation "'0xffffd'" (* 1048573 (0xffffd) *)
  := (Const 1048573%Z).
Notation "'0xffffd'" (* 1048573 (0xffffd) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1).
Notation "'0xfffff'" (* 1048575 (0xfffff) *)
  := (Const 1048575%Z).
Notation "'0xfffff'" (* 1048575 (0xfffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000'" (* 1048576 (0x100000) *)
  := (Const 1048576%Z).
Notation "'0x100000'" (* 1048576 (0x100000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100001'" (* 1048577 (0x100001) *)
  := (Const 1048577%Z).
Notation "'0x100001'" (* 1048577 (0x100001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffc00'" (* 2096128 (0x1ffc00) *)
  := (Const 2096128%Z).
Notation "'0x1ffc00'" (* 2096128 (0x1ffc00) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1fffe7'" (* 2097127 (0x1fffe7) *)
  := (Const 2097127%Z).
Notation "'0x1fffe7'" (* 2097127 (0x1fffe7) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~1~1).
Notation "'0x1fffef'" (* 2097135 (0x1fffef) *)
  := (Const 2097135%Z).
Notation "'0x1fffef'" (* 2097135 (0x1fffef) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1).
Notation "'0x1ffff7'" (* 2097143 (0x1ffff7) *)
  := (Const 2097143%Z).
Notation "'0x1ffff7'" (* 2097143 (0x1ffff7) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1).
Notation "'0x1fffff'" (* 2097151 (0x1fffff) *)
  := (Const 2097151%Z).
Notation "'0x1fffff'" (* 2097151 (0x1fffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000'" (* 2097152 (0x200000) *)
  := (Const 2097152%Z).
Notation "'0x200000'" (* 2097152 (0x200000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200001'" (* 2097153 (0x200001) *)
  := (Const 2097153%Z).
Notation "'0x200001'" (* 2097153 (0x200001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffec3'" (* 4193987 (0x3ffec3) *)
  := (Const 4193987%Z).
Notation "'0x3ffec3'" (* 4193987 (0x3ffec3) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~0~0~0~1~1).
Notation "'0x3fff43'" (* 4194115 (0x3fff43) *)
  := (Const 4194115%Z).
Notation "'0x3fff43'" (* 4194115 (0x3fff43) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~0~0~0~0~1~1).
Notation "'0x3fffe3'" (* 4194275 (0x3fffe3) *)
  := (Const 4194275%Z).
Notation "'0x3fffe3'" (* 4194275 (0x3fffe3) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~1~1).
Notation "'0x3fffe7'" (* 4194279 (0x3fffe7) *)
  := (Const 4194279%Z).
Notation "'0x3fffe7'" (* 4194279 (0x3fffe7) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~1~1).
Notation "'0x3fffed'" (* 4194285 (0x3fffed) *)
  := (Const 4194285%Z).
Notation "'0x3fffed'" (* 4194285 (0x3fffed) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1).
Notation "'0x3fffef'" (* 4194287 (0x3fffef) *)
  := (Const 4194287%Z).
Notation "'0x3fffef'" (* 4194287 (0x3fffef) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1).
Notation "'0x3ffff5'" (* 4194293 (0x3ffff5) *)
  := (Const 4194293%Z).
Notation "'0x3ffff5'" (* 4194293 (0x3ffff5) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~0~1).
Notation "'0x3fffff'" (* 4194303 (0x3fffff) *)
  := (Const 4194303%Z).
Notation "'0x3fffff'" (* 4194303 (0x3fffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000'" (* 4194304 (0x400000) *)
  := (Const 4194304%Z).
Notation "'0x400000'" (* 4194304 (0x400000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400001'" (* 4194305 (0x400001) *)
  := (Const 4194305%Z).
Notation "'0x400001'" (* 4194305 (0x400001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fff8b'" (* 8388491 (0x7fff8b) *)
  := (Const 8388491%Z).
Notation "'0x7fff8b'" (* 8388491 (0x7fff8b) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~1~0~1~1).
Notation "'0x7fffe1'" (* 8388577 (0x7fffe1) *)
  := (Const 8388577%Z).
Notation "'0x7fffe1'" (* 8388577 (0x7fffe1) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~0~1).
Notation "'0x7fffe5'" (* 8388581 (0x7fffe5) *)
  := (Const 8388581%Z).
Notation "'0x7fffe5'" (* 8388581 (0x7fffe5) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~0~1).
Notation "'0x7fffef'" (* 8388591 (0x7fffef) *)
  := (Const 8388591%Z).
Notation "'0x7fffef'" (* 8388591 (0x7fffef) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1).
Notation "'0x7ffff7'" (* 8388599 (0x7ffff7) *)
  := (Const 8388599%Z).
Notation "'0x7ffff7'" (* 8388599 (0x7ffff7) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1).
Notation "'0x7ffffd'" (* 8388605 (0x7ffffd) *)
  := (Const 8388605%Z).
Notation "'0x7ffffd'" (* 8388605 (0x7ffffd) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1).
Notation "'0x7ffffe'" (* 8388606 (0x7ffffe) *)
  := (Const 8388606%Z).
Notation "'0x7ffffe'" (* 8388606 (0x7ffffe) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0x7fffff'" (* 8388607 (0x7fffff) *)
  := (Const 8388607%Z).
Notation "'0x7fffff'" (* 8388607 (0x7fffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000'" (* 8388608 (0x800000) *)
  := (Const 8388608%Z).
Notation "'0x800000'" (* 8388608 (0x800000) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800001'" (* 8388609 (0x800001) *)
  := (Const 8388609%Z).
Notation "'0x800001'" (* 8388609 (0x800001) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfeffff'" (* 16711679 (0xfeffff) *)
  := (Const 16711679%Z).
Notation "'0xfeffff'" (* 16711679 (0xfeffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0xfffeff'" (* 16776959 (0xfffeff) *)
  := (Const 16776959%Z).
Notation "'0xfffeff'" (* 16776959 (0xfffeff) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1~1~1~1~1).
Notation "'0xffffe7'" (* 16777191 (0xffffe7) *)
  := (Const 16777191%Z).
Notation "'0xffffe7'" (* 16777191 (0xffffe7) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~1~1).
Notation "'0xffffef'" (* 16777199 (0xffffef) *)
  := (Const 16777199%Z).
Notation "'0xffffef'" (* 16777199 (0xffffef) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1).
Notation "'0xfffff1'" (* 16777201 (0xfffff1) *)
  := (Const 16777201%Z).
Notation "'0xfffff1'" (* 16777201 (0xfffff1) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~1).
Notation "'0xfffffd'" (* 16777213 (0xfffffd) *)
  := (Const 16777213%Z).
Notation "'0xfffffd'" (* 16777213 (0xfffffd) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1).
Notation "'0xffffff'" (* 16777215 (0xffffff) *)
  := (Const 16777215%Z).
Notation "'0xffffff'" (* 16777215 (0xffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000'" (* 16777216 (0x1000000) *)
  := (Const 16777216%Z).
Notation "'0x1000000'" (* 16777216 (0x1000000) *)
  := (Const WO~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000001'" (* 16777217 (0x1000001) *)
  := (Const 16777217%Z).
Notation "'0x1000001'" (* 16777217 (0x1000001) *)
  := (Const WO~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffed'" (* 33554413 (0x1ffffed) *)
  := (Const 33554413%Z).
Notation "'0x1ffffed'" (* 33554413 (0x1ffffed) *)
  := (Const WO~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1).
Notation "'0x1fffff1'" (* 33554417 (0x1fffff1) *)
  := (Const 33554417%Z).
Notation "'0x1fffff1'" (* 33554417 (0x1fffff1) *)
  := (Const WO~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~1).
Notation "'0x1fffffd'" (* 33554429 (0x1fffffd) *)
  := (Const 33554429%Z).
Notation "'0x1fffffd'" (* 33554429 (0x1fffffd) *)
  := (Const WO~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1).
Notation "'0x1ffffff'" (* 33554431 (0x1ffffff) *)
  := (Const 33554431%Z).
Notation "'0x1ffffff'" (* 33554431 (0x1ffffff) *)
  := (Const WO~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000'" (* 33554432 (0x2000000) *)
  := (Const 33554432%Z).
Notation "'0x2000000'" (* 33554432 (0x2000000) *)
  := (Const WO~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000001'" (* 33554433 (0x2000001) *)
  := (Const 33554433%Z).
Notation "'0x2000001'" (* 33554433 (0x2000001) *)
  := (Const WO~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffe1'" (* 67108833 (0x3ffffe1) *)
  := (Const 67108833%Z).
Notation "'0x3ffffe1'" (* 67108833 (0x3ffffe1) *)
  := (Const WO~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~0~1).
Notation "'0x3fffff7'" (* 67108855 (0x3fffff7) *)
  := (Const 67108855%Z).
Notation "'0x3fffff7'" (* 67108855 (0x3fffff7) *)
  := (Const WO~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1).
Notation "'0x3fffffb'" (* 67108859 (0x3fffffb) *)
  := (Const 67108859%Z).
Notation "'0x3fffffb'" (* 67108859 (0x3fffffb) *)
  := (Const WO~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1).
Notation "'0x3fffffd'" (* 67108861 (0x3fffffd) *)
  := (Const 67108861%Z).
Notation "'0x3fffffd'" (* 67108861 (0x3fffffd) *)
  := (Const WO~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1).
Notation "'0x3fffffe'" (* 67108862 (0x3fffffe) *)
  := (Const 67108862%Z).
Notation "'0x3fffffe'" (* 67108862 (0x3fffffe) *)
  := (Const WO~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0x3ffffff'" (* 67108863 (0x3ffffff) *)
  := (Const 67108863%Z).
Notation "'0x3ffffff'" (* 67108863 (0x3ffffff) *)
  := (Const WO~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000'" (* 67108864 (0x4000000) *)
  := (Const 67108864%Z).
Notation "'0x4000000'" (* 67108864 (0x4000000) *)
  := (Const WO~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000001'" (* 67108865 (0x4000001) *)
  := (Const 67108865%Z).
Notation "'0x4000001'" (* 67108865 (0x4000001) *)
  := (Const WO~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffda'" (* 134217690 (0x7ffffda) *)
  := (Const 134217690%Z).
Notation "'0x7ffffda'" (* 134217690 (0x7ffffda) *)
  := (Const WO~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1~0).
Notation "'0x7ffffee'" (* 134217710 (0x7ffffee) *)
  := (Const 134217710%Z).
Notation "'0x7ffffee'" (* 134217710 (0x7ffffee) *)
  := (Const WO~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~0).
Notation "'0x7fffffe'" (* 134217726 (0x7fffffe) *)
  := (Const 134217726%Z).
Notation "'0x7fffffe'" (* 134217726 (0x7fffffe) *)
  := (Const WO~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0x7ffffff'" (* 134217727 (0x7ffffff) *)
  := (Const 134217727%Z).
Notation "'0x7ffffff'" (* 134217727 (0x7ffffff) *)
  := (Const WO~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000'" (* 134217728 (0x8000000) *)
  := (Const 134217728%Z).
Notation "'0x8000000'" (* 134217728 (0x8000000) *)
  := (Const WO~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000001'" (* 134217729 (0x8000001) *)
  := (Const 134217729%Z).
Notation "'0x8000001'" (* 134217729 (0x8000001) *)
  := (Const WO~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffff000'" (* 268431360 (0xffff000) *)
  := (Const 268431360%Z).
Notation "'0xffff000'" (* 268431360 (0xffff000) *)
  := (Const WO~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0xffffffe'" (* 268435454 (0xffffffe) *)
  := (Const 268435454%Z).
Notation "'0xffffffe'" (* 268435454 (0xffffffe) *)
  := (Const WO~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0xfffffff'" (* 268435455 (0xfffffff) *)
  := (Const 268435455%Z).
Notation "'0xfffffff'" (* 268435455 (0xfffffff) *)
  := (Const WO~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000'" (* 268435456 (0x10000000) *)
  := (Const 268435456%Z).
Notation "'0x10000000'" (* 268435456 (0x10000000) *)
  := (Const WO~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000001'" (* 268435457 (0x10000001) *)
  := (Const 268435457%Z).
Notation "'0x10000001'" (* 268435457 (0x10000001) *)
  := (Const WO~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffed'" (* 536870893 (0x1fffffed) *)
  := (Const 536870893%Z).
Notation "'0x1fffffed'" (* 536870893 (0x1fffffed) *)
  := (Const WO~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1).
Notation "'0x1ffffffa'" (* 536870906 (0x1ffffffa) *)
  := (Const 536870906%Z).
Notation "'0x1ffffffa'" (* 536870906 (0x1ffffffa) *)
  := (Const WO~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~0).
Notation "'0x1ffffffe'" (* 536870910 (0x1ffffffe) *)
  := (Const 536870910%Z).
Notation "'0x1ffffffe'" (* 536870910 (0x1ffffffe) *)
  := (Const WO~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0x1fffffff'" (* 536870911 (0x1fffffff) *)
  := (Const 536870911%Z).
Notation "'0x1fffffff'" (* 536870911 (0x1fffffff) *)
  := (Const WO~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000'" (* 536870912 (0x20000000) *)
  := (Const 536870912%Z).
Notation "'0x20000000'" (* 536870912 (0x20000000) *)
  := (Const WO~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000001'" (* 536870913 (0x20000001) *)
  := (Const 536870913%Z).
Notation "'0x20000001'" (* 536870913 (0x20000001) *)
  := (Const WO~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffe'" (* 1073741822 (0x3ffffffe) *)
  := (Const 1073741822%Z).
Notation "'0x3ffffffe'" (* 1073741822 (0x3ffffffe) *)
  := (Const WO~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0x3fffffff'" (* 1073741823 (0x3fffffff) *)
  := (Const 1073741823%Z).
Notation "'0x3fffffff'" (* 1073741823 (0x3fffffff) *)
  := (Const WO~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000'" (* 1073741824 (0x40000000) *)
  := (Const 1073741824%Z).
Notation "'0x40000000'" (* 1073741824 (0x40000000) *)
  := (Const WO~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000001'" (* 1073741825 (0x40000001) *)
  := (Const 1073741825%Z).
Notation "'0x40000001'" (* 1073741825 (0x40000001) *)
  := (Const WO~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffff'" (* 2147483647 (0x7fffffff) *)
  := (Const 2147483647%Z).
Notation "'0x7fffffff'" (* 2147483647 (0x7fffffff) *)
  := (Const WO~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000'" (* 2147483648 (0x80000000) *)
  := (Const 2147483648%Z).
Notation "'0x80000000'" (* 2147483648 (0x80000000) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000001'" (* 2147483649 (0x80000001) *)
  := (Const 2147483649%Z).
Notation "'0x80000001'" (* 2147483649 (0x80000001) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffff43'" (* 4294967107 (0xffffff43) *)
  := (Const 4294967107%Z).
Notation "'0xffffff43'" (* 4294967107 (0xffffff43) *)
  := (Const WO~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~0~0~0~0~1~1).
Notation "'0xffffffe7'" (* 4294967271 (0xffffffe7) *)
  := (Const 4294967271%Z).
Notation "'0xffffffe7'" (* 4294967271 (0xffffffe7) *)
  := (Const WO~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~1~1).
Notation "'0xfffffffe'" (* 4294967294 (0xfffffffe) *)
  := (Const 4294967294%Z).
Notation "'0xfffffffe'" (* 4294967294 (0xfffffffe) *)
  := (Const WO~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0xffffffff'" (* 4294967295 (0xffffffff) *)
  := (Const 4294967295%Z).
Notation "'0xffffffff'" (* 4294967295 (0xffffffff) *)
  := (Const WO~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000'" (* 4294967296 (0x100000000) *)
  := (Const 4294967296%Z).
Notation "'0x100000000'" (* 4294967296 (0x100000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000001'" (* 4294967297 (0x100000001) *)
  := (Const 4294967297%Z).
Notation "'0x100000001'" (* 4294967297 (0x100000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffdf'" (* 8589934559 (0x1ffffffdf) *)
  := (Const 8589934559%Z).
Notation "'0x1ffffffdf'" (* 8589934559 (0x1ffffffdf) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1~1).
Notation "'0x1ffffffe7'" (* 8589934567 (0x1ffffffe7) *)
  := (Const 8589934567%Z).
Notation "'0x1ffffffe7'" (* 8589934567 (0x1ffffffe7) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~1~1).
Notation "'0x1ffffffef'" (* 8589934575 (0x1ffffffef) *)
  := (Const 8589934575%Z).
Notation "'0x1ffffffef'" (* 8589934575 (0x1ffffffef) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1).
Notation "'0x1fffffffb'" (* 8589934587 (0x1fffffffb) *)
  := (Const 8589934587%Z).
Notation "'0x1fffffffb'" (* 8589934587 (0x1fffffffb) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1).
Notation "'0x1ffffffff'" (* 8589934591 (0x1ffffffff) *)
  := (Const 8589934591%Z).
Notation "'0x1ffffffff'" (* 8589934591 (0x1ffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000'" (* 8589934592 (0x200000000) *)
  := (Const 8589934592%Z).
Notation "'0x200000000'" (* 8589934592 (0x200000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000001'" (* 8589934593 (0x200000001) *)
  := (Const 8589934593%Z).
Notation "'0x200000001'" (* 8589934593 (0x200000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffff'" (* 17179869183 (0x3ffffffff) *)
  := (Const 17179869183%Z).
Notation "'0x3ffffffff'" (* 17179869183 (0x3ffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000'" (* 17179869184 (0x400000000) *)
  := (Const 17179869184%Z).
Notation "'0x400000000'" (* 17179869184 (0x400000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000001'" (* 17179869185 (0x400000001) *)
  := (Const 17179869185%Z).
Notation "'0x400000001'" (* 17179869185 (0x400000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffe5'" (* 34359738341 (0x7ffffffe5) *)
  := (Const 34359738341%Z).
Notation "'0x7ffffffe5'" (* 34359738341 (0x7ffffffe5) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~0~1).
Notation "'0x7ffffffed'" (* 34359738349 (0x7ffffffed) *)
  := (Const 34359738349%Z).
Notation "'0x7ffffffed'" (* 34359738349 (0x7ffffffed) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1).
Notation "'0x7fffffff3'" (* 34359738355 (0x7fffffff3) *)
  := (Const 34359738355%Z).
Notation "'0x7fffffff3'" (* 34359738355 (0x7fffffff3) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~1).
Notation "'0x7ffffffff'" (* 34359738367 (0x7ffffffff) *)
  := (Const 34359738367%Z).
Notation "'0x7ffffffff'" (* 34359738367 (0x7ffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000'" (* 34359738368 (0x800000000) *)
  := (Const 34359738368%Z).
Notation "'0x800000000'" (* 34359738368 (0x800000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000001'" (* 34359738369 (0x800000001) *)
  := (Const 34359738369%Z).
Notation "'0x800000001'" (* 34359738369 (0x800000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffe3'" (* 68719476707 (0xfffffffe3) *)
  := (Const 68719476707%Z).
Notation "'0xfffffffe3'" (* 68719476707 (0xfffffffe3) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~1~1).
Notation "'0xffffffff7'" (* 68719476727 (0xffffffff7) *)
  := (Const 68719476727%Z).
Notation "'0xffffffff7'" (* 68719476727 (0xffffffff7) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1).
Notation "'0xffffffffd'" (* 68719476733 (0xffffffffd) *)
  := (Const 68719476733%Z).
Notation "'0xffffffffd'" (* 68719476733 (0xffffffffd) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1).
Notation "'0xfffffffff'" (* 68719476735 (0xfffffffff) *)
  := (Const 68719476735%Z).
Notation "'0xfffffffff'" (* 68719476735 (0xfffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000'" (* 68719476736 (0x1000000000) *)
  := (Const 68719476736%Z).
Notation "'0x1000000000'" (* 68719476736 (0x1000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000001'" (* 68719476737 (0x1000000001) *)
  := (Const 68719476737%Z).
Notation "'0x1000000001'" (* 68719476737 (0x1000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffe00000'" (* 137436856320 (0x1fffe00000) *)
  := (Const 137436856320%Z).
Notation "'0x1fffe00000'" (* 137436856320 (0x1fffe00000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1ffffffe1f'" (* 137438952991 (0x1ffffffe1f) *)
  := (Const 137438952991%Z).
Notation "'0x1ffffffe1f'" (* 137438952991 (0x1ffffffe1f) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~0~1~1~1~1~1).
Notation "'0x1fffffff45'" (* 137438953285 (0x1fffffff45) *)
  := (Const 137438953285%Z).
Notation "'0x1fffffff45'" (* 137438953285 (0x1fffffff45) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~0~0~0~1~0~1).
Notation "'0x1fffffff8b'" (* 137438953355 (0x1fffffff8b) *)
  := (Const 137438953355%Z).
Notation "'0x1fffffff8b'" (* 137438953355 (0x1fffffff8b) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~1~0~1~1).
Notation "'0x1fffffffff'" (* 137438953471 (0x1fffffffff) *)
  := (Const 137438953471%Z).
Notation "'0x1fffffffff'" (* 137438953471 (0x1fffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000'" (* 137438953472 (0x2000000000) *)
  := (Const 137438953472%Z).
Notation "'0x2000000000'" (* 137438953472 (0x2000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000001'" (* 137438953473 (0x2000000001) *)
  := (Const 137438953473%Z).
Notation "'0x2000000001'" (* 137438953473 (0x2000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffef'" (* 274877906927 (0x3fffffffef) *)
  := (Const 274877906927%Z).
Notation "'0x3fffffffef'" (* 274877906927 (0x3fffffffef) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1).
Notation "'0x3ffffffff5'" (* 274877906933 (0x3ffffffff5) *)
  := (Const 274877906933%Z).
Notation "'0x3ffffffff5'" (* 274877906933 (0x3ffffffff5) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~0~1).
Notation "'0x3ffffffffb'" (* 274877906939 (0x3ffffffffb) *)
  := (Const 274877906939%Z).
Notation "'0x3ffffffffb'" (* 274877906939 (0x3ffffffffb) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1).
Notation "'0x3ffffffffd'" (* 274877906941 (0x3ffffffffd) *)
  := (Const 274877906941%Z).
Notation "'0x3ffffffffd'" (* 274877906941 (0x3ffffffffd) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1).
Notation "'0x3fffffffff'" (* 274877906943 (0x3fffffffff) *)
  := (Const 274877906943%Z).
Notation "'0x3fffffffff'" (* 274877906943 (0x3fffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000'" (* 274877906944 (0x4000000000) *)
  := (Const 274877906944%Z).
Notation "'0x4000000000'" (* 274877906944 (0x4000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000001'" (* 274877906945 (0x4000000001) *)
  := (Const 274877906945%Z).
Notation "'0x4000000001'" (* 274877906945 (0x4000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffff97'" (* 549755813783 (0x7fffffff97) *)
  := (Const 549755813783%Z).
Notation "'0x7fffffff97'" (* 549755813783 (0x7fffffff97) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~0~1~1~1).
Notation "'0x7fffffffed'" (* 549755813869 (0x7fffffffed) *)
  := (Const 549755813869%Z).
Notation "'0x7fffffffed'" (* 549755813869 (0x7fffffffed) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1).
Notation "'0x7fffffffff'" (* 549755813887 (0x7fffffffff) *)
  := (Const 549755813887%Z).
Notation "'0x7fffffffff'" (* 549755813887 (0x7fffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000'" (* 549755813888 (0x8000000000) *)
  := (Const 549755813888%Z).
Notation "'0x8000000000'" (* 549755813888 (0x8000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000001'" (* 549755813889 (0x8000000001) *)
  := (Const 549755813889%Z).
Notation "'0x8000000001'" (* 549755813889 (0x8000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffff1'" (* 1099511627761 (0xfffffffff1) *)
  := (Const 1099511627761%Z).
Notation "'0xfffffffff1'" (* 1099511627761 (0xfffffffff1) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~1).
Notation "'0xffffffffff'" (* 1099511627775 (0xffffffffff) *)
  := (Const 1099511627775%Z).
Notation "'0xffffffffff'" (* 1099511627775 (0xffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000'" (* 1099511627776 (0x10000000000) *)
  := (Const 1099511627776%Z).
Notation "'0x10000000000'" (* 1099511627776 (0x10000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000001'" (* 1099511627777 (0x10000000001) *)
  := (Const 1099511627777%Z).
Notation "'0x10000000001'" (* 1099511627777 (0x10000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x14bffffffff'" (* 1425929142271 (0x14bffffffff) *)
  := (Const 1425929142271%Z).
Notation "'0x14bffffffff'" (* 1425929142271 (0x14bffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~1~0~0~1~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1fffffffff7'" (* 2199023255543 (0x1fffffffff7) *)
  := (Const 2199023255543%Z).
Notation "'0x1fffffffff7'" (* 2199023255543 (0x1fffffffff7) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1).
Notation "'0x1ffffffffff'" (* 2199023255551 (0x1ffffffffff) *)
  := (Const 2199023255551%Z).
Notation "'0x1ffffffffff'" (* 2199023255551 (0x1ffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000'" (* 2199023255552 (0x20000000000) *)
  := (Const 2199023255552%Z).
Notation "'0x20000000000'" (* 2199023255552 (0x20000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000001'" (* 2199023255553 (0x20000000001) *)
  := (Const 2199023255553%Z).
Notation "'0x20000000001'" (* 2199023255553 (0x20000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffe7'" (* 4398046511079 (0x3ffffffffe7) *)
  := (Const 4398046511079%Z).
Notation "'0x3ffffffffe7'" (* 4398046511079 (0x3ffffffffe7) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~1~1).
Notation "'0x3fffffffffb'" (* 4398046511099 (0x3fffffffffb) *)
  := (Const 4398046511099%Z).
Notation "'0x3fffffffffb'" (* 4398046511099 (0x3fffffffffb) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1).
Notation "'0x3ffffffffff'" (* 4398046511103 (0x3ffffffffff) *)
  := (Const 4398046511103%Z).
Notation "'0x3ffffffffff'" (* 4398046511103 (0x3ffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000'" (* 4398046511104 (0x40000000000) *)
  := (Const 4398046511104%Z).
Notation "'0x40000000000'" (* 4398046511104 (0x40000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000001'" (* 4398046511105 (0x40000000001) *)
  := (Const 4398046511105%Z).
Notation "'0x40000000001'" (* 4398046511105 (0x40000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffdfffff'" (* 8796090925055 (0x7ffffdfffff) *)
  := (Const 8796090925055%Z).
Notation "'0x7ffffdfffff'" (* 8796090925055 (0x7ffffdfffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x7fffffffd03'" (* 8796093021443 (0x7fffffffd03) *)
  := (Const 8796093021443%Z).
Notation "'0x7fffffffd03'" (* 8796093021443 (0x7fffffffd03) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~0~0~0~0~0~0~1~1).
Notation "'0x7ffffffffed'" (* 8796093022189 (0x7ffffffffed) *)
  := (Const 8796093022189%Z).
Notation "'0x7ffffffffed'" (* 8796093022189 (0x7ffffffffed) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1).
Notation "'0x7fffffffff1'" (* 8796093022193 (0x7fffffffff1) *)
  := (Const 8796093022193%Z).
Notation "'0x7fffffffff1'" (* 8796093022193 (0x7fffffffff1) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~1).
Notation "'0x7ffffffffff'" (* 8796093022207 (0x7ffffffffff) *)
  := (Const 8796093022207%Z).
Notation "'0x7ffffffffff'" (* 8796093022207 (0x7ffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000'" (* 8796093022208 (0x80000000000) *)
  := (Const 8796093022208%Z).
Notation "'0x80000000000'" (* 8796093022208 (0x80000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000001'" (* 8796093022209 (0x80000000001) *)
  := (Const 8796093022209%Z).
Notation "'0x80000000001'" (* 8796093022209 (0x80000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffef'" (* 17592186044399 (0xfffffffffef) *)
  := (Const 17592186044399%Z).
Notation "'0xfffffffffef'" (* 17592186044399 (0xfffffffffef) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1).
Notation "'0xffffffffffd'" (* 17592186044413 (0xffffffffffd) *)
  := (Const 17592186044413%Z).
Notation "'0xffffffffffd'" (* 17592186044413 (0xffffffffffd) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1).
Notation "'0xfffffffffff'" (* 17592186044415 (0xfffffffffff) *)
  := (Const 17592186044415%Z).
Notation "'0xfffffffffff'" (* 17592186044415 (0xfffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000'" (* 17592186044416 (0x100000000000) *)
  := (Const 17592186044416%Z).
Notation "'0x100000000000'" (* 17592186044416 (0x100000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000001'" (* 17592186044417 (0x100000000001) *)
  := (Const 17592186044417%Z).
Notation "'0x100000000001'" (* 17592186044417 (0x100000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffd'" (* 35184372088829 (0x1ffffffffffd) *)
  := (Const 35184372088829%Z).
Notation "'0x1ffffffffffd'" (* 35184372088829 (0x1ffffffffffd) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1).
Notation "'0x1fffffffffff'" (* 35184372088831 (0x1fffffffffff) *)
  := (Const 35184372088831%Z).
Notation "'0x1fffffffffff'" (* 35184372088831 (0x1fffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000'" (* 35184372088832 (0x200000000000) *)
  := (Const 35184372088832%Z).
Notation "'0x200000000000'" (* 35184372088832 (0x200000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000001'" (* 35184372088833 (0x200000000001) *)
  := (Const 35184372088833%Z).
Notation "'0x200000000001'" (* 35184372088833 (0x200000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffff7fffff'" (* 70368735789055 (0x3fffff7fffff) *)
  := (Const 70368735789055%Z).
Notation "'0x3fffff7fffff'" (* 70368735789055 (0x3fffff7fffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x3fffffffffe5'" (* 70368744177637 (0x3fffffffffe5) *)
  := (Const 70368744177637%Z).
Notation "'0x3fffffffffe5'" (* 70368744177637 (0x3fffffffffe5) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~0~1).
Notation "'0x3fffffffffef'" (* 70368744177647 (0x3fffffffffef) *)
  := (Const 70368744177647%Z).
Notation "'0x3fffffffffef'" (* 70368744177647 (0x3fffffffffef) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1).
Notation "'0x3ffffffffffb'" (* 70368744177659 (0x3ffffffffffb) *)
  := (Const 70368744177659%Z).
Notation "'0x3ffffffffffb'" (* 70368744177659 (0x3ffffffffffb) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1).
Notation "'0x3ffffffffffd'" (* 70368744177661 (0x3ffffffffffd) *)
  := (Const 70368744177661%Z).
Notation "'0x3ffffffffffd'" (* 70368744177661 (0x3ffffffffffd) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1).
Notation "'0x3fffffffffff'" (* 70368744177663 (0x3fffffffffff) *)
  := (Const 70368744177663%Z).
Notation "'0x3fffffffffff'" (* 70368744177663 (0x3fffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000'" (* 70368744177664 (0x400000000000) *)
  := (Const 70368744177664%Z).
Notation "'0x400000000000'" (* 70368744177664 (0x400000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000001'" (* 70368744177665 (0x400000000001) *)
  := (Const 70368744177665%Z).
Notation "'0x400000000001'" (* 70368744177665 (0x400000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffe7'" (* 140737488355303 (0x7fffffffffe7) *)
  := (Const 140737488355303%Z).
Notation "'0x7fffffffffe7'" (* 140737488355303 (0x7fffffffffe7) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~1~1~1).
Notation "'0x7ffffffffff1'" (* 140737488355313 (0x7ffffffffff1) *)
  := (Const 140737488355313%Z).
Notation "'0x7ffffffffff1'" (* 140737488355313 (0x7ffffffffff1) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~1).
Notation "'0x7fffffffffff'" (* 140737488355327 (0x7fffffffffff) *)
  := (Const 140737488355327%Z).
Notation "'0x7fffffffffff'" (* 140737488355327 (0x7fffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000'" (* 140737488355328 (0x800000000000) *)
  := (Const 140737488355328%Z).
Notation "'0x800000000000'" (* 140737488355328 (0x800000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000001'" (* 140737488355329 (0x800000000001) *)
  := (Const 140737488355329%Z).
Notation "'0x800000000001'" (* 140737488355329 (0x800000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffeffffffff'" (* 281470681743359 (0xfffeffffffff) *)
  := (Const 281470681743359%Z).
Notation "'0xfffeffffffff'" (* 281470681743359 (0xfffeffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0xfffffffeffff'" (* 281474976645119 (0xfffffffeffff) *)
  := (Const 281474976645119%Z).
Notation "'0xfffffffeffff'" (* 281474976645119 (0xfffffffeffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0xfffffffffec3'" (* 281474976710339 (0xfffffffffec3) *)
  := (Const 281474976710339%Z).
Notation "'0xfffffffffec3'" (* 281474976710339 (0xfffffffffec3) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~0~0~0~1~1).
Notation "'0xffffffffffef'" (* 281474976710639 (0xffffffffffef) *)
  := (Const 281474976710639%Z).
Notation "'0xffffffffffef'" (* 281474976710639 (0xffffffffffef) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1).
Notation "'0xfffffffffff7'" (* 281474976710647 (0xfffffffffff7) *)
  := (Const 281474976710647%Z).
Notation "'0xfffffffffff7'" (* 281474976710647 (0xfffffffffff7) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1).
Notation "'0xfffffffffffd'" (* 281474976710653 (0xfffffffffffd) *)
  := (Const 281474976710653%Z).
Notation "'0xfffffffffffd'" (* 281474976710653 (0xfffffffffffd) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1).
Notation "'0xffffffffffff'" (* 281474976710655 (0xffffffffffff) *)
  := (Const 281474976710655%Z).
Notation "'0xffffffffffff'" (* 281474976710655 (0xffffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000'" (* 281474976710656 (0x1000000000000) *)
  := (Const 281474976710656%Z).
Notation "'0x1000000000000'" (* 281474976710656 (0x1000000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000001'" (* 281474976710657 (0x1000000000001) *)
  := (Const 281474976710657%Z).
Notation "'0x1000000000001'" (* 281474976710657 (0x1000000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffed'" (* 562949953421293 (0x1ffffffffffed) *)
  := (Const 562949953421293%Z).
Notation "'0x1ffffffffffed'" (* 562949953421293 (0x1ffffffffffed) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1).
Notation "'0x1ffffffffffff'" (* 562949953421311 (0x1ffffffffffff) *)
  := (Const 562949953421311%Z).
Notation "'0x1ffffffffffff'" (* 562949953421311 (0x1ffffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000'" (* 562949953421312 (0x2000000000000) *)
  := (Const 562949953421312%Z).
Notation "'0x2000000000000'" (* 562949953421312 (0x2000000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000001'" (* 562949953421313 (0x2000000000001) *)
  := (Const 562949953421313%Z).
Notation "'0x2000000000001'" (* 562949953421313 (0x2000000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffdffffff'" (* 1125899873288191 (0x3fffffdffffff) *)
  := (Const 1125899873288191%Z).
Notation "'0x3fffffdffffff'" (* 1125899873288191 (0x3fffffdffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x3ffffffffffe1'" (* 1125899906842593 (0x3ffffffffffe1) *)
  := (Const 1125899906842593%Z).
Notation "'0x3ffffffffffe1'" (* 1125899906842593 (0x3ffffffffffe1) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~0~1).
Notation "'0x3ffffffffffef'" (* 1125899906842607 (0x3ffffffffffef) *)
  := (Const 1125899906842607%Z).
Notation "'0x3ffffffffffef'" (* 1125899906842607 (0x3ffffffffffef) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1).
Notation "'0x3ffffffffffff'" (* 1125899906842623 (0x3ffffffffffff) *)
  := (Const 1125899906842623%Z).
Notation "'0x3ffffffffffff'" (* 1125899906842623 (0x3ffffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000'" (* 1125899906842624 (0x4000000000000) *)
  := (Const 1125899906842624%Z).
Notation "'0x4000000000000'" (* 1125899906842624 (0x4000000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000001'" (* 1125899906842625 (0x4000000000001) *)
  := (Const 1125899906842625%Z).
Notation "'0x4000000000001'" (* 1125899906842625 (0x4000000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffff80000'" (* 2251799813160960 (0x7fffffff80000) *)
  := (Const 2251799813160960%Z).
Notation "'0x7fffffff80000'" (* 2251799813160960 (0x7fffffff80000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x7ffffffffffda'" (* 2251799813685210 (0x7ffffffffffda) *)
  := (Const 2251799813685210%Z).
Notation "'0x7ffffffffffda'" (* 2251799813685210 (0x7ffffffffffda) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1~0).
Notation "'0x7ffffffffffe1'" (* 2251799813685217 (0x7ffffffffffe1) *)
  := (Const 2251799813685217%Z).
Notation "'0x7ffffffffffe1'" (* 2251799813685217 (0x7ffffffffffe1) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~0~1).
Notation "'0x7ffffffffffed'" (* 2251799813685229 (0x7ffffffffffed) *)
  := (Const 2251799813685229%Z).
Notation "'0x7ffffffffffed'" (* 2251799813685229 (0x7ffffffffffed) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1).
Notation "'0x7ffffffffffff'" (* 2251799813685247 (0x7ffffffffffff) *)
  := (Const 2251799813685247%Z).
Notation "'0x7ffffffffffff'" (* 2251799813685247 (0x7ffffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000'" (* 2251799813685248 (0x8000000000000) *)
  := (Const 2251799813685248%Z).
Notation "'0x8000000000000'" (* 2251799813685248 (0x8000000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000001'" (* 2251799813685249 (0x8000000000001) *)
  := (Const 2251799813685249%Z).
Notation "'0x8000000000001'" (* 2251799813685249 (0x8000000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffda'" (* 4503599627370458 (0xfffffffffffda) *)
  := (Const 4503599627370458%Z).
Notation "'0xfffffffffffda'" (* 4503599627370458 (0xfffffffffffda) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0~1~0).
Notation "'0xfffffffffffef'" (* 4503599627370479 (0xfffffffffffef) *)
  := (Const 4503599627370479%Z).
Notation "'0xfffffffffffef'" (* 4503599627370479 (0xfffffffffffef) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1).
Notation "'0xffffffffffffe'" (* 4503599627370494 (0xffffffffffffe) *)
  := (Const 4503599627370494%Z).
Notation "'0xffffffffffffe'" (* 4503599627370494 (0xffffffffffffe) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0xfffffffffffff'" (* 4503599627370495 (0xfffffffffffff) *)
  := (Const 4503599627370495%Z).
Notation "'0xfffffffffffff'" (* 4503599627370495 (0xfffffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000'" (* 4503599627370496 (0x10000000000000) *)
  := (Const 4503599627370496%Z).
Notation "'0x10000000000000'" (* 4503599627370496 (0x10000000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000001'" (* 4503599627370497 (0x10000000000001) *)
  := (Const 4503599627370497%Z).
Notation "'0x10000000000001'" (* 4503599627370497 (0x10000000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffbffffff'" (* 9007199187632127 (0x1ffffffbffffff) *)
  := (Const 9007199187632127%Z).
Notation "'0x1ffffffbffffff'" (* 9007199187632127 (0x1ffffffbffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1fffffffffffff'" (* 9007199254740991 (0x1fffffffffffff) *)
  := (Const 9007199254740991%Z).
Notation "'0x1fffffffffffff'" (* 9007199254740991 (0x1fffffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000'" (* 9007199254740992 (0x20000000000000) *)
  := (Const 9007199254740992%Z).
Notation "'0x20000000000000'" (* 9007199254740992 (0x20000000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000001'" (* 9007199254740993 (0x20000000000001) *)
  := (Const 9007199254740993%Z).
Notation "'0x20000000000001'" (* 9007199254740993 (0x20000000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffff'" (* 18014398509481983 (0x3fffffffffffff) *)
  := (Const 18014398509481983%Z).
Notation "'0x3fffffffffffff'" (* 18014398509481983 (0x3fffffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000'" (* 18014398509481984 (0x40000000000000) *)
  := (Const 18014398509481984%Z).
Notation "'0x40000000000000'" (* 18014398509481984 (0x40000000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000001'" (* 18014398509481985 (0x40000000000001) *)
  := (Const 18014398509481985%Z).
Notation "'0x40000000000001'" (* 18014398509481985 (0x40000000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffff'" (* 36028797018963967 (0x7fffffffffffff) *)
  := (Const 36028797018963967%Z).
Notation "'0x7fffffffffffff'" (* 36028797018963967 (0x7fffffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000'" (* 36028797018963968 (0x80000000000000) *)
  := (Const 36028797018963968%Z).
Notation "'0x80000000000000'" (* 36028797018963968 (0x80000000000000) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000001'" (* 36028797018963969 (0x80000000000001) *)
  := (Const 36028797018963969%Z).
Notation "'0x80000000000001'" (* 36028797018963969 (0x80000000000001) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffe'" (* 72057594037927934 (0xfffffffffffffe) *)
  := (Const 72057594037927934%Z).
Notation "'0xfffffffffffffe'" (* 72057594037927934 (0xfffffffffffffe) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0xffffffffffffff'" (* 72057594037927935 (0xffffffffffffff) *)
  := (Const 72057594037927935%Z).
Notation "'0xffffffffffffff'" (* 72057594037927935 (0xffffffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000'" (* 72057594037927936 (0x100000000000000) *)
  := (Const 72057594037927936%Z).
Notation "'0x100000000000000'" (* 72057594037927936 (0x100000000000000) *)
  := (Const WO~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000001'" (* 72057594037927937 (0x100000000000001) *)
  := (Const 72057594037927937%Z).
Notation "'0x100000000000001'" (* 72057594037927937 (0x100000000000001) *)
  := (Const WO~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffff'" (* 144115188075855871 (0x1ffffffffffffff) *)
  := (Const 144115188075855871%Z).
Notation "'0x1ffffffffffffff'" (* 144115188075855871 (0x1ffffffffffffff) *)
  := (Const WO~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000'" (* 144115188075855872 (0x200000000000000) *)
  := (Const 144115188075855872%Z).
Notation "'0x200000000000000'" (* 144115188075855872 (0x200000000000000) *)
  := (Const WO~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000001'" (* 144115188075855873 (0x200000000000001) *)
  := (Const 144115188075855873%Z).
Notation "'0x200000000000001'" (* 144115188075855873 (0x200000000000001) *)
  := (Const WO~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffff'" (* 288230376151711743 (0x3ffffffffffffff) *)
  := (Const 288230376151711743%Z).
Notation "'0x3ffffffffffffff'" (* 288230376151711743 (0x3ffffffffffffff) *)
  := (Const WO~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000'" (* 288230376151711744 (0x400000000000000) *)
  := (Const 288230376151711744%Z).
Notation "'0x400000000000000'" (* 288230376151711744 (0x400000000000000) *)
  := (Const WO~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000001'" (* 288230376151711745 (0x400000000000001) *)
  := (Const 288230376151711745%Z).
Notation "'0x400000000000001'" (* 288230376151711745 (0x400000000000001) *)
  := (Const WO~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffff'" (* 576460752303423487 (0x7ffffffffffffff) *)
  := (Const 576460752303423487%Z).
Notation "'0x7ffffffffffffff'" (* 576460752303423487 (0x7ffffffffffffff) *)
  := (Const WO~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000'" (* 576460752303423488 (0x800000000000000) *)
  := (Const 576460752303423488%Z).
Notation "'0x800000000000000'" (* 576460752303423488 (0x800000000000000) *)
  := (Const WO~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000001'" (* 576460752303423489 (0x800000000000001) *)
  := (Const 576460752303423489%Z).
Notation "'0x800000000000001'" (* 576460752303423489 (0x800000000000001) *)
  := (Const WO~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffff'" (* 1152921504606846975 (0xfffffffffffffff) *)
  := (Const 1152921504606846975%Z).
Notation "'0xfffffffffffffff'" (* 1152921504606846975 (0xfffffffffffffff) *)
  := (Const WO~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000'" (* 1152921504606846976 (0x1000000000000000) *)
  := (Const 1152921504606846976%Z).
Notation "'0x1000000000000000'" (* 1152921504606846976 (0x1000000000000000) *)
  := (Const WO~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000001'" (* 1152921504606846977 (0x1000000000000001) *)
  := (Const 1152921504606846977%Z).
Notation "'0x1000000000000001'" (* 1152921504606846977 (0x1000000000000001) *)
  := (Const WO~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffff'" (* 2305843009213693951 (0x1fffffffffffffff) *)
  := (Const 2305843009213693951%Z).
Notation "'0x1fffffffffffffff'" (* 2305843009213693951 (0x1fffffffffffffff) *)
  := (Const WO~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000'" (* 2305843009213693952 (0x2000000000000000) *)
  := (Const 2305843009213693952%Z).
Notation "'0x2000000000000000'" (* 2305843009213693952 (0x2000000000000000) *)
  := (Const WO~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000001'" (* 2305843009213693953 (0x2000000000000001) *)
  := (Const 2305843009213693953%Z).
Notation "'0x2000000000000001'" (* 2305843009213693953 (0x2000000000000001) *)
  := (Const WO~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffff'" (* 4611686018427387903 (0x3fffffffffffffff) *)
  := (Const 4611686018427387903%Z).
Notation "'0x3fffffffffffffff'" (* 4611686018427387903 (0x3fffffffffffffff) *)
  := (Const WO~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000'" (* 4611686018427387904 (0x4000000000000000) *)
  := (Const 4611686018427387904%Z).
Notation "'0x4000000000000000'" (* 4611686018427387904 (0x4000000000000000) *)
  := (Const WO~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000001'" (* 4611686018427387905 (0x4000000000000001) *)
  := (Const 4611686018427387905%Z).
Notation "'0x4000000000000001'" (* 4611686018427387905 (0x4000000000000001) *)
  := (Const WO~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffL'" (* 9223372036854775807 (0x7fffffffffffffffL) *)
  := (Const 9223372036854775807%Z).
Notation "'0x7fffffffffffffffL'" (* 9223372036854775807 (0x7fffffffffffffffL) *)
  := (Const WO~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000L'" (* 9223372036854775808 (0x8000000000000000L) *)
  := (Const 9223372036854775808%Z).
Notation "'0x8000000000000000L'" (* 9223372036854775808 (0x8000000000000000L) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000001L'" (* 9223372036854775809 (0x8000000000000001L) *)
  := (Const 9223372036854775809%Z).
Notation "'0x8000000000000001L'" (* 9223372036854775809 (0x8000000000000001L) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffff00000001L'" (* 18446744069414584321 (0xffffffff00000001L) *)
  := (Const 18446744069414584321%Z).
Notation "'0xffffffff00000001L'" (* 18446744069414584321 (0xffffffff00000001L) *)
  := (Const WO~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffeL'" (* 18446744073709551614 (0xfffffffffffffffeL) *)
  := (Const 18446744073709551614%Z).
Notation "'0xfffffffffffffffeL'" (* 18446744073709551614 (0xfffffffffffffffeL) *)
  := (Const WO~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0xffffffffffffffffL'" (* 18446744073709551615 (0xffffffffffffffffL) *)
  := (Const 18446744073709551615%Z).
Notation "'0xffffffffffffffffL'" (* 18446744073709551615 (0xffffffffffffffffL) *)
  := (Const WO~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000L'" (* 18446744073709551616 (0x10000000000000000L) *)
  := (Const 18446744073709551616%Z).
Notation "'0x10000000000000000L'" (* 18446744073709551616 (0x10000000000000000L) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000001L'" (* 18446744073709551617 (0x10000000000000001L) *)
  := (Const 18446744073709551617%Z).
Notation "'0x10000000000000001L'" (* 18446744073709551617 (0x10000000000000001L) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffL'" (* 36893488147419103231 (0x1ffffffffffffffffL) *)
  := (Const 36893488147419103231%Z).
Notation "'0x1ffffffffffffffffL'" (* 36893488147419103231 (0x1ffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000L'" (* 36893488147419103232 (0x20000000000000000L) *)
  := (Const 36893488147419103232%Z).
Notation "'0x20000000000000000L'" (* 36893488147419103232 (0x20000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000001L'" (* 36893488147419103233 (0x20000000000000001L) *)
  := (Const 36893488147419103233%Z).
Notation "'0x20000000000000001L'" (* 36893488147419103233 (0x20000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffL'" (* 73786976294838206463 (0x3ffffffffffffffffL) *)
  := (Const 73786976294838206463%Z).
Notation "'0x3ffffffffffffffffL'" (* 73786976294838206463 (0x3ffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000L'" (* 73786976294838206464 (0x40000000000000000L) *)
  := (Const 73786976294838206464%Z).
Notation "'0x40000000000000000L'" (* 73786976294838206464 (0x40000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000001L'" (* 73786976294838206465 (0x40000000000000001L) *)
  := (Const 73786976294838206465%Z).
Notation "'0x40000000000000001L'" (* 73786976294838206465 (0x40000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffL'" (* 147573952589676412927 (0x7ffffffffffffffffL) *)
  := (Const 147573952589676412927%Z).
Notation "'0x7ffffffffffffffffL'" (* 147573952589676412927 (0x7ffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000L'" (* 147573952589676412928 (0x80000000000000000L) *)
  := (Const 147573952589676412928%Z).
Notation "'0x80000000000000000L'" (* 147573952589676412928 (0x80000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000001L'" (* 147573952589676412929 (0x80000000000000001L) *)
  := (Const 147573952589676412929%Z).
Notation "'0x80000000000000001L'" (* 147573952589676412929 (0x80000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffL'" (* 295147905179352825855 (0xfffffffffffffffffL) *)
  := (Const 295147905179352825855%Z).
Notation "'0xfffffffffffffffffL'" (* 295147905179352825855 (0xfffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000L'" (* 295147905179352825856 (0x100000000000000000L) *)
  := (Const 295147905179352825856%Z).
Notation "'0x100000000000000000L'" (* 295147905179352825856 (0x100000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000001L'" (* 295147905179352825857 (0x100000000000000001L) *)
  := (Const 295147905179352825857%Z).
Notation "'0x100000000000000001L'" (* 295147905179352825857 (0x100000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffL'" (* 590295810358705651711 (0x1fffffffffffffffffL) *)
  := (Const 590295810358705651711%Z).
Notation "'0x1fffffffffffffffffL'" (* 590295810358705651711 (0x1fffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000L'" (* 590295810358705651712 (0x200000000000000000L) *)
  := (Const 590295810358705651712%Z).
Notation "'0x200000000000000000L'" (* 590295810358705651712 (0x200000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000001L'" (* 590295810358705651713 (0x200000000000000001L) *)
  := (Const 590295810358705651713%Z).
Notation "'0x200000000000000001L'" (* 590295810358705651713 (0x200000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffL'" (* 1180591620717411303423 (0x3fffffffffffffffffL) *)
  := (Const 1180591620717411303423%Z).
Notation "'0x3fffffffffffffffffL'" (* 1180591620717411303423 (0x3fffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000L'" (* 1180591620717411303424 (0x400000000000000000L) *)
  := (Const 1180591620717411303424%Z).
Notation "'0x400000000000000000L'" (* 1180591620717411303424 (0x400000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000001L'" (* 1180591620717411303425 (0x400000000000000001L) *)
  := (Const 1180591620717411303425%Z).
Notation "'0x400000000000000001L'" (* 1180591620717411303425 (0x400000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffL'" (* 2361183241434822606847 (0x7fffffffffffffffffL) *)
  := (Const 2361183241434822606847%Z).
Notation "'0x7fffffffffffffffffL'" (* 2361183241434822606847 (0x7fffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000L'" (* 2361183241434822606848 (0x800000000000000000L) *)
  := (Const 2361183241434822606848%Z).
Notation "'0x800000000000000000L'" (* 2361183241434822606848 (0x800000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000001L'" (* 2361183241434822606849 (0x800000000000000001L) *)
  := (Const 2361183241434822606849%Z).
Notation "'0x800000000000000001L'" (* 2361183241434822606849 (0x800000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffL'" (* 4722366482869645213695 (0xffffffffffffffffffL) *)
  := (Const 4722366482869645213695%Z).
Notation "'0xffffffffffffffffffL'" (* 4722366482869645213695 (0xffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000L'" (* 4722366482869645213696 (0x1000000000000000000L) *)
  := (Const 4722366482869645213696%Z).
Notation "'0x1000000000000000000L'" (* 4722366482869645213696 (0x1000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000001L'" (* 4722366482869645213697 (0x1000000000000000001L) *)
  := (Const 4722366482869645213697%Z).
Notation "'0x1000000000000000001L'" (* 4722366482869645213697 (0x1000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffL'" (* 9444732965739290427391 (0x1ffffffffffffffffffL) *)
  := (Const 9444732965739290427391%Z).
Notation "'0x1ffffffffffffffffffL'" (* 9444732965739290427391 (0x1ffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000L'" (* 9444732965739290427392 (0x2000000000000000000L) *)
  := (Const 9444732965739290427392%Z).
Notation "'0x2000000000000000000L'" (* 9444732965739290427392 (0x2000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000001L'" (* 9444732965739290427393 (0x2000000000000000001L) *)
  := (Const 9444732965739290427393%Z).
Notation "'0x2000000000000000001L'" (* 9444732965739290427393 (0x2000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffL'" (* 18889465931478580854783 (0x3ffffffffffffffffffL) *)
  := (Const 18889465931478580854783%Z).
Notation "'0x3ffffffffffffffffffL'" (* 18889465931478580854783 (0x3ffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000L'" (* 18889465931478580854784 (0x4000000000000000000L) *)
  := (Const 18889465931478580854784%Z).
Notation "'0x4000000000000000000L'" (* 18889465931478580854784 (0x4000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000001L'" (* 18889465931478580854785 (0x4000000000000000001L) *)
  := (Const 18889465931478580854785%Z).
Notation "'0x4000000000000000001L'" (* 18889465931478580854785 (0x4000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffL'" (* 37778931862957161709567 (0x7ffffffffffffffffffL) *)
  := (Const 37778931862957161709567%Z).
Notation "'0x7ffffffffffffffffffL'" (* 37778931862957161709567 (0x7ffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000L'" (* 37778931862957161709568 (0x8000000000000000000L) *)
  := (Const 37778931862957161709568%Z).
Notation "'0x8000000000000000000L'" (* 37778931862957161709568 (0x8000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000001L'" (* 37778931862957161709569 (0x8000000000000000001L) *)
  := (Const 37778931862957161709569%Z).
Notation "'0x8000000000000000001L'" (* 37778931862957161709569 (0x8000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffL'" (* 75557863725914323419135 (0xfffffffffffffffffffL) *)
  := (Const 75557863725914323419135%Z).
Notation "'0xfffffffffffffffffffL'" (* 75557863725914323419135 (0xfffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000000L'" (* 75557863725914323419136 (0x10000000000000000000L) *)
  := (Const 75557863725914323419136%Z).
Notation "'0x10000000000000000000L'" (* 75557863725914323419136 (0x10000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000000001L'" (* 75557863725914323419137 (0x10000000000000000001L) *)
  := (Const 75557863725914323419137%Z).
Notation "'0x10000000000000000001L'" (* 75557863725914323419137 (0x10000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffL'" (* 151115727451828646838271 (0x1fffffffffffffffffffL) *)
  := (Const 151115727451828646838271%Z).
Notation "'0x1fffffffffffffffffffL'" (* 151115727451828646838271 (0x1fffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000000L'" (* 151115727451828646838272 (0x20000000000000000000L) *)
  := (Const 151115727451828646838272%Z).
Notation "'0x20000000000000000000L'" (* 151115727451828646838272 (0x20000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000000001L'" (* 151115727451828646838273 (0x20000000000000000001L) *)
  := (Const 151115727451828646838273%Z).
Notation "'0x20000000000000000001L'" (* 151115727451828646838273 (0x20000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffL'" (* 302231454903657293676543 (0x3fffffffffffffffffffL) *)
  := (Const 302231454903657293676543%Z).
Notation "'0x3fffffffffffffffffffL'" (* 302231454903657293676543 (0x3fffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000000L'" (* 302231454903657293676544 (0x40000000000000000000L) *)
  := (Const 302231454903657293676544%Z).
Notation "'0x40000000000000000000L'" (* 302231454903657293676544 (0x40000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000000001L'" (* 302231454903657293676545 (0x40000000000000000001L) *)
  := (Const 302231454903657293676545%Z).
Notation "'0x40000000000000000001L'" (* 302231454903657293676545 (0x40000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffL'" (* 604462909807314587353087 (0x7fffffffffffffffffffL) *)
  := (Const 604462909807314587353087%Z).
Notation "'0x7fffffffffffffffffffL'" (* 604462909807314587353087 (0x7fffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000000L'" (* 604462909807314587353088 (0x80000000000000000000L) *)
  := (Const 604462909807314587353088%Z).
Notation "'0x80000000000000000000L'" (* 604462909807314587353088 (0x80000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000000001L'" (* 604462909807314587353089 (0x80000000000000000001L) *)
  := (Const 604462909807314587353089%Z).
Notation "'0x80000000000000000001L'" (* 604462909807314587353089 (0x80000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffL'" (* 1208925819614629174706175 (0xffffffffffffffffffffL) *)
  := (Const 1208925819614629174706175%Z).
Notation "'0xffffffffffffffffffffL'" (* 1208925819614629174706175 (0xffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000000L'" (* 1208925819614629174706176 (0x100000000000000000000L) *)
  := (Const 1208925819614629174706176%Z).
Notation "'0x100000000000000000000L'" (* 1208925819614629174706176 (0x100000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000000001L'" (* 1208925819614629174706177 (0x100000000000000000001L) *)
  := (Const 1208925819614629174706177%Z).
Notation "'0x100000000000000000001L'" (* 1208925819614629174706177 (0x100000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffL'" (* 2417851639229258349412351 (0x1ffffffffffffffffffffL) *)
  := (Const 2417851639229258349412351%Z).
Notation "'0x1ffffffffffffffffffffL'" (* 2417851639229258349412351 (0x1ffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000000L'" (* 2417851639229258349412352 (0x200000000000000000000L) *)
  := (Const 2417851639229258349412352%Z).
Notation "'0x200000000000000000000L'" (* 2417851639229258349412352 (0x200000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000000001L'" (* 2417851639229258349412353 (0x200000000000000000001L) *)
  := (Const 2417851639229258349412353%Z).
Notation "'0x200000000000000000001L'" (* 2417851639229258349412353 (0x200000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffL'" (* 4835703278458516698824703 (0x3ffffffffffffffffffffL) *)
  := (Const 4835703278458516698824703%Z).
Notation "'0x3ffffffffffffffffffffL'" (* 4835703278458516698824703 (0x3ffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000000L'" (* 4835703278458516698824704 (0x400000000000000000000L) *)
  := (Const 4835703278458516698824704%Z).
Notation "'0x400000000000000000000L'" (* 4835703278458516698824704 (0x400000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000000001L'" (* 4835703278458516698824705 (0x400000000000000000001L) *)
  := (Const 4835703278458516698824705%Z).
Notation "'0x400000000000000000001L'" (* 4835703278458516698824705 (0x400000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffL'" (* 9671406556917033397649407 (0x7ffffffffffffffffffffL) *)
  := (Const 9671406556917033397649407%Z).
Notation "'0x7ffffffffffffffffffffL'" (* 9671406556917033397649407 (0x7ffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000000L'" (* 9671406556917033397649408 (0x800000000000000000000L) *)
  := (Const 9671406556917033397649408%Z).
Notation "'0x800000000000000000000L'" (* 9671406556917033397649408 (0x800000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000000001L'" (* 9671406556917033397649409 (0x800000000000000000001L) *)
  := (Const 9671406556917033397649409%Z).
Notation "'0x800000000000000000001L'" (* 9671406556917033397649409 (0x800000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffL'" (* 19342813113834066795298815 (0xfffffffffffffffffffffL) *)
  := (Const 19342813113834066795298815%Z).
Notation "'0xfffffffffffffffffffffL'" (* 19342813113834066795298815 (0xfffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000000L'" (* 19342813113834066795298816 (0x1000000000000000000000L) *)
  := (Const 19342813113834066795298816%Z).
Notation "'0x1000000000000000000000L'" (* 19342813113834066795298816 (0x1000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000000001L'" (* 19342813113834066795298817 (0x1000000000000000000001L) *)
  := (Const 19342813113834066795298817%Z).
Notation "'0x1000000000000000000001L'" (* 19342813113834066795298817 (0x1000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffL'" (* 38685626227668133590597631 (0x1fffffffffffffffffffffL) *)
  := (Const 38685626227668133590597631%Z).
Notation "'0x1fffffffffffffffffffffL'" (* 38685626227668133590597631 (0x1fffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000000L'" (* 38685626227668133590597632 (0x2000000000000000000000L) *)
  := (Const 38685626227668133590597632%Z).
Notation "'0x2000000000000000000000L'" (* 38685626227668133590597632 (0x2000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000000001L'" (* 38685626227668133590597633 (0x2000000000000000000001L) *)
  := (Const 38685626227668133590597633%Z).
Notation "'0x2000000000000000000001L'" (* 38685626227668133590597633 (0x2000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffff6L'" (* 77371252455336267181195254 (0x3ffffffffffffffffffff6L) *)
  := (Const 77371252455336267181195254%Z).
Notation "'0x3ffffffffffffffffffff6L'" (* 77371252455336267181195254 (0x3ffffffffffffffffffff6L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~1~1~0).
Notation "'0x3ffffffffffffffffffffeL'" (* 77371252455336267181195262 (0x3ffffffffffffffffffffeL) *)
  := (Const 77371252455336267181195262%Z).
Notation "'0x3ffffffffffffffffffffeL'" (* 77371252455336267181195262 (0x3ffffffffffffffffffffeL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0).
Notation "'0x3fffffffffffffffffffffL'" (* 77371252455336267181195263 (0x3fffffffffffffffffffffL) *)
  := (Const 77371252455336267181195263%Z).
Notation "'0x3fffffffffffffffffffffL'" (* 77371252455336267181195263 (0x3fffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000000L'" (* 77371252455336267181195264 (0x4000000000000000000000L) *)
  := (Const 77371252455336267181195264%Z).
Notation "'0x4000000000000000000000L'" (* 77371252455336267181195264 (0x4000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000000001L'" (* 77371252455336267181195265 (0x4000000000000000000001L) *)
  := (Const 77371252455336267181195265%Z).
Notation "'0x4000000000000000000001L'" (* 77371252455336267181195265 (0x4000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffL'" (* 154742504910672534362390527 (0x7fffffffffffffffffffffL) *)
  := (Const 154742504910672534362390527%Z).
Notation "'0x7fffffffffffffffffffffL'" (* 154742504910672534362390527 (0x7fffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000000L'" (* 154742504910672534362390528 (0x8000000000000000000000L) *)
  := (Const 154742504910672534362390528%Z).
Notation "'0x8000000000000000000000L'" (* 154742504910672534362390528 (0x8000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000000001L'" (* 154742504910672534362390529 (0x8000000000000000000001L) *)
  := (Const 154742504910672534362390529%Z).
Notation "'0x8000000000000000000001L'" (* 154742504910672534362390529 (0x8000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffL'" (* 309485009821345068724781055 (0xffffffffffffffffffffffL) *)
  := (Const 309485009821345068724781055%Z).
Notation "'0xffffffffffffffffffffffL'" (* 309485009821345068724781055 (0xffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000000000L'" (* 309485009821345068724781056 (0x10000000000000000000000L) *)
  := (Const 309485009821345068724781056%Z).
Notation "'0x10000000000000000000000L'" (* 309485009821345068724781056 (0x10000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000000000001L'" (* 309485009821345068724781057 (0x10000000000000000000001L) *)
  := (Const 309485009821345068724781057%Z).
Notation "'0x10000000000000000000001L'" (* 309485009821345068724781057 (0x10000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffL'" (* 618970019642690137449562111 (0x1ffffffffffffffffffffffL) *)
  := (Const 618970019642690137449562111%Z).
Notation "'0x1ffffffffffffffffffffffL'" (* 618970019642690137449562111 (0x1ffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000000000L'" (* 618970019642690137449562112 (0x20000000000000000000000L) *)
  := (Const 618970019642690137449562112%Z).
Notation "'0x20000000000000000000000L'" (* 618970019642690137449562112 (0x20000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000000000001L'" (* 618970019642690137449562113 (0x20000000000000000000001L) *)
  := (Const 618970019642690137449562113%Z).
Notation "'0x20000000000000000000001L'" (* 618970019642690137449562113 (0x20000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffL'" (* 1237940039285380274899124223 (0x3ffffffffffffffffffffffL) *)
  := (Const 1237940039285380274899124223%Z).
Notation "'0x3ffffffffffffffffffffffL'" (* 1237940039285380274899124223 (0x3ffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000000000L'" (* 1237940039285380274899124224 (0x40000000000000000000000L) *)
  := (Const 1237940039285380274899124224%Z).
Notation "'0x40000000000000000000000L'" (* 1237940039285380274899124224 (0x40000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000000000001L'" (* 1237940039285380274899124225 (0x40000000000000000000001L) *)
  := (Const 1237940039285380274899124225%Z).
Notation "'0x40000000000000000000001L'" (* 1237940039285380274899124225 (0x40000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffL'" (* 2475880078570760549798248447 (0x7ffffffffffffffffffffffL) *)
  := (Const 2475880078570760549798248447%Z).
Notation "'0x7ffffffffffffffffffffffL'" (* 2475880078570760549798248447 (0x7ffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000000000L'" (* 2475880078570760549798248448 (0x80000000000000000000000L) *)
  := (Const 2475880078570760549798248448%Z).
Notation "'0x80000000000000000000000L'" (* 2475880078570760549798248448 (0x80000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000000000001L'" (* 2475880078570760549798248449 (0x80000000000000000000001L) *)
  := (Const 2475880078570760549798248449%Z).
Notation "'0x80000000000000000000001L'" (* 2475880078570760549798248449 (0x80000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffL'" (* 4951760157141521099596496895 (0xfffffffffffffffffffffffL) *)
  := (Const 4951760157141521099596496895%Z).
Notation "'0xfffffffffffffffffffffffL'" (* 4951760157141521099596496895 (0xfffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000000000L'" (* 4951760157141521099596496896 (0x100000000000000000000000L) *)
  := (Const 4951760157141521099596496896%Z).
Notation "'0x100000000000000000000000L'" (* 4951760157141521099596496896 (0x100000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000000000001L'" (* 4951760157141521099596496897 (0x100000000000000000000001L) *)
  := (Const 4951760157141521099596496897%Z).
Notation "'0x100000000000000000000001L'" (* 4951760157141521099596496897 (0x100000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffL'" (* 9903520314283042199192993791 (0x1fffffffffffffffffffffffL) *)
  := (Const 9903520314283042199192993791%Z).
Notation "'0x1fffffffffffffffffffffffL'" (* 9903520314283042199192993791 (0x1fffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000000000L'" (* 9903520314283042199192993792 (0x200000000000000000000000L) *)
  := (Const 9903520314283042199192993792%Z).
Notation "'0x200000000000000000000000L'" (* 9903520314283042199192993792 (0x200000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000000000001L'" (* 9903520314283042199192993793 (0x200000000000000000000001L) *)
  := (Const 9903520314283042199192993793%Z).
Notation "'0x200000000000000000000001L'" (* 9903520314283042199192993793 (0x200000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffL'" (* 19807040628566084398385987583 (0x3fffffffffffffffffffffffL) *)
  := (Const 19807040628566084398385987583%Z).
Notation "'0x3fffffffffffffffffffffffL'" (* 19807040628566084398385987583 (0x3fffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000000000L'" (* 19807040628566084398385987584 (0x400000000000000000000000L) *)
  := (Const 19807040628566084398385987584%Z).
Notation "'0x400000000000000000000000L'" (* 19807040628566084398385987584 (0x400000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000000000001L'" (* 19807040628566084398385987585 (0x400000000000000000000001L) *)
  := (Const 19807040628566084398385987585%Z).
Notation "'0x400000000000000000000001L'" (* 19807040628566084398385987585 (0x400000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffL'" (* 39614081257132168796771975167 (0x7fffffffffffffffffffffffL) *)
  := (Const 39614081257132168796771975167%Z).
Notation "'0x7fffffffffffffffffffffffL'" (* 39614081257132168796771975167 (0x7fffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000000000L'" (* 39614081257132168796771975168 (0x800000000000000000000000L) *)
  := (Const 39614081257132168796771975168%Z).
Notation "'0x800000000000000000000000L'" (* 39614081257132168796771975168 (0x800000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000000000001L'" (* 39614081257132168796771975169 (0x800000000000000000000001L) *)
  := (Const 39614081257132168796771975169%Z).
Notation "'0x800000000000000000000001L'" (* 39614081257132168796771975169 (0x800000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffL'" (* 79228162514264337593543950335 (0xffffffffffffffffffffffffL) *)
  := (Const 79228162514264337593543950335%Z).
Notation "'0xffffffffffffffffffffffffL'" (* 79228162514264337593543950335 (0xffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000000000L'" (* 79228162514264337593543950336 (0x1000000000000000000000000L) *)
  := (Const 79228162514264337593543950336%Z).
Notation "'0x1000000000000000000000000L'" (* 79228162514264337593543950336 (0x1000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000000000001L'" (* 79228162514264337593543950337 (0x1000000000000000000000001L) *)
  := (Const 79228162514264337593543950337%Z).
Notation "'0x1000000000000000000000001L'" (* 79228162514264337593543950337 (0x1000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffL'" (* 158456325028528675187087900671 (0x1ffffffffffffffffffffffffL) *)
  := (Const 158456325028528675187087900671%Z).
Notation "'0x1ffffffffffffffffffffffffL'" (* 158456325028528675187087900671 (0x1ffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000000000L'" (* 158456325028528675187087900672 (0x2000000000000000000000000L) *)
  := (Const 158456325028528675187087900672%Z).
Notation "'0x2000000000000000000000000L'" (* 158456325028528675187087900672 (0x2000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000000000001L'" (* 158456325028528675187087900673 (0x2000000000000000000000001L) *)
  := (Const 158456325028528675187087900673%Z).
Notation "'0x2000000000000000000000001L'" (* 158456325028528675187087900673 (0x2000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffL'" (* 316912650057057350374175801343 (0x3ffffffffffffffffffffffffL) *)
  := (Const 316912650057057350374175801343%Z).
Notation "'0x3ffffffffffffffffffffffffL'" (* 316912650057057350374175801343 (0x3ffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000000000L'" (* 316912650057057350374175801344 (0x4000000000000000000000000L) *)
  := (Const 316912650057057350374175801344%Z).
Notation "'0x4000000000000000000000000L'" (* 316912650057057350374175801344 (0x4000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000000000001L'" (* 316912650057057350374175801345 (0x4000000000000000000000001L) *)
  := (Const 316912650057057350374175801345%Z).
Notation "'0x4000000000000000000000001L'" (* 316912650057057350374175801345 (0x4000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffL'" (* 633825300114114700748351602687 (0x7ffffffffffffffffffffffffL) *)
  := (Const 633825300114114700748351602687%Z).
Notation "'0x7ffffffffffffffffffffffffL'" (* 633825300114114700748351602687 (0x7ffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000000000L'" (* 633825300114114700748351602688 (0x8000000000000000000000000L) *)
  := (Const 633825300114114700748351602688%Z).
Notation "'0x8000000000000000000000000L'" (* 633825300114114700748351602688 (0x8000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000000000001L'" (* 633825300114114700748351602689 (0x8000000000000000000000001L) *)
  := (Const 633825300114114700748351602689%Z).
Notation "'0x8000000000000000000000001L'" (* 633825300114114700748351602689 (0x8000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffL'" (* 1267650600228229401496703205375 (0xfffffffffffffffffffffffffL) *)
  := (Const 1267650600228229401496703205375%Z).
Notation "'0xfffffffffffffffffffffffffL'" (* 1267650600228229401496703205375 (0xfffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000000000000L'" (* 1267650600228229401496703205376 (0x10000000000000000000000000L) *)
  := (Const 1267650600228229401496703205376%Z).
Notation "'0x10000000000000000000000000L'" (* 1267650600228229401496703205376 (0x10000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000000000000001L'" (* 1267650600228229401496703205377 (0x10000000000000000000000001L) *)
  := (Const 1267650600228229401496703205377%Z).
Notation "'0x10000000000000000000000001L'" (* 1267650600228229401496703205377 (0x10000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffL'" (* 2535301200456458802993406410751 (0x1fffffffffffffffffffffffffL) *)
  := (Const 2535301200456458802993406410751%Z).
Notation "'0x1fffffffffffffffffffffffffL'" (* 2535301200456458802993406410751 (0x1fffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000000000000L'" (* 2535301200456458802993406410752 (0x20000000000000000000000000L) *)
  := (Const 2535301200456458802993406410752%Z).
Notation "'0x20000000000000000000000000L'" (* 2535301200456458802993406410752 (0x20000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000000000000001L'" (* 2535301200456458802993406410753 (0x20000000000000000000000001L) *)
  := (Const 2535301200456458802993406410753%Z).
Notation "'0x20000000000000000000000001L'" (* 2535301200456458802993406410753 (0x20000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffL'" (* 5070602400912917605986812821503 (0x3fffffffffffffffffffffffffL) *)
  := (Const 5070602400912917605986812821503%Z).
Notation "'0x3fffffffffffffffffffffffffL'" (* 5070602400912917605986812821503 (0x3fffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000000000000L'" (* 5070602400912917605986812821504 (0x40000000000000000000000000L) *)
  := (Const 5070602400912917605986812821504%Z).
Notation "'0x40000000000000000000000000L'" (* 5070602400912917605986812821504 (0x40000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000000000000001L'" (* 5070602400912917605986812821505 (0x40000000000000000000000001L) *)
  := (Const 5070602400912917605986812821505%Z).
Notation "'0x40000000000000000000000001L'" (* 5070602400912917605986812821505 (0x40000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffL'" (* 10141204801825835211973625643007 (0x7fffffffffffffffffffffffffL) *)
  := (Const 10141204801825835211973625643007%Z).
Notation "'0x7fffffffffffffffffffffffffL'" (* 10141204801825835211973625643007 (0x7fffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000000000000L'" (* 10141204801825835211973625643008 (0x80000000000000000000000000L) *)
  := (Const 10141204801825835211973625643008%Z).
Notation "'0x80000000000000000000000000L'" (* 10141204801825835211973625643008 (0x80000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000000000000001L'" (* 10141204801825835211973625643009 (0x80000000000000000000000001L) *)
  := (Const 10141204801825835211973625643009%Z).
Notation "'0x80000000000000000000000001L'" (* 10141204801825835211973625643009 (0x80000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffL'" (* 20282409603651670423947251286015 (0xffffffffffffffffffffffffffL) *)
  := (Const 20282409603651670423947251286015%Z).
Notation "'0xffffffffffffffffffffffffffL'" (* 20282409603651670423947251286015 (0xffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000000000000L'" (* 20282409603651670423947251286016 (0x100000000000000000000000000L) *)
  := (Const 20282409603651670423947251286016%Z).
Notation "'0x100000000000000000000000000L'" (* 20282409603651670423947251286016 (0x100000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000000000000001L'" (* 20282409603651670423947251286017 (0x100000000000000000000000001L) *)
  := (Const 20282409603651670423947251286017%Z).
Notation "'0x100000000000000000000000001L'" (* 20282409603651670423947251286017 (0x100000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffL'" (* 40564819207303340847894502572031 (0x1ffffffffffffffffffffffffffL) *)
  := (Const 40564819207303340847894502572031%Z).
Notation "'0x1ffffffffffffffffffffffffffL'" (* 40564819207303340847894502572031 (0x1ffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000000000000L'" (* 40564819207303340847894502572032 (0x200000000000000000000000000L) *)
  := (Const 40564819207303340847894502572032%Z).
Notation "'0x200000000000000000000000000L'" (* 40564819207303340847894502572032 (0x200000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000000000000001L'" (* 40564819207303340847894502572033 (0x200000000000000000000000001L) *)
  := (Const 40564819207303340847894502572033%Z).
Notation "'0x200000000000000000000000001L'" (* 40564819207303340847894502572033 (0x200000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffL'" (* 81129638414606681695789005144063 (0x3ffffffffffffffffffffffffffL) *)
  := (Const 81129638414606681695789005144063%Z).
Notation "'0x3ffffffffffffffffffffffffffL'" (* 81129638414606681695789005144063 (0x3ffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000000000000L'" (* 81129638414606681695789005144064 (0x400000000000000000000000000L) *)
  := (Const 81129638414606681695789005144064%Z).
Notation "'0x400000000000000000000000000L'" (* 81129638414606681695789005144064 (0x400000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000000000000001L'" (* 81129638414606681695789005144065 (0x400000000000000000000000001L) *)
  := (Const 81129638414606681695789005144065%Z).
Notation "'0x400000000000000000000000001L'" (* 81129638414606681695789005144065 (0x400000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffL'" (* 162259276829213363391578010288127 (0x7ffffffffffffffffffffffffffL) *)
  := (Const 162259276829213363391578010288127%Z).
Notation "'0x7ffffffffffffffffffffffffffL'" (* 162259276829213363391578010288127 (0x7ffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000000000000L'" (* 162259276829213363391578010288128 (0x800000000000000000000000000L) *)
  := (Const 162259276829213363391578010288128%Z).
Notation "'0x800000000000000000000000000L'" (* 162259276829213363391578010288128 (0x800000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000000000000001L'" (* 162259276829213363391578010288129 (0x800000000000000000000000001L) *)
  := (Const 162259276829213363391578010288129%Z).
Notation "'0x800000000000000000000000001L'" (* 162259276829213363391578010288129 (0x800000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffL'" (* 324518553658426726783156020576255 (0xfffffffffffffffffffffffffffL) *)
  := (Const 324518553658426726783156020576255%Z).
Notation "'0xfffffffffffffffffffffffffffL'" (* 324518553658426726783156020576255 (0xfffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000000000000L'" (* 324518553658426726783156020576256 (0x1000000000000000000000000000L) *)
  := (Const 324518553658426726783156020576256%Z).
Notation "'0x1000000000000000000000000000L'" (* 324518553658426726783156020576256 (0x1000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000000000000001L'" (* 324518553658426726783156020576257 (0x1000000000000000000000000001L) *)
  := (Const 324518553658426726783156020576257%Z).
Notation "'0x1000000000000000000000000001L'" (* 324518553658426726783156020576257 (0x1000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffL'" (* 649037107316853453566312041152511 (0x1fffffffffffffffffffffffffffL) *)
  := (Const 649037107316853453566312041152511%Z).
Notation "'0x1fffffffffffffffffffffffffffL'" (* 649037107316853453566312041152511 (0x1fffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000000000000L'" (* 649037107316853453566312041152512 (0x2000000000000000000000000000L) *)
  := (Const 649037107316853453566312041152512%Z).
Notation "'0x2000000000000000000000000000L'" (* 649037107316853453566312041152512 (0x2000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000000000000001L'" (* 649037107316853453566312041152513 (0x2000000000000000000000000001L) *)
  := (Const 649037107316853453566312041152513%Z).
Notation "'0x2000000000000000000000000001L'" (* 649037107316853453566312041152513 (0x2000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffL'" (* 1298074214633706907132624082305023 (0x3fffffffffffffffffffffffffffL) *)
  := (Const 1298074214633706907132624082305023%Z).
Notation "'0x3fffffffffffffffffffffffffffL'" (* 1298074214633706907132624082305023 (0x3fffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000000000000L'" (* 1298074214633706907132624082305024 (0x4000000000000000000000000000L) *)
  := (Const 1298074214633706907132624082305024%Z).
Notation "'0x4000000000000000000000000000L'" (* 1298074214633706907132624082305024 (0x4000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000000000000001L'" (* 1298074214633706907132624082305025 (0x4000000000000000000000000001L) *)
  := (Const 1298074214633706907132624082305025%Z).
Notation "'0x4000000000000000000000000001L'" (* 1298074214633706907132624082305025 (0x4000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffL'" (* 2596148429267413814265248164610047 (0x7fffffffffffffffffffffffffffL) *)
  := (Const 2596148429267413814265248164610047%Z).
Notation "'0x7fffffffffffffffffffffffffffL'" (* 2596148429267413814265248164610047 (0x7fffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000000000000L'" (* 2596148429267413814265248164610048 (0x8000000000000000000000000000L) *)
  := (Const 2596148429267413814265248164610048%Z).
Notation "'0x8000000000000000000000000000L'" (* 2596148429267413814265248164610048 (0x8000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000000000000001L'" (* 2596148429267413814265248164610049 (0x8000000000000000000000000001L) *)
  := (Const 2596148429267413814265248164610049%Z).
Notation "'0x8000000000000000000000000001L'" (* 2596148429267413814265248164610049 (0x8000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffL'" (* 5192296858534827628530496329220095 (0xffffffffffffffffffffffffffffL) *)
  := (Const 5192296858534827628530496329220095%Z).
Notation "'0xffffffffffffffffffffffffffffL'" (* 5192296858534827628530496329220095 (0xffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000000000000000L'" (* 5192296858534827628530496329220096 (0x10000000000000000000000000000L) *)
  := (Const 5192296858534827628530496329220096%Z).
Notation "'0x10000000000000000000000000000L'" (* 5192296858534827628530496329220096 (0x10000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000000000000000001L'" (* 5192296858534827628530496329220097 (0x10000000000000000000000000001L) *)
  := (Const 5192296858534827628530496329220097%Z).
Notation "'0x10000000000000000000000000001L'" (* 5192296858534827628530496329220097 (0x10000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffL'" (* 10384593717069655257060992658440191 (0x1ffffffffffffffffffffffffffffL) *)
  := (Const 10384593717069655257060992658440191%Z).
Notation "'0x1ffffffffffffffffffffffffffffL'" (* 10384593717069655257060992658440191 (0x1ffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000000000000000L'" (* 10384593717069655257060992658440192 (0x20000000000000000000000000000L) *)
  := (Const 10384593717069655257060992658440192%Z).
Notation "'0x20000000000000000000000000000L'" (* 10384593717069655257060992658440192 (0x20000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000000000000000001L'" (* 10384593717069655257060992658440193 (0x20000000000000000000000000001L) *)
  := (Const 10384593717069655257060992658440193%Z).
Notation "'0x20000000000000000000000000001L'" (* 10384593717069655257060992658440193 (0x20000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffL'" (* 20769187434139310514121985316880383 (0x3ffffffffffffffffffffffffffffL) *)
  := (Const 20769187434139310514121985316880383%Z).
Notation "'0x3ffffffffffffffffffffffffffffL'" (* 20769187434139310514121985316880383 (0x3ffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000000000000000L'" (* 20769187434139310514121985316880384 (0x40000000000000000000000000000L) *)
  := (Const 20769187434139310514121985316880384%Z).
Notation "'0x40000000000000000000000000000L'" (* 20769187434139310514121985316880384 (0x40000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000000000000000001L'" (* 20769187434139310514121985316880385 (0x40000000000000000000000000001L) *)
  := (Const 20769187434139310514121985316880385%Z).
Notation "'0x40000000000000000000000000001L'" (* 20769187434139310514121985316880385 (0x40000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffL'" (* 41538374868278621028243970633760767 (0x7ffffffffffffffffffffffffffffL) *)
  := (Const 41538374868278621028243970633760767%Z).
Notation "'0x7ffffffffffffffffffffffffffffL'" (* 41538374868278621028243970633760767 (0x7ffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000000000000000L'" (* 41538374868278621028243970633760768 (0x80000000000000000000000000000L) *)
  := (Const 41538374868278621028243970633760768%Z).
Notation "'0x80000000000000000000000000000L'" (* 41538374868278621028243970633760768 (0x80000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000000000000000001L'" (* 41538374868278621028243970633760769 (0x80000000000000000000000000001L) *)
  := (Const 41538374868278621028243970633760769%Z).
Notation "'0x80000000000000000000000000001L'" (* 41538374868278621028243970633760769 (0x80000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffL'" (* 83076749736557242056487941267521535 (0xfffffffffffffffffffffffffffffL) *)
  := (Const 83076749736557242056487941267521535%Z).
Notation "'0xfffffffffffffffffffffffffffffL'" (* 83076749736557242056487941267521535 (0xfffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000000000000000L'" (* 83076749736557242056487941267521536 (0x100000000000000000000000000000L) *)
  := (Const 83076749736557242056487941267521536%Z).
Notation "'0x100000000000000000000000000000L'" (* 83076749736557242056487941267521536 (0x100000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000000000000000001L'" (* 83076749736557242056487941267521537 (0x100000000000000000000000000001L) *)
  := (Const 83076749736557242056487941267521537%Z).
Notation "'0x100000000000000000000000000001L'" (* 83076749736557242056487941267521537 (0x100000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffL'" (* 166153499473114484112975882535043071 (0x1fffffffffffffffffffffffffffffL) *)
  := (Const 166153499473114484112975882535043071%Z).
Notation "'0x1fffffffffffffffffffffffffffffL'" (* 166153499473114484112975882535043071 (0x1fffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000000000000000L'" (* 166153499473114484112975882535043072 (0x200000000000000000000000000000L) *)
  := (Const 166153499473114484112975882535043072%Z).
Notation "'0x200000000000000000000000000000L'" (* 166153499473114484112975882535043072 (0x200000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000000000000000001L'" (* 166153499473114484112975882535043073 (0x200000000000000000000000000001L) *)
  := (Const 166153499473114484112975882535043073%Z).
Notation "'0x200000000000000000000000000001L'" (* 166153499473114484112975882535043073 (0x200000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffL'" (* 332306998946228968225951765070086143 (0x3fffffffffffffffffffffffffffffL) *)
  := (Const 332306998946228968225951765070086143%Z).
Notation "'0x3fffffffffffffffffffffffffffffL'" (* 332306998946228968225951765070086143 (0x3fffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000000000000000L'" (* 332306998946228968225951765070086144 (0x400000000000000000000000000000L) *)
  := (Const 332306998946228968225951765070086144%Z).
Notation "'0x400000000000000000000000000000L'" (* 332306998946228968225951765070086144 (0x400000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000000000000000001L'" (* 332306998946228968225951765070086145 (0x400000000000000000000000000001L) *)
  := (Const 332306998946228968225951765070086145%Z).
Notation "'0x400000000000000000000000000001L'" (* 332306998946228968225951765070086145 (0x400000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffL'" (* 664613997892457936451903530140172287 (0x7fffffffffffffffffffffffffffffL) *)
  := (Const 664613997892457936451903530140172287%Z).
Notation "'0x7fffffffffffffffffffffffffffffL'" (* 664613997892457936451903530140172287 (0x7fffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000000000000000L'" (* 664613997892457936451903530140172288 (0x800000000000000000000000000000L) *)
  := (Const 664613997892457936451903530140172288%Z).
Notation "'0x800000000000000000000000000000L'" (* 664613997892457936451903530140172288 (0x800000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000000000000000001L'" (* 664613997892457936451903530140172289 (0x800000000000000000000000000001L) *)
  := (Const 664613997892457936451903530140172289%Z).
Notation "'0x800000000000000000000000000001L'" (* 664613997892457936451903530140172289 (0x800000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffL'" (* 1329227995784915872903807060280344575 (0xffffffffffffffffffffffffffffffL) *)
  := (Const 1329227995784915872903807060280344575%Z).
Notation "'0xffffffffffffffffffffffffffffffL'" (* 1329227995784915872903807060280344575 (0xffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000000000000000L'" (* 1329227995784915872903807060280344576 (0x1000000000000000000000000000000L) *)
  := (Const 1329227995784915872903807060280344576%Z).
Notation "'0x1000000000000000000000000000000L'" (* 1329227995784915872903807060280344576 (0x1000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000000000000000001L'" (* 1329227995784915872903807060280344577 (0x1000000000000000000000000000001L) *)
  := (Const 1329227995784915872903807060280344577%Z).
Notation "'0x1000000000000000000000000000001L'" (* 1329227995784915872903807060280344577 (0x1000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffL'" (* 2658455991569831745807614120560689151 (0x1ffffffffffffffffffffffffffffffL) *)
  := (Const 2658455991569831745807614120560689151%Z).
Notation "'0x1ffffffffffffffffffffffffffffffL'" (* 2658455991569831745807614120560689151 (0x1ffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000000000000000L'" (* 2658455991569831745807614120560689152 (0x2000000000000000000000000000000L) *)
  := (Const 2658455991569831745807614120560689152%Z).
Notation "'0x2000000000000000000000000000000L'" (* 2658455991569831745807614120560689152 (0x2000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000000000000000001L'" (* 2658455991569831745807614120560689153 (0x2000000000000000000000000000001L) *)
  := (Const 2658455991569831745807614120560689153%Z).
Notation "'0x2000000000000000000000000000001L'" (* 2658455991569831745807614120560689153 (0x2000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffL'" (* 5316911983139663491615228241121378303 (0x3ffffffffffffffffffffffffffffffL) *)
  := (Const 5316911983139663491615228241121378303%Z).
Notation "'0x3ffffffffffffffffffffffffffffffL'" (* 5316911983139663491615228241121378303 (0x3ffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000000000000000L'" (* 5316911983139663491615228241121378304 (0x4000000000000000000000000000000L) *)
  := (Const 5316911983139663491615228241121378304%Z).
Notation "'0x4000000000000000000000000000000L'" (* 5316911983139663491615228241121378304 (0x4000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000000000000000001L'" (* 5316911983139663491615228241121378305 (0x4000000000000000000000000000001L) *)
  := (Const 5316911983139663491615228241121378305%Z).
Notation "'0x4000000000000000000000000000001L'" (* 5316911983139663491615228241121378305 (0x4000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffL'" (* 10633823966279326983230456482242756607 (0x7ffffffffffffffffffffffffffffffL) *)
  := (Const 10633823966279326983230456482242756607%Z).
Notation "'0x7ffffffffffffffffffffffffffffffL'" (* 10633823966279326983230456482242756607 (0x7ffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000000000000000L'" (* 10633823966279326983230456482242756608 (0x8000000000000000000000000000000L) *)
  := (Const 10633823966279326983230456482242756608%Z).
Notation "'0x8000000000000000000000000000000L'" (* 10633823966279326983230456482242756608 (0x8000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000000000000000001L'" (* 10633823966279326983230456482242756609 (0x8000000000000000000000000000001L) *)
  := (Const 10633823966279326983230456482242756609%Z).
Notation "'0x8000000000000000000000000000001L'" (* 10633823966279326983230456482242756609 (0x8000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffL'" (* 21267647932558653966460912964485513215 (0xfffffffffffffffffffffffffffffffL) *)
  := (Const 21267647932558653966460912964485513215%Z).
Notation "'0xfffffffffffffffffffffffffffffffL'" (* 21267647932558653966460912964485513215 (0xfffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000000000000000000L'" (* 21267647932558653966460912964485513216 (0x10000000000000000000000000000000L) *)
  := (Const 21267647932558653966460912964485513216%Z).
Notation "'0x10000000000000000000000000000000L'" (* 21267647932558653966460912964485513216 (0x10000000000000000000000000000000L) *)
  := (Const WO~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000000000000000000001L'" (* 21267647932558653966460912964485513217 (0x10000000000000000000000000000001L) *)
  := (Const 21267647932558653966460912964485513217%Z).
Notation "'0x10000000000000000000000000000001L'" (* 21267647932558653966460912964485513217 (0x10000000000000000000000000000001L) *)
  := (Const WO~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffL'" (* 42535295865117307932921825928971026431 (0x1fffffffffffffffffffffffffffffffL) *)
  := (Const 42535295865117307932921825928971026431%Z).
Notation "'0x1fffffffffffffffffffffffffffffffL'" (* 42535295865117307932921825928971026431 (0x1fffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000000000000000000L'" (* 42535295865117307932921825928971026432 (0x20000000000000000000000000000000L) *)
  := (Const 42535295865117307932921825928971026432%Z).
Notation "'0x20000000000000000000000000000000L'" (* 42535295865117307932921825928971026432 (0x20000000000000000000000000000000L) *)
  := (Const WO~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000000000000000000001L'" (* 42535295865117307932921825928971026433 (0x20000000000000000000000000000001L) *)
  := (Const 42535295865117307932921825928971026433%Z).
Notation "'0x20000000000000000000000000000001L'" (* 42535295865117307932921825928971026433 (0x20000000000000000000000000000001L) *)
  := (Const WO~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffL'" (* 85070591730234615865843651857942052863 (0x3fffffffffffffffffffffffffffffffL) *)
  := (Const 85070591730234615865843651857942052863%Z).
Notation "'0x3fffffffffffffffffffffffffffffffL'" (* 85070591730234615865843651857942052863 (0x3fffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000000000000000000L'" (* 85070591730234615865843651857942052864 (0x40000000000000000000000000000000L) *)
  := (Const 85070591730234615865843651857942052864%Z).
Notation "'0x40000000000000000000000000000000L'" (* 85070591730234615865843651857942052864 (0x40000000000000000000000000000000L) *)
  := (Const WO~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000000000000000000001L'" (* 85070591730234615865843651857942052865 (0x40000000000000000000000000000001L) *)
  := (Const 85070591730234615865843651857942052865%Z).
Notation "'0x40000000000000000000000000000001L'" (* 85070591730234615865843651857942052865 (0x40000000000000000000000000000001L) *)
  := (Const WO~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffL'" (* 170141183460469231731687303715884105727 (0x7fffffffffffffffffffffffffffffffL) *)
  := (Const 170141183460469231731687303715884105727%Z).
Notation "'0x7fffffffffffffffffffffffffffffffL'" (* 170141183460469231731687303715884105727 (0x7fffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000000000000000000L'" (* 170141183460469231731687303715884105728 (0x80000000000000000000000000000000L) *)
  := (Const 170141183460469231731687303715884105728%Z).
Notation "'0x80000000000000000000000000000000L'" (* 170141183460469231731687303715884105728 (0x80000000000000000000000000000000L) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000000000000000000001L'" (* 170141183460469231731687303715884105729 (0x80000000000000000000000000000001L) *)
  := (Const 170141183460469231731687303715884105729%Z).
Notation "'0x80000000000000000000000000000001L'" (* 170141183460469231731687303715884105729 (0x80000000000000000000000000000001L) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffff000000010000000000000000L'" (* 340282366841710300967557013911933812736 (0xffffffff000000010000000000000000L) *)
  := (Const 340282366841710300967557013911933812736%Z).
Notation "'0xffffffff000000010000000000000000L'" (* 340282366841710300967557013911933812736 (0xffffffff000000010000000000000000L) *)
  := (Const WO~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0xffffffffffffffffffffffffffffffffL'" (* 340282366920938463463374607431768211455 (0xffffffffffffffffffffffffffffffffL) *)
  := (Const 340282366920938463463374607431768211455%Z).
Notation "'0xffffffffffffffffffffffffffffffffL'" (* 340282366920938463463374607431768211455 (0xffffffffffffffffffffffffffffffffL) *)
  := (Const WO~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000000000000000000L'" (* 340282366920938463463374607431768211456 (0x100000000000000000000000000000000L) *)
  := (Const 340282366920938463463374607431768211456%Z).
Notation "'0x100000000000000000000000000000000L'" (* 340282366920938463463374607431768211456 (0x100000000000000000000000000000000L) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000000000000000000001L'" (* 340282366920938463463374607431768211457 (0x100000000000000000000000000000001L) *)
  := (Const 340282366920938463463374607431768211457%Z).
Notation "'0x100000000000000000000000000000001L'" (* 340282366920938463463374607431768211457 (0x100000000000000000000000000000001L) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffL'" (* 680564733841876926926749214863536422911 (0x1ffffffffffffffffffffffffffffffffL) *)
  := (Const 680564733841876926926749214863536422911%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffL'" (* 680564733841876926926749214863536422911 (0x1ffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000000000000000000L'" (* 680564733841876926926749214863536422912 (0x200000000000000000000000000000000L) *)
  := (Const 680564733841876926926749214863536422912%Z).
Notation "'0x200000000000000000000000000000000L'" (* 680564733841876926926749214863536422912 (0x200000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000000000000000000001L'" (* 680564733841876926926749214863536422913 (0x200000000000000000000000000000001L) *)
  := (Const 680564733841876926926749214863536422913%Z).
Notation "'0x200000000000000000000000000000001L'" (* 680564733841876926926749214863536422913 (0x200000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffL'" (* 1361129467683753853853498429727072845823 (0x3ffffffffffffffffffffffffffffffffL) *)
  := (Const 1361129467683753853853498429727072845823%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffL'" (* 1361129467683753853853498429727072845823 (0x3ffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000000000000000000L'" (* 1361129467683753853853498429727072845824 (0x400000000000000000000000000000000L) *)
  := (Const 1361129467683753853853498429727072845824%Z).
Notation "'0x400000000000000000000000000000000L'" (* 1361129467683753853853498429727072845824 (0x400000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000000000000000000001L'" (* 1361129467683753853853498429727072845825 (0x400000000000000000000000000000001L) *)
  := (Const 1361129467683753853853498429727072845825%Z).
Notation "'0x400000000000000000000000000000001L'" (* 1361129467683753853853498429727072845825 (0x400000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffL'" (* 2722258935367507707706996859454145691647 (0x7ffffffffffffffffffffffffffffffffL) *)
  := (Const 2722258935367507707706996859454145691647%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffL'" (* 2722258935367507707706996859454145691647 (0x7ffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000000000000000000L'" (* 2722258935367507707706996859454145691648 (0x800000000000000000000000000000000L) *)
  := (Const 2722258935367507707706996859454145691648%Z).
Notation "'0x800000000000000000000000000000000L'" (* 2722258935367507707706996859454145691648 (0x800000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000000000000000000001L'" (* 2722258935367507707706996859454145691649 (0x800000000000000000000000000000001L) *)
  := (Const 2722258935367507707706996859454145691649%Z).
Notation "'0x800000000000000000000000000000001L'" (* 2722258935367507707706996859454145691649 (0x800000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffL'" (* 5444517870735015415413993718908291383295 (0xfffffffffffffffffffffffffffffffffL) *)
  := (Const 5444517870735015415413993718908291383295%Z).
Notation "'0xfffffffffffffffffffffffffffffffffL'" (* 5444517870735015415413993718908291383295 (0xfffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000000000000000000L'" (* 5444517870735015415413993718908291383296 (0x1000000000000000000000000000000000L) *)
  := (Const 5444517870735015415413993718908291383296%Z).
Notation "'0x1000000000000000000000000000000000L'" (* 5444517870735015415413993718908291383296 (0x1000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000000000000000000001L'" (* 5444517870735015415413993718908291383297 (0x1000000000000000000000000000000001L) *)
  := (Const 5444517870735015415413993718908291383297%Z).
Notation "'0x1000000000000000000000000000000001L'" (* 5444517870735015415413993718908291383297 (0x1000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffL'" (* 10889035741470030830827987437816582766591 (0x1fffffffffffffffffffffffffffffffffL) *)
  := (Const 10889035741470030830827987437816582766591%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffL'" (* 10889035741470030830827987437816582766591 (0x1fffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000000000000000000L'" (* 10889035741470030830827987437816582766592 (0x2000000000000000000000000000000000L) *)
  := (Const 10889035741470030830827987437816582766592%Z).
Notation "'0x2000000000000000000000000000000000L'" (* 10889035741470030830827987437816582766592 (0x2000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000000000000000000001L'" (* 10889035741470030830827987437816582766593 (0x2000000000000000000000000000000001L) *)
  := (Const 10889035741470030830827987437816582766593%Z).
Notation "'0x2000000000000000000000000000000001L'" (* 10889035741470030830827987437816582766593 (0x2000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffL'" (* 21778071482940061661655974875633165533183 (0x3fffffffffffffffffffffffffffffffffL) *)
  := (Const 21778071482940061661655974875633165533183%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffL'" (* 21778071482940061661655974875633165533183 (0x3fffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000000000000000000L'" (* 21778071482940061661655974875633165533184 (0x4000000000000000000000000000000000L) *)
  := (Const 21778071482940061661655974875633165533184%Z).
Notation "'0x4000000000000000000000000000000000L'" (* 21778071482940061661655974875633165533184 (0x4000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000000000000000000001L'" (* 21778071482940061661655974875633165533185 (0x4000000000000000000000000000000001L) *)
  := (Const 21778071482940061661655974875633165533185%Z).
Notation "'0x4000000000000000000000000000000001L'" (* 21778071482940061661655974875633165533185 (0x4000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffL'" (* 43556142965880123323311949751266331066367 (0x7fffffffffffffffffffffffffffffffffL) *)
  := (Const 43556142965880123323311949751266331066367%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffL'" (* 43556142965880123323311949751266331066367 (0x7fffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000000000000000000L'" (* 43556142965880123323311949751266331066368 (0x8000000000000000000000000000000000L) *)
  := (Const 43556142965880123323311949751266331066368%Z).
Notation "'0x8000000000000000000000000000000000L'" (* 43556142965880123323311949751266331066368 (0x8000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000000000000000000001L'" (* 43556142965880123323311949751266331066369 (0x8000000000000000000000000000000001L) *)
  := (Const 43556142965880123323311949751266331066369%Z).
Notation "'0x8000000000000000000000000000000001L'" (* 43556142965880123323311949751266331066369 (0x8000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffffffL'" (* 87112285931760246646623899502532662132735 (0xffffffffffffffffffffffffffffffffffL) *)
  := (Const 87112285931760246646623899502532662132735%Z).
Notation "'0xffffffffffffffffffffffffffffffffffL'" (* 87112285931760246646623899502532662132735 (0xffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000000000000000000000L'" (* 87112285931760246646623899502532662132736 (0x10000000000000000000000000000000000L) *)
  := (Const 87112285931760246646623899502532662132736%Z).
Notation "'0x10000000000000000000000000000000000L'" (* 87112285931760246646623899502532662132736 (0x10000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000000000000000000000001L'" (* 87112285931760246646623899502532662132737 (0x10000000000000000000000000000000001L) *)
  := (Const 87112285931760246646623899502532662132737%Z).
Notation "'0x10000000000000000000000000000000001L'" (* 87112285931760246646623899502532662132737 (0x10000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffffL'" (* 174224571863520493293247799005065324265471 (0x1ffffffffffffffffffffffffffffffffffL) *)
  := (Const 174224571863520493293247799005065324265471%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffffL'" (* 174224571863520493293247799005065324265471 (0x1ffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000000000000000000000L'" (* 174224571863520493293247799005065324265472 (0x20000000000000000000000000000000000L) *)
  := (Const 174224571863520493293247799005065324265472%Z).
Notation "'0x20000000000000000000000000000000000L'" (* 174224571863520493293247799005065324265472 (0x20000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000000000000000000000001L'" (* 174224571863520493293247799005065324265473 (0x20000000000000000000000000000000001L) *)
  := (Const 174224571863520493293247799005065324265473%Z).
Notation "'0x20000000000000000000000000000000001L'" (* 174224571863520493293247799005065324265473 (0x20000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffffL'" (* 348449143727040986586495598010130648530943 (0x3ffffffffffffffffffffffffffffffffffL) *)
  := (Const 348449143727040986586495598010130648530943%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffffL'" (* 348449143727040986586495598010130648530943 (0x3ffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000000000000000000000L'" (* 348449143727040986586495598010130648530944 (0x40000000000000000000000000000000000L) *)
  := (Const 348449143727040986586495598010130648530944%Z).
Notation "'0x40000000000000000000000000000000000L'" (* 348449143727040986586495598010130648530944 (0x40000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000000000000000000000001L'" (* 348449143727040986586495598010130648530945 (0x40000000000000000000000000000000001L) *)
  := (Const 348449143727040986586495598010130648530945%Z).
Notation "'0x40000000000000000000000000000000001L'" (* 348449143727040986586495598010130648530945 (0x40000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffffL'" (* 696898287454081973172991196020261297061887 (0x7ffffffffffffffffffffffffffffffffffL) *)
  := (Const 696898287454081973172991196020261297061887%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffffL'" (* 696898287454081973172991196020261297061887 (0x7ffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000000000000000000000L'" (* 696898287454081973172991196020261297061888 (0x80000000000000000000000000000000000L) *)
  := (Const 696898287454081973172991196020261297061888%Z).
Notation "'0x80000000000000000000000000000000000L'" (* 696898287454081973172991196020261297061888 (0x80000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000000000000000000000001L'" (* 696898287454081973172991196020261297061889 (0x80000000000000000000000000000000001L) *)
  := (Const 696898287454081973172991196020261297061889%Z).
Notation "'0x80000000000000000000000000000000001L'" (* 696898287454081973172991196020261297061889 (0x80000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffffL'" (* 1393796574908163946345982392040522594123775 (0xfffffffffffffffffffffffffffffffffffL) *)
  := (Const 1393796574908163946345982392040522594123775%Z).
Notation "'0xfffffffffffffffffffffffffffffffffffL'" (* 1393796574908163946345982392040522594123775 (0xfffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000000000000000000000L'" (* 1393796574908163946345982392040522594123776 (0x100000000000000000000000000000000000L) *)
  := (Const 1393796574908163946345982392040522594123776%Z).
Notation "'0x100000000000000000000000000000000000L'" (* 1393796574908163946345982392040522594123776 (0x100000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000000000000000000000001L'" (* 1393796574908163946345982392040522594123777 (0x100000000000000000000000000000000001L) *)
  := (Const 1393796574908163946345982392040522594123777%Z).
Notation "'0x100000000000000000000000000000000001L'" (* 1393796574908163946345982392040522594123777 (0x100000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffffL'" (* 2787593149816327892691964784081045188247551 (0x1fffffffffffffffffffffffffffffffffffL) *)
  := (Const 2787593149816327892691964784081045188247551%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffffL'" (* 2787593149816327892691964784081045188247551 (0x1fffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000000000000000000000L'" (* 2787593149816327892691964784081045188247552 (0x200000000000000000000000000000000000L) *)
  := (Const 2787593149816327892691964784081045188247552%Z).
Notation "'0x200000000000000000000000000000000000L'" (* 2787593149816327892691964784081045188247552 (0x200000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000000000000000000000001L'" (* 2787593149816327892691964784081045188247553 (0x200000000000000000000000000000000001L) *)
  := (Const 2787593149816327892691964784081045188247553%Z).
Notation "'0x200000000000000000000000000000000001L'" (* 2787593149816327892691964784081045188247553 (0x200000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffffL'" (* 5575186299632655785383929568162090376495103 (0x3fffffffffffffffffffffffffffffffffffL) *)
  := (Const 5575186299632655785383929568162090376495103%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffffL'" (* 5575186299632655785383929568162090376495103 (0x3fffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000000000000000000000L'" (* 5575186299632655785383929568162090376495104 (0x400000000000000000000000000000000000L) *)
  := (Const 5575186299632655785383929568162090376495104%Z).
Notation "'0x400000000000000000000000000000000000L'" (* 5575186299632655785383929568162090376495104 (0x400000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000000000000000000000001L'" (* 5575186299632655785383929568162090376495105 (0x400000000000000000000000000000000001L) *)
  := (Const 5575186299632655785383929568162090376495105%Z).
Notation "'0x400000000000000000000000000000000001L'" (* 5575186299632655785383929568162090376495105 (0x400000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffffL'" (* 11150372599265311570767859136324180752990207 (0x7fffffffffffffffffffffffffffffffffffL) *)
  := (Const 11150372599265311570767859136324180752990207%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffffL'" (* 11150372599265311570767859136324180752990207 (0x7fffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000000000000000000000L'" (* 11150372599265311570767859136324180752990208 (0x800000000000000000000000000000000000L) *)
  := (Const 11150372599265311570767859136324180752990208%Z).
Notation "'0x800000000000000000000000000000000000L'" (* 11150372599265311570767859136324180752990208 (0x800000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000000000000000000000001L'" (* 11150372599265311570767859136324180752990209 (0x800000000000000000000000000000000001L) *)
  := (Const 11150372599265311570767859136324180752990209%Z).
Notation "'0x800000000000000000000000000000000001L'" (* 11150372599265311570767859136324180752990209 (0x800000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffffffffL'" (* 22300745198530623141535718272648361505980415 (0xffffffffffffffffffffffffffffffffffffL) *)
  := (Const 22300745198530623141535718272648361505980415%Z).
Notation "'0xffffffffffffffffffffffffffffffffffffL'" (* 22300745198530623141535718272648361505980415 (0xffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000000000000000000000L'" (* 22300745198530623141535718272648361505980416 (0x1000000000000000000000000000000000000L) *)
  := (Const 22300745198530623141535718272648361505980416%Z).
Notation "'0x1000000000000000000000000000000000000L'" (* 22300745198530623141535718272648361505980416 (0x1000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000000000000000000000001L'" (* 22300745198530623141535718272648361505980417 (0x1000000000000000000000000000000000001L) *)
  := (Const 22300745198530623141535718272648361505980417%Z).
Notation "'0x1000000000000000000000000000000000001L'" (* 22300745198530623141535718272648361505980417 (0x1000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffffffL'" (* 44601490397061246283071436545296723011960831 (0x1ffffffffffffffffffffffffffffffffffffL) *)
  := (Const 44601490397061246283071436545296723011960831%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffffffL'" (* 44601490397061246283071436545296723011960831 (0x1ffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000000000000000000000L'" (* 44601490397061246283071436545296723011960832 (0x2000000000000000000000000000000000000L) *)
  := (Const 44601490397061246283071436545296723011960832%Z).
Notation "'0x2000000000000000000000000000000000000L'" (* 44601490397061246283071436545296723011960832 (0x2000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000000000000000000000001L'" (* 44601490397061246283071436545296723011960833 (0x2000000000000000000000000000000000001L) *)
  := (Const 44601490397061246283071436545296723011960833%Z).
Notation "'0x2000000000000000000000000000000000001L'" (* 44601490397061246283071436545296723011960833 (0x2000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffffffL'" (* 89202980794122492566142873090593446023921663 (0x3ffffffffffffffffffffffffffffffffffffL) *)
  := (Const 89202980794122492566142873090593446023921663%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffffffL'" (* 89202980794122492566142873090593446023921663 (0x3ffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000000000000000000000L'" (* 89202980794122492566142873090593446023921664 (0x4000000000000000000000000000000000000L) *)
  := (Const 89202980794122492566142873090593446023921664%Z).
Notation "'0x4000000000000000000000000000000000000L'" (* 89202980794122492566142873090593446023921664 (0x4000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000000000000000000000001L'" (* 89202980794122492566142873090593446023921665 (0x4000000000000000000000000000000000001L) *)
  := (Const 89202980794122492566142873090593446023921665%Z).
Notation "'0x4000000000000000000000000000000000001L'" (* 89202980794122492566142873090593446023921665 (0x4000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffffffL'" (* 178405961588244985132285746181186892047843327 (0x7ffffffffffffffffffffffffffffffffffffL) *)
  := (Const 178405961588244985132285746181186892047843327%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffffffL'" (* 178405961588244985132285746181186892047843327 (0x7ffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000000000000000000000L'" (* 178405961588244985132285746181186892047843328 (0x8000000000000000000000000000000000000L) *)
  := (Const 178405961588244985132285746181186892047843328%Z).
Notation "'0x8000000000000000000000000000000000000L'" (* 178405961588244985132285746181186892047843328 (0x8000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000000000000000000000001L'" (* 178405961588244985132285746181186892047843329 (0x8000000000000000000000000000000000001L) *)
  := (Const 178405961588244985132285746181186892047843329%Z).
Notation "'0x8000000000000000000000000000000000001L'" (* 178405961588244985132285746181186892047843329 (0x8000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffffffL'" (* 356811923176489970264571492362373784095686655 (0xfffffffffffffffffffffffffffffffffffffL) *)
  := (Const 356811923176489970264571492362373784095686655%Z).
Notation "'0xfffffffffffffffffffffffffffffffffffffL'" (* 356811923176489970264571492362373784095686655 (0xfffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000000000000000000000000L'" (* 356811923176489970264571492362373784095686656 (0x10000000000000000000000000000000000000L) *)
  := (Const 356811923176489970264571492362373784095686656%Z).
Notation "'0x10000000000000000000000000000000000000L'" (* 356811923176489970264571492362373784095686656 (0x10000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000000000000000000000000001L'" (* 356811923176489970264571492362373784095686657 (0x10000000000000000000000000000000000001L) *)
  := (Const 356811923176489970264571492362373784095686657%Z).
Notation "'0x10000000000000000000000000000000000001L'" (* 356811923176489970264571492362373784095686657 (0x10000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffffffL'" (* 713623846352979940529142984724747568191373311 (0x1fffffffffffffffffffffffffffffffffffffL) *)
  := (Const 713623846352979940529142984724747568191373311%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffffffL'" (* 713623846352979940529142984724747568191373311 (0x1fffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000000000000000000000000L'" (* 713623846352979940529142984724747568191373312 (0x20000000000000000000000000000000000000L) *)
  := (Const 713623846352979940529142984724747568191373312%Z).
Notation "'0x20000000000000000000000000000000000000L'" (* 713623846352979940529142984724747568191373312 (0x20000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000000000000000000000000001L'" (* 713623846352979940529142984724747568191373313 (0x20000000000000000000000000000000000001L) *)
  := (Const 713623846352979940529142984724747568191373313%Z).
Notation "'0x20000000000000000000000000000000000001L'" (* 713623846352979940529142984724747568191373313 (0x20000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffffffL'" (* 1427247692705959881058285969449495136382746623 (0x3fffffffffffffffffffffffffffffffffffffL) *)
  := (Const 1427247692705959881058285969449495136382746623%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffffffL'" (* 1427247692705959881058285969449495136382746623 (0x3fffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000000000000000000000000L'" (* 1427247692705959881058285969449495136382746624 (0x40000000000000000000000000000000000000L) *)
  := (Const 1427247692705959881058285969449495136382746624%Z).
Notation "'0x40000000000000000000000000000000000000L'" (* 1427247692705959881058285969449495136382746624 (0x40000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000000000000000000000000001L'" (* 1427247692705959881058285969449495136382746625 (0x40000000000000000000000000000000000001L) *)
  := (Const 1427247692705959881058285969449495136382746625%Z).
Notation "'0x40000000000000000000000000000000000001L'" (* 1427247692705959881058285969449495136382746625 (0x40000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffffffL'" (* 2854495385411919762116571938898990272765493247 (0x7fffffffffffffffffffffffffffffffffffffL) *)
  := (Const 2854495385411919762116571938898990272765493247%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffffffL'" (* 2854495385411919762116571938898990272765493247 (0x7fffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000000000000000000000000L'" (* 2854495385411919762116571938898990272765493248 (0x80000000000000000000000000000000000000L) *)
  := (Const 2854495385411919762116571938898990272765493248%Z).
Notation "'0x80000000000000000000000000000000000000L'" (* 2854495385411919762116571938898990272765493248 (0x80000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000000000000000000000000001L'" (* 2854495385411919762116571938898990272765493249 (0x80000000000000000000000000000000000001L) *)
  := (Const 2854495385411919762116571938898990272765493249%Z).
Notation "'0x80000000000000000000000000000000000001L'" (* 2854495385411919762116571938898990272765493249 (0x80000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffffffffffL'" (* 5708990770823839524233143877797980545530986495 (0xffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 5708990770823839524233143877797980545530986495%Z).
Notation "'0xffffffffffffffffffffffffffffffffffffffL'" (* 5708990770823839524233143877797980545530986495 (0xffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000000000000000000000000L'" (* 5708990770823839524233143877797980545530986496 (0x100000000000000000000000000000000000000L) *)
  := (Const 5708990770823839524233143877797980545530986496%Z).
Notation "'0x100000000000000000000000000000000000000L'" (* 5708990770823839524233143877797980545530986496 (0x100000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000000000000000000000000001L'" (* 5708990770823839524233143877797980545530986497 (0x100000000000000000000000000000000000001L) *)
  := (Const 5708990770823839524233143877797980545530986497%Z).
Notation "'0x100000000000000000000000000000000000001L'" (* 5708990770823839524233143877797980545530986497 (0x100000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffL'" (* 11417981541647679048466287755595961091061972991 (0x1ffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 11417981541647679048466287755595961091061972991%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffL'" (* 11417981541647679048466287755595961091061972991 (0x1ffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000000000000000000000000L'" (* 11417981541647679048466287755595961091061972992 (0x200000000000000000000000000000000000000L) *)
  := (Const 11417981541647679048466287755595961091061972992%Z).
Notation "'0x200000000000000000000000000000000000000L'" (* 11417981541647679048466287755595961091061972992 (0x200000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000000000000000000000000001L'" (* 11417981541647679048466287755595961091061972993 (0x200000000000000000000000000000000000001L) *)
  := (Const 11417981541647679048466287755595961091061972993%Z).
Notation "'0x200000000000000000000000000000000000001L'" (* 11417981541647679048466287755595961091061972993 (0x200000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffL'" (* 22835963083295358096932575511191922182123945983 (0x3ffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 22835963083295358096932575511191922182123945983%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffL'" (* 22835963083295358096932575511191922182123945983 (0x3ffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000000000000000000000000L'" (* 22835963083295358096932575511191922182123945984 (0x400000000000000000000000000000000000000L) *)
  := (Const 22835963083295358096932575511191922182123945984%Z).
Notation "'0x400000000000000000000000000000000000000L'" (* 22835963083295358096932575511191922182123945984 (0x400000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000000000000000000000000001L'" (* 22835963083295358096932575511191922182123945985 (0x400000000000000000000000000000000000001L) *)
  := (Const 22835963083295358096932575511191922182123945985%Z).
Notation "'0x400000000000000000000000000000000000001L'" (* 22835963083295358096932575511191922182123945985 (0x400000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffL'" (* 45671926166590716193865151022383844364247891967 (0x7ffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 45671926166590716193865151022383844364247891967%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffL'" (* 45671926166590716193865151022383844364247891967 (0x7ffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000000000000000000000000L'" (* 45671926166590716193865151022383844364247891968 (0x800000000000000000000000000000000000000L) *)
  := (Const 45671926166590716193865151022383844364247891968%Z).
Notation "'0x800000000000000000000000000000000000000L'" (* 45671926166590716193865151022383844364247891968 (0x800000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000000000000000000000000001L'" (* 45671926166590716193865151022383844364247891969 (0x800000000000000000000000000000000000001L) *)
  := (Const 45671926166590716193865151022383844364247891969%Z).
Notation "'0x800000000000000000000000000000000000001L'" (* 45671926166590716193865151022383844364247891969 (0x800000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffffffffL'" (* 91343852333181432387730302044767688728495783935 (0xfffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 91343852333181432387730302044767688728495783935%Z).
Notation "'0xfffffffffffffffffffffffffffffffffffffffL'" (* 91343852333181432387730302044767688728495783935 (0xfffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000000000000000000000000L'" (* 91343852333181432387730302044767688728495783936 (0x1000000000000000000000000000000000000000L) *)
  := (Const 91343852333181432387730302044767688728495783936%Z).
Notation "'0x1000000000000000000000000000000000000000L'" (* 91343852333181432387730302044767688728495783936 (0x1000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000000000000000000000000001L'" (* 91343852333181432387730302044767688728495783937 (0x1000000000000000000000000000000000000001L) *)
  := (Const 91343852333181432387730302044767688728495783937%Z).
Notation "'0x1000000000000000000000000000000000000001L'" (* 91343852333181432387730302044767688728495783937 (0x1000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffL'" (* 182687704666362864775460604089535377456991567871 (0x1fffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 182687704666362864775460604089535377456991567871%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffL'" (* 182687704666362864775460604089535377456991567871 (0x1fffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000000000000000000000000L'" (* 182687704666362864775460604089535377456991567872 (0x2000000000000000000000000000000000000000L) *)
  := (Const 182687704666362864775460604089535377456991567872%Z).
Notation "'0x2000000000000000000000000000000000000000L'" (* 182687704666362864775460604089535377456991567872 (0x2000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000000000000000000000000001L'" (* 182687704666362864775460604089535377456991567873 (0x2000000000000000000000000000000000000001L) *)
  := (Const 182687704666362864775460604089535377456991567873%Z).
Notation "'0x2000000000000000000000000000000000000001L'" (* 182687704666362864775460604089535377456991567873 (0x2000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffL'" (* 365375409332725729550921208179070754913983135743 (0x3fffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 365375409332725729550921208179070754913983135743%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffL'" (* 365375409332725729550921208179070754913983135743 (0x3fffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000000000000000000000000L'" (* 365375409332725729550921208179070754913983135744 (0x4000000000000000000000000000000000000000L) *)
  := (Const 365375409332725729550921208179070754913983135744%Z).
Notation "'0x4000000000000000000000000000000000000000L'" (* 365375409332725729550921208179070754913983135744 (0x4000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000000000000000000000000001L'" (* 365375409332725729550921208179070754913983135745 (0x4000000000000000000000000000000000000001L) *)
  := (Const 365375409332725729550921208179070754913983135745%Z).
Notation "'0x4000000000000000000000000000000000000001L'" (* 365375409332725729550921208179070754913983135745 (0x4000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffL'" (* 730750818665451459101842416358141509827966271487 (0x7fffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 730750818665451459101842416358141509827966271487%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffL'" (* 730750818665451459101842416358141509827966271487 (0x7fffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000000000000000000000000L'" (* 730750818665451459101842416358141509827966271488 (0x8000000000000000000000000000000000000000L) *)
  := (Const 730750818665451459101842416358141509827966271488%Z).
Notation "'0x8000000000000000000000000000000000000000L'" (* 730750818665451459101842416358141509827966271488 (0x8000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000000000000000000000000001L'" (* 730750818665451459101842416358141509827966271489 (0x8000000000000000000000000000000000000001L) *)
  := (Const 730750818665451459101842416358141509827966271489%Z).
Notation "'0x8000000000000000000000000000000000000001L'" (* 730750818665451459101842416358141509827966271489 (0x8000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffffffffffffL'" (* 1461501637330902918203684832716283019655932542975 (0xffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 1461501637330902918203684832716283019655932542975%Z).
Notation "'0xffffffffffffffffffffffffffffffffffffffffL'" (* 1461501637330902918203684832716283019655932542975 (0xffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000000000000000000000000000L'" (* 1461501637330902918203684832716283019655932542976 (0x10000000000000000000000000000000000000000L) *)
  := (Const 1461501637330902918203684832716283019655932542976%Z).
Notation "'0x10000000000000000000000000000000000000000L'" (* 1461501637330902918203684832716283019655932542976 (0x10000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000000000000000000000000000001L'" (* 1461501637330902918203684832716283019655932542977 (0x10000000000000000000000000000000000000001L) *)
  := (Const 1461501637330902918203684832716283019655932542977%Z).
Notation "'0x10000000000000000000000000000000000000001L'" (* 1461501637330902918203684832716283019655932542977 (0x10000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffL'" (* 2923003274661805836407369665432566039311865085951 (0x1ffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 2923003274661805836407369665432566039311865085951%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffL'" (* 2923003274661805836407369665432566039311865085951 (0x1ffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000000000000000000000000000L'" (* 2923003274661805836407369665432566039311865085952 (0x20000000000000000000000000000000000000000L) *)
  := (Const 2923003274661805836407369665432566039311865085952%Z).
Notation "'0x20000000000000000000000000000000000000000L'" (* 2923003274661805836407369665432566039311865085952 (0x20000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000000000000000000000000000001L'" (* 2923003274661805836407369665432566039311865085953 (0x20000000000000000000000000000000000000001L) *)
  := (Const 2923003274661805836407369665432566039311865085953%Z).
Notation "'0x20000000000000000000000000000000000000001L'" (* 2923003274661805836407369665432566039311865085953 (0x20000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffL'" (* 5846006549323611672814739330865132078623730171903 (0x3ffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 5846006549323611672814739330865132078623730171903%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffL'" (* 5846006549323611672814739330865132078623730171903 (0x3ffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000000000000000000000000000L'" (* 5846006549323611672814739330865132078623730171904 (0x40000000000000000000000000000000000000000L) *)
  := (Const 5846006549323611672814739330865132078623730171904%Z).
Notation "'0x40000000000000000000000000000000000000000L'" (* 5846006549323611672814739330865132078623730171904 (0x40000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000000000000000000000000000001L'" (* 5846006549323611672814739330865132078623730171905 (0x40000000000000000000000000000000000000001L) *)
  := (Const 5846006549323611672814739330865132078623730171905%Z).
Notation "'0x40000000000000000000000000000000000000001L'" (* 5846006549323611672814739330865132078623730171905 (0x40000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffL'" (* 11692013098647223345629478661730264157247460343807 (0x7ffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 11692013098647223345629478661730264157247460343807%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffL'" (* 11692013098647223345629478661730264157247460343807 (0x7ffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000000000000000000000000000L'" (* 11692013098647223345629478661730264157247460343808 (0x80000000000000000000000000000000000000000L) *)
  := (Const 11692013098647223345629478661730264157247460343808%Z).
Notation "'0x80000000000000000000000000000000000000000L'" (* 11692013098647223345629478661730264157247460343808 (0x80000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000000000000000000000000000001L'" (* 11692013098647223345629478661730264157247460343809 (0x80000000000000000000000000000000000000001L) *)
  := (Const 11692013098647223345629478661730264157247460343809%Z).
Notation "'0x80000000000000000000000000000000000000001L'" (* 11692013098647223345629478661730264157247460343809 (0x80000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffL'" (* 23384026197294446691258957323460528314494920687615 (0xfffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 23384026197294446691258957323460528314494920687615%Z).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffL'" (* 23384026197294446691258957323460528314494920687615 (0xfffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000000000000000000000000000L'" (* 23384026197294446691258957323460528314494920687616 (0x100000000000000000000000000000000000000000L) *)
  := (Const 23384026197294446691258957323460528314494920687616%Z).
Notation "'0x100000000000000000000000000000000000000000L'" (* 23384026197294446691258957323460528314494920687616 (0x100000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000000000000000000000000000001L'" (* 23384026197294446691258957323460528314494920687617 (0x100000000000000000000000000000000000000001L) *)
  := (Const 23384026197294446691258957323460528314494920687617%Z).
Notation "'0x100000000000000000000000000000000000000001L'" (* 23384026197294446691258957323460528314494920687617 (0x100000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffL'" (* 46768052394588893382517914646921056628989841375231 (0x1fffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 46768052394588893382517914646921056628989841375231%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffL'" (* 46768052394588893382517914646921056628989841375231 (0x1fffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000000000000000000000000000L'" (* 46768052394588893382517914646921056628989841375232 (0x200000000000000000000000000000000000000000L) *)
  := (Const 46768052394588893382517914646921056628989841375232%Z).
Notation "'0x200000000000000000000000000000000000000000L'" (* 46768052394588893382517914646921056628989841375232 (0x200000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000000000000000000000000000001L'" (* 46768052394588893382517914646921056628989841375233 (0x200000000000000000000000000000000000000001L) *)
  := (Const 46768052394588893382517914646921056628989841375233%Z).
Notation "'0x200000000000000000000000000000000000000001L'" (* 46768052394588893382517914646921056628989841375233 (0x200000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffL'" (* 93536104789177786765035829293842113257979682750463 (0x3fffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 93536104789177786765035829293842113257979682750463%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffL'" (* 93536104789177786765035829293842113257979682750463 (0x3fffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000000000000000000000000000L'" (* 93536104789177786765035829293842113257979682750464 (0x400000000000000000000000000000000000000000L) *)
  := (Const 93536104789177786765035829293842113257979682750464%Z).
Notation "'0x400000000000000000000000000000000000000000L'" (* 93536104789177786765035829293842113257979682750464 (0x400000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000000000000000000000000000001L'" (* 93536104789177786765035829293842113257979682750465 (0x400000000000000000000000000000000000000001L) *)
  := (Const 93536104789177786765035829293842113257979682750465%Z).
Notation "'0x400000000000000000000000000000000000000001L'" (* 93536104789177786765035829293842113257979682750465 (0x400000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffL'" (* 187072209578355573530071658587684226515959365500927 (0x7fffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 187072209578355573530071658587684226515959365500927%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffL'" (* 187072209578355573530071658587684226515959365500927 (0x7fffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000000000000000000000000000L'" (* 187072209578355573530071658587684226515959365500928 (0x800000000000000000000000000000000000000000L) *)
  := (Const 187072209578355573530071658587684226515959365500928%Z).
Notation "'0x800000000000000000000000000000000000000000L'" (* 187072209578355573530071658587684226515959365500928 (0x800000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000000000000000000000000000001L'" (* 187072209578355573530071658587684226515959365500929 (0x800000000000000000000000000000000000000001L) *)
  := (Const 187072209578355573530071658587684226515959365500929%Z).
Notation "'0x800000000000000000000000000000000000000001L'" (* 187072209578355573530071658587684226515959365500929 (0x800000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffL'" (* 374144419156711147060143317175368453031918731001855 (0xffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 374144419156711147060143317175368453031918731001855%Z).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffL'" (* 374144419156711147060143317175368453031918731001855 (0xffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000000000000000000000000000L'" (* 374144419156711147060143317175368453031918731001856 (0x1000000000000000000000000000000000000000000L) *)
  := (Const 374144419156711147060143317175368453031918731001856%Z).
Notation "'0x1000000000000000000000000000000000000000000L'" (* 374144419156711147060143317175368453031918731001856 (0x1000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000000000000000000000000000001L'" (* 374144419156711147060143317175368453031918731001857 (0x1000000000000000000000000000000000000000001L) *)
  := (Const 374144419156711147060143317175368453031918731001857%Z).
Notation "'0x1000000000000000000000000000000000000000001L'" (* 374144419156711147060143317175368453031918731001857 (0x1000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffL'" (* 748288838313422294120286634350736906063837462003711 (0x1ffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 748288838313422294120286634350736906063837462003711%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffL'" (* 748288838313422294120286634350736906063837462003711 (0x1ffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000000000000000000000000000L'" (* 748288838313422294120286634350736906063837462003712 (0x2000000000000000000000000000000000000000000L) *)
  := (Const 748288838313422294120286634350736906063837462003712%Z).
Notation "'0x2000000000000000000000000000000000000000000L'" (* 748288838313422294120286634350736906063837462003712 (0x2000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000000000000000000000000000001L'" (* 748288838313422294120286634350736906063837462003713 (0x2000000000000000000000000000000000000000001L) *)
  := (Const 748288838313422294120286634350736906063837462003713%Z).
Notation "'0x2000000000000000000000000000000000000000001L'" (* 748288838313422294120286634350736906063837462003713 (0x2000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffL'" (* 1496577676626844588240573268701473812127674924007423 (0x3ffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 1496577676626844588240573268701473812127674924007423%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffL'" (* 1496577676626844588240573268701473812127674924007423 (0x3ffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000000000000000000000000000L'" (* 1496577676626844588240573268701473812127674924007424 (0x4000000000000000000000000000000000000000000L) *)
  := (Const 1496577676626844588240573268701473812127674924007424%Z).
Notation "'0x4000000000000000000000000000000000000000000L'" (* 1496577676626844588240573268701473812127674924007424 (0x4000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000000000000000000000000000001L'" (* 1496577676626844588240573268701473812127674924007425 (0x4000000000000000000000000000000000000000001L) *)
  := (Const 1496577676626844588240573268701473812127674924007425%Z).
Notation "'0x4000000000000000000000000000000000000000001L'" (* 1496577676626844588240573268701473812127674924007425 (0x4000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffL'" (* 2993155353253689176481146537402947624255349848014847 (0x7ffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 2993155353253689176481146537402947624255349848014847%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffL'" (* 2993155353253689176481146537402947624255349848014847 (0x7ffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000000000000000000000000000L'" (* 2993155353253689176481146537402947624255349848014848 (0x8000000000000000000000000000000000000000000L) *)
  := (Const 2993155353253689176481146537402947624255349848014848%Z).
Notation "'0x8000000000000000000000000000000000000000000L'" (* 2993155353253689176481146537402947624255349848014848 (0x8000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000000000000000000000000000001L'" (* 2993155353253689176481146537402947624255349848014849 (0x8000000000000000000000000000000000000000001L) *)
  := (Const 2993155353253689176481146537402947624255349848014849%Z).
Notation "'0x8000000000000000000000000000000000000000001L'" (* 2993155353253689176481146537402947624255349848014849 (0x8000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffL'" (* 5986310706507378352962293074805895248510699696029695 (0xfffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 5986310706507378352962293074805895248510699696029695%Z).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffL'" (* 5986310706507378352962293074805895248510699696029695 (0xfffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000000000000000000000000000000L'" (* 5986310706507378352962293074805895248510699696029696 (0x10000000000000000000000000000000000000000000L) *)
  := (Const 5986310706507378352962293074805895248510699696029696%Z).
Notation "'0x10000000000000000000000000000000000000000000L'" (* 5986310706507378352962293074805895248510699696029696 (0x10000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000000000000000000000000000000001L'" (* 5986310706507378352962293074805895248510699696029697 (0x10000000000000000000000000000000000000000001L) *)
  := (Const 5986310706507378352962293074805895248510699696029697%Z).
Notation "'0x10000000000000000000000000000000000000000001L'" (* 5986310706507378352962293074805895248510699696029697 (0x10000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffL'" (* 11972621413014756705924586149611790497021399392059391 (0x1fffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 11972621413014756705924586149611790497021399392059391%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffL'" (* 11972621413014756705924586149611790497021399392059391 (0x1fffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000000000000000000000000000000L'" (* 11972621413014756705924586149611790497021399392059392 (0x20000000000000000000000000000000000000000000L) *)
  := (Const 11972621413014756705924586149611790497021399392059392%Z).
Notation "'0x20000000000000000000000000000000000000000000L'" (* 11972621413014756705924586149611790497021399392059392 (0x20000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000000000000000000000000000000001L'" (* 11972621413014756705924586149611790497021399392059393 (0x20000000000000000000000000000000000000000001L) *)
  := (Const 11972621413014756705924586149611790497021399392059393%Z).
Notation "'0x20000000000000000000000000000000000000000001L'" (* 11972621413014756705924586149611790497021399392059393 (0x20000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffL'" (* 23945242826029513411849172299223580994042798784118783 (0x3fffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 23945242826029513411849172299223580994042798784118783%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffL'" (* 23945242826029513411849172299223580994042798784118783 (0x3fffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000000000000000000000000000000L'" (* 23945242826029513411849172299223580994042798784118784 (0x40000000000000000000000000000000000000000000L) *)
  := (Const 23945242826029513411849172299223580994042798784118784%Z).
Notation "'0x40000000000000000000000000000000000000000000L'" (* 23945242826029513411849172299223580994042798784118784 (0x40000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000000000000000000000000000000001L'" (* 23945242826029513411849172299223580994042798784118785 (0x40000000000000000000000000000000000000000001L) *)
  := (Const 23945242826029513411849172299223580994042798784118785%Z).
Notation "'0x40000000000000000000000000000000000000000001L'" (* 23945242826029513411849172299223580994042798784118785 (0x40000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffL'" (* 47890485652059026823698344598447161988085597568237567 (0x7fffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 47890485652059026823698344598447161988085597568237567%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffL'" (* 47890485652059026823698344598447161988085597568237567 (0x7fffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000000000000000000000000000000L'" (* 47890485652059026823698344598447161988085597568237568 (0x80000000000000000000000000000000000000000000L) *)
  := (Const 47890485652059026823698344598447161988085597568237568%Z).
Notation "'0x80000000000000000000000000000000000000000000L'" (* 47890485652059026823698344598447161988085597568237568 (0x80000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000000000000000000000000000000001L'" (* 47890485652059026823698344598447161988085597568237569 (0x80000000000000000000000000000000000000000001L) *)
  := (Const 47890485652059026823698344598447161988085597568237569%Z).
Notation "'0x80000000000000000000000000000000000000000001L'" (* 47890485652059026823698344598447161988085597568237569 (0x80000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffL'" (* 95780971304118053647396689196894323976171195136475135 (0xffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 95780971304118053647396689196894323976171195136475135%Z).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffL'" (* 95780971304118053647396689196894323976171195136475135 (0xffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000000000000000000000000000000L'" (* 95780971304118053647396689196894323976171195136475136 (0x100000000000000000000000000000000000000000000L) *)
  := (Const 95780971304118053647396689196894323976171195136475136%Z).
Notation "'0x100000000000000000000000000000000000000000000L'" (* 95780971304118053647396689196894323976171195136475136 (0x100000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000000000000000000000000000000001L'" (* 95780971304118053647396689196894323976171195136475137 (0x100000000000000000000000000000000000000000001L) *)
  := (Const 95780971304118053647396689196894323976171195136475137%Z).
Notation "'0x100000000000000000000000000000000000000000001L'" (* 95780971304118053647396689196894323976171195136475137 (0x100000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffL'" (* 191561942608236107294793378393788647952342390272950271 (0x1ffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 191561942608236107294793378393788647952342390272950271%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffL'" (* 191561942608236107294793378393788647952342390272950271 (0x1ffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000000000000000000000000000000L'" (* 191561942608236107294793378393788647952342390272950272 (0x200000000000000000000000000000000000000000000L) *)
  := (Const 191561942608236107294793378393788647952342390272950272%Z).
Notation "'0x200000000000000000000000000000000000000000000L'" (* 191561942608236107294793378393788647952342390272950272 (0x200000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000000000000000000000000000000001L'" (* 191561942608236107294793378393788647952342390272950273 (0x200000000000000000000000000000000000000000001L) *)
  := (Const 191561942608236107294793378393788647952342390272950273%Z).
Notation "'0x200000000000000000000000000000000000000000001L'" (* 191561942608236107294793378393788647952342390272950273 (0x200000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffL'" (* 383123885216472214589586756787577295904684780545900543 (0x3ffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 383123885216472214589586756787577295904684780545900543%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffL'" (* 383123885216472214589586756787577295904684780545900543 (0x3ffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000000000000000000000000000000L'" (* 383123885216472214589586756787577295904684780545900544 (0x400000000000000000000000000000000000000000000L) *)
  := (Const 383123885216472214589586756787577295904684780545900544%Z).
Notation "'0x400000000000000000000000000000000000000000000L'" (* 383123885216472214589586756787577295904684780545900544 (0x400000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000000000000000000000000000000001L'" (* 383123885216472214589586756787577295904684780545900545 (0x400000000000000000000000000000000000000000001L) *)
  := (Const 383123885216472214589586756787577295904684780545900545%Z).
Notation "'0x400000000000000000000000000000000000000000001L'" (* 383123885216472214589586756787577295904684780545900545 (0x400000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffL'" (* 766247770432944429179173513575154591809369561091801087 (0x7ffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 766247770432944429179173513575154591809369561091801087%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffL'" (* 766247770432944429179173513575154591809369561091801087 (0x7ffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000000000000000000000000000000L'" (* 766247770432944429179173513575154591809369561091801088 (0x800000000000000000000000000000000000000000000L) *)
  := (Const 766247770432944429179173513575154591809369561091801088%Z).
Notation "'0x800000000000000000000000000000000000000000000L'" (* 766247770432944429179173513575154591809369561091801088 (0x800000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000000000000000000000000000000001L'" (* 766247770432944429179173513575154591809369561091801089 (0x800000000000000000000000000000000000000000001L) *)
  := (Const 766247770432944429179173513575154591809369561091801089%Z).
Notation "'0x800000000000000000000000000000000000000000001L'" (* 766247770432944429179173513575154591809369561091801089 (0x800000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffL'" (* 1532495540865888858358347027150309183618739122183602175 (0xfffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 1532495540865888858358347027150309183618739122183602175%Z).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffL'" (* 1532495540865888858358347027150309183618739122183602175 (0xfffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000000000000000000000000000000L'" (* 1532495540865888858358347027150309183618739122183602176 (0x1000000000000000000000000000000000000000000000L) *)
  := (Const 1532495540865888858358347027150309183618739122183602176%Z).
Notation "'0x1000000000000000000000000000000000000000000000L'" (* 1532495540865888858358347027150309183618739122183602176 (0x1000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000000000000000000000000000000001L'" (* 1532495540865888858358347027150309183618739122183602177 (0x1000000000000000000000000000000000000000000001L) *)
  := (Const 1532495540865888858358347027150309183618739122183602177%Z).
Notation "'0x1000000000000000000000000000000000000000000001L'" (* 1532495540865888858358347027150309183618739122183602177 (0x1000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffL'" (* 3064991081731777716716694054300618367237478244367204351 (0x1fffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 3064991081731777716716694054300618367237478244367204351%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffL'" (* 3064991081731777716716694054300618367237478244367204351 (0x1fffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000000000000000000000000000000L'" (* 3064991081731777716716694054300618367237478244367204352 (0x2000000000000000000000000000000000000000000000L) *)
  := (Const 3064991081731777716716694054300618367237478244367204352%Z).
Notation "'0x2000000000000000000000000000000000000000000000L'" (* 3064991081731777716716694054300618367237478244367204352 (0x2000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000000000000000000000000000000001L'" (* 3064991081731777716716694054300618367237478244367204353 (0x2000000000000000000000000000000000000000000001L) *)
  := (Const 3064991081731777716716694054300618367237478244367204353%Z).
Notation "'0x2000000000000000000000000000000000000000000001L'" (* 3064991081731777716716694054300618367237478244367204353 (0x2000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffL'" (* 6129982163463555433433388108601236734474956488734408703 (0x3fffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 6129982163463555433433388108601236734474956488734408703%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffL'" (* 6129982163463555433433388108601236734474956488734408703 (0x3fffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000000000000000000000000000000L'" (* 6129982163463555433433388108601236734474956488734408704 (0x4000000000000000000000000000000000000000000000L) *)
  := (Const 6129982163463555433433388108601236734474956488734408704%Z).
Notation "'0x4000000000000000000000000000000000000000000000L'" (* 6129982163463555433433388108601236734474956488734408704 (0x4000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000000000000000000000000000000001L'" (* 6129982163463555433433388108601236734474956488734408705 (0x4000000000000000000000000000000000000000000001L) *)
  := (Const 6129982163463555433433388108601236734474956488734408705%Z).
Notation "'0x4000000000000000000000000000000000000000000001L'" (* 6129982163463555433433388108601236734474956488734408705 (0x4000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffL'" (* 12259964326927110866866776217202473468949912977468817407 (0x7fffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 12259964326927110866866776217202473468949912977468817407%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffL'" (* 12259964326927110866866776217202473468949912977468817407 (0x7fffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000000000000000000000000000000L'" (* 12259964326927110866866776217202473468949912977468817408 (0x8000000000000000000000000000000000000000000000L) *)
  := (Const 12259964326927110866866776217202473468949912977468817408%Z).
Notation "'0x8000000000000000000000000000000000000000000000L'" (* 12259964326927110866866776217202473468949912977468817408 (0x8000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000000000000000000000000000000001L'" (* 12259964326927110866866776217202473468949912977468817409 (0x8000000000000000000000000000000000000000000001L) *)
  := (Const 12259964326927110866866776217202473468949912977468817409%Z).
Notation "'0x8000000000000000000000000000000000000000000001L'" (* 12259964326927110866866776217202473468949912977468817409 (0x8000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffL'" (* 24519928653854221733733552434404946937899825954937634815 (0xffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 24519928653854221733733552434404946937899825954937634815%Z).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffL'" (* 24519928653854221733733552434404946937899825954937634815 (0xffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000000000000000000000000000000000L'" (* 24519928653854221733733552434404946937899825954937634816 (0x10000000000000000000000000000000000000000000000L) *)
  := (Const 24519928653854221733733552434404946937899825954937634816%Z).
Notation "'0x10000000000000000000000000000000000000000000000L'" (* 24519928653854221733733552434404946937899825954937634816 (0x10000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000000000000000000000000000000000001L'" (* 24519928653854221733733552434404946937899825954937634817 (0x10000000000000000000000000000000000000000000001L) *)
  := (Const 24519928653854221733733552434404946937899825954937634817%Z).
Notation "'0x10000000000000000000000000000000000000000000001L'" (* 24519928653854221733733552434404946937899825954937634817 (0x10000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffL'" (* 49039857307708443467467104868809893875799651909875269631 (0x1ffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 49039857307708443467467104868809893875799651909875269631%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffL'" (* 49039857307708443467467104868809893875799651909875269631 (0x1ffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000000000000000000000000000000000L'" (* 49039857307708443467467104868809893875799651909875269632 (0x20000000000000000000000000000000000000000000000L) *)
  := (Const 49039857307708443467467104868809893875799651909875269632%Z).
Notation "'0x20000000000000000000000000000000000000000000000L'" (* 49039857307708443467467104868809893875799651909875269632 (0x20000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000000000000000000000000000000000001L'" (* 49039857307708443467467104868809893875799651909875269633 (0x20000000000000000000000000000000000000000000001L) *)
  := (Const 49039857307708443467467104868809893875799651909875269633%Z).
Notation "'0x20000000000000000000000000000000000000000000001L'" (* 49039857307708443467467104868809893875799651909875269633 (0x20000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffL'" (* 98079714615416886934934209737619787751599303819750539263 (0x3ffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 98079714615416886934934209737619787751599303819750539263%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffL'" (* 98079714615416886934934209737619787751599303819750539263 (0x3ffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000000000000000000000000000000000L'" (* 98079714615416886934934209737619787751599303819750539264 (0x40000000000000000000000000000000000000000000000L) *)
  := (Const 98079714615416886934934209737619787751599303819750539264%Z).
Notation "'0x40000000000000000000000000000000000000000000000L'" (* 98079714615416886934934209737619787751599303819750539264 (0x40000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000000000000000000000000000000000001L'" (* 98079714615416886934934209737619787751599303819750539265 (0x40000000000000000000000000000000000000000000001L) *)
  := (Const 98079714615416886934934209737619787751599303819750539265%Z).
Notation "'0x40000000000000000000000000000000000000000000001L'" (* 98079714615416886934934209737619787751599303819750539265 (0x40000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffL'" (* 196159429230833773869868419475239575503198607639501078527 (0x7ffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 196159429230833773869868419475239575503198607639501078527%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffL'" (* 196159429230833773869868419475239575503198607639501078527 (0x7ffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000000000000000000000000000000000L'" (* 196159429230833773869868419475239575503198607639501078528 (0x80000000000000000000000000000000000000000000000L) *)
  := (Const 196159429230833773869868419475239575503198607639501078528%Z).
Notation "'0x80000000000000000000000000000000000000000000000L'" (* 196159429230833773869868419475239575503198607639501078528 (0x80000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000000000000000000000000000000000001L'" (* 196159429230833773869868419475239575503198607639501078529 (0x80000000000000000000000000000000000000000000001L) *)
  := (Const 196159429230833773869868419475239575503198607639501078529%Z).
Notation "'0x80000000000000000000000000000000000000000000001L'" (* 196159429230833773869868419475239575503198607639501078529 (0x80000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffL'" (* 392318858461667547739736838950479151006397215279002157055 (0xfffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 392318858461667547739736838950479151006397215279002157055%Z).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffL'" (* 392318858461667547739736838950479151006397215279002157055 (0xfffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000000000000000000000000000000000L'" (* 392318858461667547739736838950479151006397215279002157056 (0x100000000000000000000000000000000000000000000000L) *)
  := (Const 392318858461667547739736838950479151006397215279002157056%Z).
Notation "'0x100000000000000000000000000000000000000000000000L'" (* 392318858461667547739736838950479151006397215279002157056 (0x100000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000000000000000000000000000000000001L'" (* 392318858461667547739736838950479151006397215279002157057 (0x100000000000000000000000000000000000000000000001L) *)
  := (Const 392318858461667547739736838950479151006397215279002157057%Z).
Notation "'0x100000000000000000000000000000000000000000000001L'" (* 392318858461667547739736838950479151006397215279002157057 (0x100000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffL'" (* 784637716923335095479473677900958302012794430558004314111 (0x1fffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 784637716923335095479473677900958302012794430558004314111%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffL'" (* 784637716923335095479473677900958302012794430558004314111 (0x1fffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000000000000000000000000000000000L'" (* 784637716923335095479473677900958302012794430558004314112 (0x200000000000000000000000000000000000000000000000L) *)
  := (Const 784637716923335095479473677900958302012794430558004314112%Z).
Notation "'0x200000000000000000000000000000000000000000000000L'" (* 784637716923335095479473677900958302012794430558004314112 (0x200000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000000000000000000000000000000000001L'" (* 784637716923335095479473677900958302012794430558004314113 (0x200000000000000000000000000000000000000000000001L) *)
  := (Const 784637716923335095479473677900958302012794430558004314113%Z).
Notation "'0x200000000000000000000000000000000000000000000001L'" (* 784637716923335095479473677900958302012794430558004314113 (0x200000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffL'" (* 1569275433846670190958947355801916604025588861116008628223 (0x3fffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 1569275433846670190958947355801916604025588861116008628223%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffL'" (* 1569275433846670190958947355801916604025588861116008628223 (0x3fffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000000000000000000000000000000000L'" (* 1569275433846670190958947355801916604025588861116008628224 (0x400000000000000000000000000000000000000000000000L) *)
  := (Const 1569275433846670190958947355801916604025588861116008628224%Z).
Notation "'0x400000000000000000000000000000000000000000000000L'" (* 1569275433846670190958947355801916604025588861116008628224 (0x400000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000000000000000000000000000000000001L'" (* 1569275433846670190958947355801916604025588861116008628225 (0x400000000000000000000000000000000000000000000001L) *)
  := (Const 1569275433846670190958947355801916604025588861116008628225%Z).
Notation "'0x400000000000000000000000000000000000000000000001L'" (* 1569275433846670190958947355801916604025588861116008628225 (0x400000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffL'" (* 3138550867693340381917894711603833208051177722232017256447 (0x7fffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 3138550867693340381917894711603833208051177722232017256447%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffL'" (* 3138550867693340381917894711603833208051177722232017256447 (0x7fffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000000000000000000000000000000000L'" (* 3138550867693340381917894711603833208051177722232017256448 (0x800000000000000000000000000000000000000000000000L) *)
  := (Const 3138550867693340381917894711603833208051177722232017256448%Z).
Notation "'0x800000000000000000000000000000000000000000000000L'" (* 3138550867693340381917894711603833208051177722232017256448 (0x800000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000000000000000000000000000000000001L'" (* 3138550867693340381917894711603833208051177722232017256449 (0x800000000000000000000000000000000000000000000001L) *)
  := (Const 3138550867693340381917894711603833208051177722232017256449%Z).
Notation "'0x800000000000000000000000000000000000000000000001L'" (* 3138550867693340381917894711603833208051177722232017256449 (0x800000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 6277101735386680763835789423207666416102355444464034512895 (0xffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 6277101735386680763835789423207666416102355444464034512895%Z).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 6277101735386680763835789423207666416102355444464034512895 (0xffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000000000000000000000000000000000L'" (* 6277101735386680763835789423207666416102355444464034512896 (0x1000000000000000000000000000000000000000000000000L) *)
  := (Const 6277101735386680763835789423207666416102355444464034512896%Z).
Notation "'0x1000000000000000000000000000000000000000000000000L'" (* 6277101735386680763835789423207666416102355444464034512896 (0x1000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000000000000000000000000000000000001L'" (* 6277101735386680763835789423207666416102355444464034512897 (0x1000000000000000000000000000000000000000000000001L) *)
  := (Const 6277101735386680763835789423207666416102355444464034512897%Z).
Notation "'0x1000000000000000000000000000000000000000000000001L'" (* 6277101735386680763835789423207666416102355444464034512897 (0x1000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 12554203470773361527671578846415332832204710888928069025791 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 12554203470773361527671578846415332832204710888928069025791%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 12554203470773361527671578846415332832204710888928069025791 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000000000000000000000000000000000L'" (* 12554203470773361527671578846415332832204710888928069025792 (0x2000000000000000000000000000000000000000000000000L) *)
  := (Const 12554203470773361527671578846415332832204710888928069025792%Z).
Notation "'0x2000000000000000000000000000000000000000000000000L'" (* 12554203470773361527671578846415332832204710888928069025792 (0x2000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000000000000000000000000000000000001L'" (* 12554203470773361527671578846415332832204710888928069025793 (0x2000000000000000000000000000000000000000000000001L) *)
  := (Const 12554203470773361527671578846415332832204710888928069025793%Z).
Notation "'0x2000000000000000000000000000000000000000000000001L'" (* 12554203470773361527671578846415332832204710888928069025793 (0x2000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 25108406941546723055343157692830665664409421777856138051583 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 25108406941546723055343157692830665664409421777856138051583%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 25108406941546723055343157692830665664409421777856138051583 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000000000000000000000000000000000L'" (* 25108406941546723055343157692830665664409421777856138051584 (0x4000000000000000000000000000000000000000000000000L) *)
  := (Const 25108406941546723055343157692830665664409421777856138051584%Z).
Notation "'0x4000000000000000000000000000000000000000000000000L'" (* 25108406941546723055343157692830665664409421777856138051584 (0x4000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000000000000000000000000000000000001L'" (* 25108406941546723055343157692830665664409421777856138051585 (0x4000000000000000000000000000000000000000000000001L) *)
  := (Const 25108406941546723055343157692830665664409421777856138051585%Z).
Notation "'0x4000000000000000000000000000000000000000000000001L'" (* 25108406941546723055343157692830665664409421777856138051585 (0x4000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 50216813883093446110686315385661331328818843555712276103167 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 50216813883093446110686315385661331328818843555712276103167%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 50216813883093446110686315385661331328818843555712276103167 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000000000000000000000000000000000L'" (* 50216813883093446110686315385661331328818843555712276103168 (0x8000000000000000000000000000000000000000000000000L) *)
  := (Const 50216813883093446110686315385661331328818843555712276103168%Z).
Notation "'0x8000000000000000000000000000000000000000000000000L'" (* 50216813883093446110686315385661331328818843555712276103168 (0x8000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000000000000000000000000000000000001L'" (* 50216813883093446110686315385661331328818843555712276103169 (0x8000000000000000000000000000000000000000000000001L) *)
  := (Const 50216813883093446110686315385661331328818843555712276103169%Z).
Notation "'0x8000000000000000000000000000000000000000000000001L'" (* 50216813883093446110686315385661331328818843555712276103169 (0x8000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 100433627766186892221372630771322662657637687111424552206335 (0xfffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 100433627766186892221372630771322662657637687111424552206335%Z).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 100433627766186892221372630771322662657637687111424552206335 (0xfffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000000000000000000000000000000000000L'" (* 100433627766186892221372630771322662657637687111424552206336 (0x10000000000000000000000000000000000000000000000000L) *)
  := (Const 100433627766186892221372630771322662657637687111424552206336%Z).
Notation "'0x10000000000000000000000000000000000000000000000000L'" (* 100433627766186892221372630771322662657637687111424552206336 (0x10000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000000000000000000000000000000000000001L'" (* 100433627766186892221372630771322662657637687111424552206337 (0x10000000000000000000000000000000000000000000000001L) *)
  := (Const 100433627766186892221372630771322662657637687111424552206337%Z).
Notation "'0x10000000000000000000000000000000000000000000000001L'" (* 100433627766186892221372630771322662657637687111424552206337 (0x10000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 200867255532373784442745261542645325315275374222849104412671 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 200867255532373784442745261542645325315275374222849104412671%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 200867255532373784442745261542645325315275374222849104412671 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000000000000000000000000000000000000L'" (* 200867255532373784442745261542645325315275374222849104412672 (0x20000000000000000000000000000000000000000000000000L) *)
  := (Const 200867255532373784442745261542645325315275374222849104412672%Z).
Notation "'0x20000000000000000000000000000000000000000000000000L'" (* 200867255532373784442745261542645325315275374222849104412672 (0x20000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000000000000000000000000000000000000001L'" (* 200867255532373784442745261542645325315275374222849104412673 (0x20000000000000000000000000000000000000000000000001L) *)
  := (Const 200867255532373784442745261542645325315275374222849104412673%Z).
Notation "'0x20000000000000000000000000000000000000000000000001L'" (* 200867255532373784442745261542645325315275374222849104412673 (0x20000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 401734511064747568885490523085290650630550748445698208825343 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 401734511064747568885490523085290650630550748445698208825343%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 401734511064747568885490523085290650630550748445698208825343 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000000000000000000000000000000000000L'" (* 401734511064747568885490523085290650630550748445698208825344 (0x40000000000000000000000000000000000000000000000000L) *)
  := (Const 401734511064747568885490523085290650630550748445698208825344%Z).
Notation "'0x40000000000000000000000000000000000000000000000000L'" (* 401734511064747568885490523085290650630550748445698208825344 (0x40000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000000000000000000000000000000000000001L'" (* 401734511064747568885490523085290650630550748445698208825345 (0x40000000000000000000000000000000000000000000000001L) *)
  := (Const 401734511064747568885490523085290650630550748445698208825345%Z).
Notation "'0x40000000000000000000000000000000000000000000000001L'" (* 401734511064747568885490523085290650630550748445698208825345 (0x40000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 803469022129495137770981046170581301261101496891396417650687 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 803469022129495137770981046170581301261101496891396417650687%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 803469022129495137770981046170581301261101496891396417650687 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000000000000000000000000000000000000L'" (* 803469022129495137770981046170581301261101496891396417650688 (0x80000000000000000000000000000000000000000000000000L) *)
  := (Const 803469022129495137770981046170581301261101496891396417650688%Z).
Notation "'0x80000000000000000000000000000000000000000000000000L'" (* 803469022129495137770981046170581301261101496891396417650688 (0x80000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000000000000000000000000000000000000001L'" (* 803469022129495137770981046170581301261101496891396417650689 (0x80000000000000000000000000000000000000000000000001L) *)
  := (Const 803469022129495137770981046170581301261101496891396417650689%Z).
Notation "'0x80000000000000000000000000000000000000000000000001L'" (* 803469022129495137770981046170581301261101496891396417650689 (0x80000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 1606938044258990275541962092341162602522202993782792835301375 (0xffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 1606938044258990275541962092341162602522202993782792835301375%Z).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 1606938044258990275541962092341162602522202993782792835301375 (0xffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000000000000000000000000000000000000L'" (* 1606938044258990275541962092341162602522202993782792835301376 (0x100000000000000000000000000000000000000000000000000L) *)
  := (Const 1606938044258990275541962092341162602522202993782792835301376%Z).
Notation "'0x100000000000000000000000000000000000000000000000000L'" (* 1606938044258990275541962092341162602522202993782792835301376 (0x100000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000000000000000000000000000000000000001L'" (* 1606938044258990275541962092341162602522202993782792835301377 (0x100000000000000000000000000000000000000000000000001L) *)
  := (Const 1606938044258990275541962092341162602522202993782792835301377%Z).
Notation "'0x100000000000000000000000000000000000000000000000001L'" (* 1606938044258990275541962092341162602522202993782792835301377 (0x100000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 3213876088517980551083924184682325205044405987565585670602751 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 3213876088517980551083924184682325205044405987565585670602751%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 3213876088517980551083924184682325205044405987565585670602751 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000000000000000000000000000000000000L'" (* 3213876088517980551083924184682325205044405987565585670602752 (0x200000000000000000000000000000000000000000000000000L) *)
  := (Const 3213876088517980551083924184682325205044405987565585670602752%Z).
Notation "'0x200000000000000000000000000000000000000000000000000L'" (* 3213876088517980551083924184682325205044405987565585670602752 (0x200000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000000000000000000000000000000000000001L'" (* 3213876088517980551083924184682325205044405987565585670602753 (0x200000000000000000000000000000000000000000000000001L) *)
  := (Const 3213876088517980551083924184682325205044405987565585670602753%Z).
Notation "'0x200000000000000000000000000000000000000000000000001L'" (* 3213876088517980551083924184682325205044405987565585670602753 (0x200000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 6427752177035961102167848369364650410088811975131171341205503 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 6427752177035961102167848369364650410088811975131171341205503%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 6427752177035961102167848369364650410088811975131171341205503 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000000000000000000000000000000000000L'" (* 6427752177035961102167848369364650410088811975131171341205504 (0x400000000000000000000000000000000000000000000000000L) *)
  := (Const 6427752177035961102167848369364650410088811975131171341205504%Z).
Notation "'0x400000000000000000000000000000000000000000000000000L'" (* 6427752177035961102167848369364650410088811975131171341205504 (0x400000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000000000000000000000000000000000000001L'" (* 6427752177035961102167848369364650410088811975131171341205505 (0x400000000000000000000000000000000000000000000000001L) *)
  := (Const 6427752177035961102167848369364650410088811975131171341205505%Z).
Notation "'0x400000000000000000000000000000000000000000000000001L'" (* 6427752177035961102167848369364650410088811975131171341205505 (0x400000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 12855504354071922204335696738729300820177623950262342682411007 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 12855504354071922204335696738729300820177623950262342682411007%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 12855504354071922204335696738729300820177623950262342682411007 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000000000000000000000000000000000000L'" (* 12855504354071922204335696738729300820177623950262342682411008 (0x800000000000000000000000000000000000000000000000000L) *)
  := (Const 12855504354071922204335696738729300820177623950262342682411008%Z).
Notation "'0x800000000000000000000000000000000000000000000000000L'" (* 12855504354071922204335696738729300820177623950262342682411008 (0x800000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000000000000000000000000000000000000001L'" (* 12855504354071922204335696738729300820177623950262342682411009 (0x800000000000000000000000000000000000000000000000001L) *)
  := (Const 12855504354071922204335696738729300820177623950262342682411009%Z).
Notation "'0x800000000000000000000000000000000000000000000000001L'" (* 12855504354071922204335696738729300820177623950262342682411009 (0x800000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 25711008708143844408671393477458601640355247900524685364822015 (0xfffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 25711008708143844408671393477458601640355247900524685364822015%Z).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 25711008708143844408671393477458601640355247900524685364822015 (0xfffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000000000000000000000000000000000000L'" (* 25711008708143844408671393477458601640355247900524685364822016 (0x1000000000000000000000000000000000000000000000000000L) *)
  := (Const 25711008708143844408671393477458601640355247900524685364822016%Z).
Notation "'0x1000000000000000000000000000000000000000000000000000L'" (* 25711008708143844408671393477458601640355247900524685364822016 (0x1000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000000000000000000000000000000000000001L'" (* 25711008708143844408671393477458601640355247900524685364822017 (0x1000000000000000000000000000000000000000000000000001L) *)
  := (Const 25711008708143844408671393477458601640355247900524685364822017%Z).
Notation "'0x1000000000000000000000000000000000000000000000000001L'" (* 25711008708143844408671393477458601640355247900524685364822017 (0x1000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 51422017416287688817342786954917203280710495801049370729644031 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 51422017416287688817342786954917203280710495801049370729644031%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 51422017416287688817342786954917203280710495801049370729644031 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000000000000000000000000000000000000L'" (* 51422017416287688817342786954917203280710495801049370729644032 (0x2000000000000000000000000000000000000000000000000000L) *)
  := (Const 51422017416287688817342786954917203280710495801049370729644032%Z).
Notation "'0x2000000000000000000000000000000000000000000000000000L'" (* 51422017416287688817342786954917203280710495801049370729644032 (0x2000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000000000000000000000000000000000000001L'" (* 51422017416287688817342786954917203280710495801049370729644033 (0x2000000000000000000000000000000000000000000000000001L) *)
  := (Const 51422017416287688817342786954917203280710495801049370729644033%Z).
Notation "'0x2000000000000000000000000000000000000000000000000001L'" (* 51422017416287688817342786954917203280710495801049370729644033 (0x2000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 102844034832575377634685573909834406561420991602098741459288063 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 102844034832575377634685573909834406561420991602098741459288063%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 102844034832575377634685573909834406561420991602098741459288063 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000000000000000000000000000000000000L'" (* 102844034832575377634685573909834406561420991602098741459288064 (0x4000000000000000000000000000000000000000000000000000L) *)
  := (Const 102844034832575377634685573909834406561420991602098741459288064%Z).
Notation "'0x4000000000000000000000000000000000000000000000000000L'" (* 102844034832575377634685573909834406561420991602098741459288064 (0x4000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000000000000000000000000000000000000001L'" (* 102844034832575377634685573909834406561420991602098741459288065 (0x4000000000000000000000000000000000000000000000000001L) *)
  := (Const 102844034832575377634685573909834406561420991602098741459288065%Z).
Notation "'0x4000000000000000000000000000000000000000000000000001L'" (* 102844034832575377634685573909834406561420991602098741459288065 (0x4000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 205688069665150755269371147819668813122841983204197482918576127 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 205688069665150755269371147819668813122841983204197482918576127%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 205688069665150755269371147819668813122841983204197482918576127 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000000000000000000000000000000000000L'" (* 205688069665150755269371147819668813122841983204197482918576128 (0x8000000000000000000000000000000000000000000000000000L) *)
  := (Const 205688069665150755269371147819668813122841983204197482918576128%Z).
Notation "'0x8000000000000000000000000000000000000000000000000000L'" (* 205688069665150755269371147819668813122841983204197482918576128 (0x8000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000000000000000000000000000000000000001L'" (* 205688069665150755269371147819668813122841983204197482918576129 (0x8000000000000000000000000000000000000000000000000001L) *)
  := (Const 205688069665150755269371147819668813122841983204197482918576129%Z).
Notation "'0x8000000000000000000000000000000000000000000000000001L'" (* 205688069665150755269371147819668813122841983204197482918576129 (0x8000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 411376139330301510538742295639337626245683966408394965837152255 (0xffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 411376139330301510538742295639337626245683966408394965837152255%Z).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 411376139330301510538742295639337626245683966408394965837152255 (0xffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000000000000000000000000000000000000000L'" (* 411376139330301510538742295639337626245683966408394965837152256 (0x10000000000000000000000000000000000000000000000000000L) *)
  := (Const 411376139330301510538742295639337626245683966408394965837152256%Z).
Notation "'0x10000000000000000000000000000000000000000000000000000L'" (* 411376139330301510538742295639337626245683966408394965837152256 (0x10000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000000000000000000000000000000000000000001L'" (* 411376139330301510538742295639337626245683966408394965837152257 (0x10000000000000000000000000000000000000000000000000001L) *)
  := (Const 411376139330301510538742295639337626245683966408394965837152257%Z).
Notation "'0x10000000000000000000000000000000000000000000000000001L'" (* 411376139330301510538742295639337626245683966408394965837152257 (0x10000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 822752278660603021077484591278675252491367932816789931674304511 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 822752278660603021077484591278675252491367932816789931674304511%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 822752278660603021077484591278675252491367932816789931674304511 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000000000000000000000000000000000000000L'" (* 822752278660603021077484591278675252491367932816789931674304512 (0x20000000000000000000000000000000000000000000000000000L) *)
  := (Const 822752278660603021077484591278675252491367932816789931674304512%Z).
Notation "'0x20000000000000000000000000000000000000000000000000000L'" (* 822752278660603021077484591278675252491367932816789931674304512 (0x20000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000000000000000000000000000000000000000001L'" (* 822752278660603021077484591278675252491367932816789931674304513 (0x20000000000000000000000000000000000000000000000000001L) *)
  := (Const 822752278660603021077484591278675252491367932816789931674304513%Z).
Notation "'0x20000000000000000000000000000000000000000000000000001L'" (* 822752278660603021077484591278675252491367932816789931674304513 (0x20000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 1645504557321206042154969182557350504982735865633579863348609023 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 1645504557321206042154969182557350504982735865633579863348609023%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 1645504557321206042154969182557350504982735865633579863348609023 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000000000000000000000000000000000000000L'" (* 1645504557321206042154969182557350504982735865633579863348609024 (0x40000000000000000000000000000000000000000000000000000L) *)
  := (Const 1645504557321206042154969182557350504982735865633579863348609024%Z).
Notation "'0x40000000000000000000000000000000000000000000000000000L'" (* 1645504557321206042154969182557350504982735865633579863348609024 (0x40000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000000000000000000000000000000000000000001L'" (* 1645504557321206042154969182557350504982735865633579863348609025 (0x40000000000000000000000000000000000000000000000000001L) *)
  := (Const 1645504557321206042154969182557350504982735865633579863348609025%Z).
Notation "'0x40000000000000000000000000000000000000000000000000001L'" (* 1645504557321206042154969182557350504982735865633579863348609025 (0x40000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 3291009114642412084309938365114701009965471731267159726697218047 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 3291009114642412084309938365114701009965471731267159726697218047%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 3291009114642412084309938365114701009965471731267159726697218047 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000000000000000000000000000000000000000L'" (* 3291009114642412084309938365114701009965471731267159726697218048 (0x80000000000000000000000000000000000000000000000000000L) *)
  := (Const 3291009114642412084309938365114701009965471731267159726697218048%Z).
Notation "'0x80000000000000000000000000000000000000000000000000000L'" (* 3291009114642412084309938365114701009965471731267159726697218048 (0x80000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000000000000000000000000000000000000000001L'" (* 3291009114642412084309938365114701009965471731267159726697218049 (0x80000000000000000000000000000000000000000000000000001L) *)
  := (Const 3291009114642412084309938365114701009965471731267159726697218049%Z).
Notation "'0x80000000000000000000000000000000000000000000000000001L'" (* 3291009114642412084309938365114701009965471731267159726697218049 (0x80000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 6582018229284824168619876730229402019930943462534319453394436095 (0xfffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 6582018229284824168619876730229402019930943462534319453394436095%Z).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 6582018229284824168619876730229402019930943462534319453394436095 (0xfffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000000000000000000000000000000000000000L'" (* 6582018229284824168619876730229402019930943462534319453394436096 (0x100000000000000000000000000000000000000000000000000000L) *)
  := (Const 6582018229284824168619876730229402019930943462534319453394436096%Z).
Notation "'0x100000000000000000000000000000000000000000000000000000L'" (* 6582018229284824168619876730229402019930943462534319453394436096 (0x100000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000000000000000000000000000000000000000001L'" (* 6582018229284824168619876730229402019930943462534319453394436097 (0x100000000000000000000000000000000000000000000000000001L) *)
  := (Const 6582018229284824168619876730229402019930943462534319453394436097%Z).
Notation "'0x100000000000000000000000000000000000000000000000000001L'" (* 6582018229284824168619876730229402019930943462534319453394436097 (0x100000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 13164036458569648337239753460458804039861886925068638906788872191 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 13164036458569648337239753460458804039861886925068638906788872191%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 13164036458569648337239753460458804039861886925068638906788872191 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000000000000000000000000000000000000000L'" (* 13164036458569648337239753460458804039861886925068638906788872192 (0x200000000000000000000000000000000000000000000000000000L) *)
  := (Const 13164036458569648337239753460458804039861886925068638906788872192%Z).
Notation "'0x200000000000000000000000000000000000000000000000000000L'" (* 13164036458569648337239753460458804039861886925068638906788872192 (0x200000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000000000000000000000000000000000000000001L'" (* 13164036458569648337239753460458804039861886925068638906788872193 (0x200000000000000000000000000000000000000000000000000001L) *)
  := (Const 13164036458569648337239753460458804039861886925068638906788872193%Z).
Notation "'0x200000000000000000000000000000000000000000000000000001L'" (* 13164036458569648337239753460458804039861886925068638906788872193 (0x200000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 26328072917139296674479506920917608079723773850137277813577744383 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 26328072917139296674479506920917608079723773850137277813577744383%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 26328072917139296674479506920917608079723773850137277813577744383 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000000000000000000000000000000000000000L'" (* 26328072917139296674479506920917608079723773850137277813577744384 (0x400000000000000000000000000000000000000000000000000000L) *)
  := (Const 26328072917139296674479506920917608079723773850137277813577744384%Z).
Notation "'0x400000000000000000000000000000000000000000000000000000L'" (* 26328072917139296674479506920917608079723773850137277813577744384 (0x400000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000000000000000000000000000000000000000001L'" (* 26328072917139296674479506920917608079723773850137277813577744385 (0x400000000000000000000000000000000000000000000000000001L) *)
  := (Const 26328072917139296674479506920917608079723773850137277813577744385%Z).
Notation "'0x400000000000000000000000000000000000000000000000000001L'" (* 26328072917139296674479506920917608079723773850137277813577744385 (0x400000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 52656145834278593348959013841835216159447547700274555627155488767 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 52656145834278593348959013841835216159447547700274555627155488767%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 52656145834278593348959013841835216159447547700274555627155488767 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000000000000000000000000000000000000000L'" (* 52656145834278593348959013841835216159447547700274555627155488768 (0x800000000000000000000000000000000000000000000000000000L) *)
  := (Const 52656145834278593348959013841835216159447547700274555627155488768%Z).
Notation "'0x800000000000000000000000000000000000000000000000000000L'" (* 52656145834278593348959013841835216159447547700274555627155488768 (0x800000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000000000000000000000000000000000000000001L'" (* 52656145834278593348959013841835216159447547700274555627155488769 (0x800000000000000000000000000000000000000000000000000001L) *)
  := (Const 52656145834278593348959013841835216159447547700274555627155488769%Z).
Notation "'0x800000000000000000000000000000000000000000000000000001L'" (* 52656145834278593348959013841835216159447547700274555627155488769 (0x800000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 105312291668557186697918027683670432318895095400549111254310977535 (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 105312291668557186697918027683670432318895095400549111254310977535%Z).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 105312291668557186697918027683670432318895095400549111254310977535 (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000000000000000000000000000000000000000L'" (* 105312291668557186697918027683670432318895095400549111254310977536 (0x1000000000000000000000000000000000000000000000000000000L) *)
  := (Const 105312291668557186697918027683670432318895095400549111254310977536%Z).
Notation "'0x1000000000000000000000000000000000000000000000000000000L'" (* 105312291668557186697918027683670432318895095400549111254310977536 (0x1000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000000000000000000000000000000000000000001L'" (* 105312291668557186697918027683670432318895095400549111254310977537 (0x1000000000000000000000000000000000000000000000000000001L) *)
  := (Const 105312291668557186697918027683670432318895095400549111254310977537%Z).
Notation "'0x1000000000000000000000000000000000000000000000000000001L'" (* 105312291668557186697918027683670432318895095400549111254310977537 (0x1000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 210624583337114373395836055367340864637790190801098222508621955071 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 210624583337114373395836055367340864637790190801098222508621955071%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 210624583337114373395836055367340864637790190801098222508621955071 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000000000000000000000000000000000000000L'" (* 210624583337114373395836055367340864637790190801098222508621955072 (0x2000000000000000000000000000000000000000000000000000000L) *)
  := (Const 210624583337114373395836055367340864637790190801098222508621955072%Z).
Notation "'0x2000000000000000000000000000000000000000000000000000000L'" (* 210624583337114373395836055367340864637790190801098222508621955072 (0x2000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000000000000000000000000000000000000000001L'" (* 210624583337114373395836055367340864637790190801098222508621955073 (0x2000000000000000000000000000000000000000000000000000001L) *)
  := (Const 210624583337114373395836055367340864637790190801098222508621955073%Z).
Notation "'0x2000000000000000000000000000000000000000000000000000001L'" (* 210624583337114373395836055367340864637790190801098222508621955073 (0x2000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 421249166674228746791672110734681729275580381602196445017243910143 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 421249166674228746791672110734681729275580381602196445017243910143%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 421249166674228746791672110734681729275580381602196445017243910143 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000000000000000000000000000000000000000L'" (* 421249166674228746791672110734681729275580381602196445017243910144 (0x4000000000000000000000000000000000000000000000000000000L) *)
  := (Const 421249166674228746791672110734681729275580381602196445017243910144%Z).
Notation "'0x4000000000000000000000000000000000000000000000000000000L'" (* 421249166674228746791672110734681729275580381602196445017243910144 (0x4000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000000000000000000000000000000000000000001L'" (* 421249166674228746791672110734681729275580381602196445017243910145 (0x4000000000000000000000000000000000000000000000000000001L) *)
  := (Const 421249166674228746791672110734681729275580381602196445017243910145%Z).
Notation "'0x4000000000000000000000000000000000000000000000000000001L'" (* 421249166674228746791672110734681729275580381602196445017243910145 (0x4000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 842498333348457493583344221469363458551160763204392890034487820287 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 842498333348457493583344221469363458551160763204392890034487820287%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 842498333348457493583344221469363458551160763204392890034487820287 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000000000000000000000000000000000000000L'" (* 842498333348457493583344221469363458551160763204392890034487820288 (0x8000000000000000000000000000000000000000000000000000000L) *)
  := (Const 842498333348457493583344221469363458551160763204392890034487820288%Z).
Notation "'0x8000000000000000000000000000000000000000000000000000000L'" (* 842498333348457493583344221469363458551160763204392890034487820288 (0x8000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000000000000000000000000000000000000000001L'" (* 842498333348457493583344221469363458551160763204392890034487820289 (0x8000000000000000000000000000000000000000000000000000001L) *)
  := (Const 842498333348457493583344221469363458551160763204392890034487820289%Z).
Notation "'0x8000000000000000000000000000000000000000000000000000001L'" (* 842498333348457493583344221469363458551160763204392890034487820289 (0x8000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 1684996666696914987166688442938726917102321526408785780068975640575 (0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 1684996666696914987166688442938726917102321526408785780068975640575%Z).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 1684996666696914987166688442938726917102321526408785780068975640575 (0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000000000000000000000000000000000000000000L'" (* 1684996666696914987166688442938726917102321526408785780068975640576 (0x10000000000000000000000000000000000000000000000000000000L) *)
  := (Const 1684996666696914987166688442938726917102321526408785780068975640576%Z).
Notation "'0x10000000000000000000000000000000000000000000000000000000L'" (* 1684996666696914987166688442938726917102321526408785780068975640576 (0x10000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000000000000000000000000000000000000000000001L'" (* 1684996666696914987166688442938726917102321526408785780068975640577 (0x10000000000000000000000000000000000000000000000000000001L) *)
  := (Const 1684996666696914987166688442938726917102321526408785780068975640577%Z).
Notation "'0x10000000000000000000000000000000000000000000000000000001L'" (* 1684996666696914987166688442938726917102321526408785780068975640577 (0x10000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 3369993333393829974333376885877453834204643052817571560137951281151 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 3369993333393829974333376885877453834204643052817571560137951281151%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 3369993333393829974333376885877453834204643052817571560137951281151 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000000000000000000000000000000000000000000L'" (* 3369993333393829974333376885877453834204643052817571560137951281152 (0x20000000000000000000000000000000000000000000000000000000L) *)
  := (Const 3369993333393829974333376885877453834204643052817571560137951281152%Z).
Notation "'0x20000000000000000000000000000000000000000000000000000000L'" (* 3369993333393829974333376885877453834204643052817571560137951281152 (0x20000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000000000000000000000000000000000000000000001L'" (* 3369993333393829974333376885877453834204643052817571560137951281153 (0x20000000000000000000000000000000000000000000000000000001L) *)
  := (Const 3369993333393829974333376885877453834204643052817571560137951281153%Z).
Notation "'0x20000000000000000000000000000000000000000000000000000001L'" (* 3369993333393829974333376885877453834204643052817571560137951281153 (0x20000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 6739986666787659948666753771754907668409286105635143120275902562303 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 6739986666787659948666753771754907668409286105635143120275902562303%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 6739986666787659948666753771754907668409286105635143120275902562303 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000000000000000000000000000000000000000000L'" (* 6739986666787659948666753771754907668409286105635143120275902562304 (0x40000000000000000000000000000000000000000000000000000000L) *)
  := (Const 6739986666787659948666753771754907668409286105635143120275902562304%Z).
Notation "'0x40000000000000000000000000000000000000000000000000000000L'" (* 6739986666787659948666753771754907668409286105635143120275902562304 (0x40000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000000000000000000000000000000000000000000001L'" (* 6739986666787659948666753771754907668409286105635143120275902562305 (0x40000000000000000000000000000000000000000000000000000001L) *)
  := (Const 6739986666787659948666753771754907668409286105635143120275902562305%Z).
Notation "'0x40000000000000000000000000000000000000000000000000000001L'" (* 6739986666787659948666753771754907668409286105635143120275902562305 (0x40000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 13479973333575319897333507543509815336818572211270286240551805124607 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 13479973333575319897333507543509815336818572211270286240551805124607%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 13479973333575319897333507543509815336818572211270286240551805124607 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000000000000000000000000000000000000000000L'" (* 13479973333575319897333507543509815336818572211270286240551805124608 (0x80000000000000000000000000000000000000000000000000000000L) *)
  := (Const 13479973333575319897333507543509815336818572211270286240551805124608%Z).
Notation "'0x80000000000000000000000000000000000000000000000000000000L'" (* 13479973333575319897333507543509815336818572211270286240551805124608 (0x80000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000000000000000000000000000000000000000000001L'" (* 13479973333575319897333507543509815336818572211270286240551805124609 (0x80000000000000000000000000000000000000000000000000000001L) *)
  := (Const 13479973333575319897333507543509815336818572211270286240551805124609%Z).
Notation "'0x80000000000000000000000000000000000000000000000000000001L'" (* 13479973333575319897333507543509815336818572211270286240551805124609 (0x80000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 26959946667150639794667015087019630673637144422540572481103610249215 (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 26959946667150639794667015087019630673637144422540572481103610249215%Z).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 26959946667150639794667015087019630673637144422540572481103610249215 (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000000000000000000000000000000000000000000L'" (* 26959946667150639794667015087019630673637144422540572481103610249216 (0x100000000000000000000000000000000000000000000000000000000L) *)
  := (Const 26959946667150639794667015087019630673637144422540572481103610249216%Z).
Notation "'0x100000000000000000000000000000000000000000000000000000000L'" (* 26959946667150639794667015087019630673637144422540572481103610249216 (0x100000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000000000000000000000000000000000000000000001L'" (* 26959946667150639794667015087019630673637144422540572481103610249217 (0x100000000000000000000000000000000000000000000000000000001L) *)
  := (Const 26959946667150639794667015087019630673637144422540572481103610249217%Z).
Notation "'0x100000000000000000000000000000000000000000000000000000001L'" (* 26959946667150639794667015087019630673637144422540572481103610249217 (0x100000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 53919893334301279589334030174039261347274288845081144962207220498431 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 53919893334301279589334030174039261347274288845081144962207220498431%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 53919893334301279589334030174039261347274288845081144962207220498431 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000000000000000000000000000000000000000000L'" (* 53919893334301279589334030174039261347274288845081144962207220498432 (0x200000000000000000000000000000000000000000000000000000000L) *)
  := (Const 53919893334301279589334030174039261347274288845081144962207220498432%Z).
Notation "'0x200000000000000000000000000000000000000000000000000000000L'" (* 53919893334301279589334030174039261347274288845081144962207220498432 (0x200000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000000000000000000000000000000000000000000001L'" (* 53919893334301279589334030174039261347274288845081144962207220498433 (0x200000000000000000000000000000000000000000000000000000001L) *)
  := (Const 53919893334301279589334030174039261347274288845081144962207220498433%Z).
Notation "'0x200000000000000000000000000000000000000000000000000000001L'" (* 53919893334301279589334030174039261347274288845081144962207220498433 (0x200000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 107839786668602559178668060348078522694548577690162289924414440996863 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 107839786668602559178668060348078522694548577690162289924414440996863%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 107839786668602559178668060348078522694548577690162289924414440996863 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000000000000000000000000000000000000000000L'" (* 107839786668602559178668060348078522694548577690162289924414440996864 (0x400000000000000000000000000000000000000000000000000000000L) *)
  := (Const 107839786668602559178668060348078522694548577690162289924414440996864%Z).
Notation "'0x400000000000000000000000000000000000000000000000000000000L'" (* 107839786668602559178668060348078522694548577690162289924414440996864 (0x400000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000000000000000000000000000000000000000000001L'" (* 107839786668602559178668060348078522694548577690162289924414440996865 (0x400000000000000000000000000000000000000000000000000000001L) *)
  := (Const 107839786668602559178668060348078522694548577690162289924414440996865%Z).
Notation "'0x400000000000000000000000000000000000000000000000000000001L'" (* 107839786668602559178668060348078522694548577690162289924414440996865 (0x400000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 215679573337205118357336120696157045389097155380324579848828881993727 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 215679573337205118357336120696157045389097155380324579848828881993727%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 215679573337205118357336120696157045389097155380324579848828881993727 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000000000000000000000000000000000000000000L'" (* 215679573337205118357336120696157045389097155380324579848828881993728 (0x800000000000000000000000000000000000000000000000000000000L) *)
  := (Const 215679573337205118357336120696157045389097155380324579848828881993728%Z).
Notation "'0x800000000000000000000000000000000000000000000000000000000L'" (* 215679573337205118357336120696157045389097155380324579848828881993728 (0x800000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000000000000000000000000000000000000000000001L'" (* 215679573337205118357336120696157045389097155380324579848828881993729 (0x800000000000000000000000000000000000000000000000000000001L) *)
  := (Const 215679573337205118357336120696157045389097155380324579848828881993729%Z).
Notation "'0x800000000000000000000000000000000000000000000000000000001L'" (* 215679573337205118357336120696157045389097155380324579848828881993729 (0x800000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 431359146674410236714672241392314090778194310760649159697657763987455 (0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 431359146674410236714672241392314090778194310760649159697657763987455%Z).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 431359146674410236714672241392314090778194310760649159697657763987455 (0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000000000000000000000000000000000000000000L'" (* 431359146674410236714672241392314090778194310760649159697657763987456 (0x1000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 431359146674410236714672241392314090778194310760649159697657763987456%Z).
Notation "'0x1000000000000000000000000000000000000000000000000000000000L'" (* 431359146674410236714672241392314090778194310760649159697657763987456 (0x1000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000000000000000000000000000000000000000000001L'" (* 431359146674410236714672241392314090778194310760649159697657763987457 (0x1000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 431359146674410236714672241392314090778194310760649159697657763987457%Z).
Notation "'0x1000000000000000000000000000000000000000000000000000000001L'" (* 431359146674410236714672241392314090778194310760649159697657763987457 (0x1000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 862718293348820473429344482784628181556388621521298319395315527974911 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 862718293348820473429344482784628181556388621521298319395315527974911%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 862718293348820473429344482784628181556388621521298319395315527974911 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000000000000000000000000000000000000000000L'" (* 862718293348820473429344482784628181556388621521298319395315527974912 (0x2000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 862718293348820473429344482784628181556388621521298319395315527974912%Z).
Notation "'0x2000000000000000000000000000000000000000000000000000000000L'" (* 862718293348820473429344482784628181556388621521298319395315527974912 (0x2000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000000000000000000000000000000000000000000001L'" (* 862718293348820473429344482784628181556388621521298319395315527974913 (0x2000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 862718293348820473429344482784628181556388621521298319395315527974913%Z).
Notation "'0x2000000000000000000000000000000000000000000000000000000001L'" (* 862718293348820473429344482784628181556388621521298319395315527974913 (0x2000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 1725436586697640946858688965569256363112777243042596638790631055949823 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 1725436586697640946858688965569256363112777243042596638790631055949823%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 1725436586697640946858688965569256363112777243042596638790631055949823 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000000000000000000000000000000000000000000L'" (* 1725436586697640946858688965569256363112777243042596638790631055949824 (0x4000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 1725436586697640946858688965569256363112777243042596638790631055949824%Z).
Notation "'0x4000000000000000000000000000000000000000000000000000000000L'" (* 1725436586697640946858688965569256363112777243042596638790631055949824 (0x4000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000000000000000000000000000000000000000000001L'" (* 1725436586697640946858688965569256363112777243042596638790631055949825 (0x4000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 1725436586697640946858688965569256363112777243042596638790631055949825%Z).
Notation "'0x4000000000000000000000000000000000000000000000000000000001L'" (* 1725436586697640946858688965569256363112777243042596638790631055949825 (0x4000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 3450873173395281893717377931138512726225554486085193277581262111899647 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 3450873173395281893717377931138512726225554486085193277581262111899647%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 3450873173395281893717377931138512726225554486085193277581262111899647 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000000000000000000000000000000000000000000L'" (* 3450873173395281893717377931138512726225554486085193277581262111899648 (0x8000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 3450873173395281893717377931138512726225554486085193277581262111899648%Z).
Notation "'0x8000000000000000000000000000000000000000000000000000000000L'" (* 3450873173395281893717377931138512726225554486085193277581262111899648 (0x8000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000000000000000000000000000000000000000000001L'" (* 3450873173395281893717377931138512726225554486085193277581262111899649 (0x8000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 3450873173395281893717377931138512726225554486085193277581262111899649%Z).
Notation "'0x8000000000000000000000000000000000000000000000000000000001L'" (* 3450873173395281893717377931138512726225554486085193277581262111899649 (0x8000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 6901746346790563787434755862277025452451108972170386555162524223799295 (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 6901746346790563787434755862277025452451108972170386555162524223799295%Z).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 6901746346790563787434755862277025452451108972170386555162524223799295 (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000000000000000000000000000000000000000000000L'" (* 6901746346790563787434755862277025452451108972170386555162524223799296 (0x10000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 6901746346790563787434755862277025452451108972170386555162524223799296%Z).
Notation "'0x10000000000000000000000000000000000000000000000000000000000L'" (* 6901746346790563787434755862277025452451108972170386555162524223799296 (0x10000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000000000000000000000000000000000000000000000001L'" (* 6901746346790563787434755862277025452451108972170386555162524223799297 (0x10000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 6901746346790563787434755862277025452451108972170386555162524223799297%Z).
Notation "'0x10000000000000000000000000000000000000000000000000000000001L'" (* 6901746346790563787434755862277025452451108972170386555162524223799297 (0x10000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 13803492693581127574869511724554050904902217944340773110325048447598591 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 13803492693581127574869511724554050904902217944340773110325048447598591%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 13803492693581127574869511724554050904902217944340773110325048447598591 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000000000000000000000000000000000000000000000L'" (* 13803492693581127574869511724554050904902217944340773110325048447598592 (0x20000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 13803492693581127574869511724554050904902217944340773110325048447598592%Z).
Notation "'0x20000000000000000000000000000000000000000000000000000000000L'" (* 13803492693581127574869511724554050904902217944340773110325048447598592 (0x20000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000000000000000000000000000000000000000000000001L'" (* 13803492693581127574869511724554050904902217944340773110325048447598593 (0x20000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 13803492693581127574869511724554050904902217944340773110325048447598593%Z).
Notation "'0x20000000000000000000000000000000000000000000000000000000001L'" (* 13803492693581127574869511724554050904902217944340773110325048447598593 (0x20000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 27606985387162255149739023449108101809804435888681546220650096895197183 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 27606985387162255149739023449108101809804435888681546220650096895197183%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 27606985387162255149739023449108101809804435888681546220650096895197183 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000000000000000000000000000000000000000000000L'" (* 27606985387162255149739023449108101809804435888681546220650096895197184 (0x40000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 27606985387162255149739023449108101809804435888681546220650096895197184%Z).
Notation "'0x40000000000000000000000000000000000000000000000000000000000L'" (* 27606985387162255149739023449108101809804435888681546220650096895197184 (0x40000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000000000000000000000000000000000000000000000001L'" (* 27606985387162255149739023449108101809804435888681546220650096895197185 (0x40000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 27606985387162255149739023449108101809804435888681546220650096895197185%Z).
Notation "'0x40000000000000000000000000000000000000000000000000000000001L'" (* 27606985387162255149739023449108101809804435888681546220650096895197185 (0x40000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 55213970774324510299478046898216203619608871777363092441300193790394367 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 55213970774324510299478046898216203619608871777363092441300193790394367%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 55213970774324510299478046898216203619608871777363092441300193790394367 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000000000000000000000000000000000000000000000L'" (* 55213970774324510299478046898216203619608871777363092441300193790394368 (0x80000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 55213970774324510299478046898216203619608871777363092441300193790394368%Z).
Notation "'0x80000000000000000000000000000000000000000000000000000000000L'" (* 55213970774324510299478046898216203619608871777363092441300193790394368 (0x80000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000000000000000000000000000000000000000000000001L'" (* 55213970774324510299478046898216203619608871777363092441300193790394369 (0x80000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 55213970774324510299478046898216203619608871777363092441300193790394369%Z).
Notation "'0x80000000000000000000000000000000000000000000000000000000001L'" (* 55213970774324510299478046898216203619608871777363092441300193790394369 (0x80000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 110427941548649020598956093796432407239217743554726184882600387580788735 (0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 110427941548649020598956093796432407239217743554726184882600387580788735%Z).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 110427941548649020598956093796432407239217743554726184882600387580788735 (0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000000000000000000000000000000000000000000000L'" (* 110427941548649020598956093796432407239217743554726184882600387580788736 (0x100000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 110427941548649020598956093796432407239217743554726184882600387580788736%Z).
Notation "'0x100000000000000000000000000000000000000000000000000000000000L'" (* 110427941548649020598956093796432407239217743554726184882600387580788736 (0x100000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000000000000000000000000000000000000000000000001L'" (* 110427941548649020598956093796432407239217743554726184882600387580788737 (0x100000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 110427941548649020598956093796432407239217743554726184882600387580788737%Z).
Notation "'0x100000000000000000000000000000000000000000000000000000000001L'" (* 110427941548649020598956093796432407239217743554726184882600387580788737 (0x100000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 220855883097298041197912187592864814478435487109452369765200775161577471 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 220855883097298041197912187592864814478435487109452369765200775161577471%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 220855883097298041197912187592864814478435487109452369765200775161577471 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000000000000000000000000000000000000000000000L'" (* 220855883097298041197912187592864814478435487109452369765200775161577472 (0x200000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 220855883097298041197912187592864814478435487109452369765200775161577472%Z).
Notation "'0x200000000000000000000000000000000000000000000000000000000000L'" (* 220855883097298041197912187592864814478435487109452369765200775161577472 (0x200000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000000000000000000000000000000000000000000000001L'" (* 220855883097298041197912187592864814478435487109452369765200775161577473 (0x200000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 220855883097298041197912187592864814478435487109452369765200775161577473%Z).
Notation "'0x200000000000000000000000000000000000000000000000000000000001L'" (* 220855883097298041197912187592864814478435487109452369765200775161577473 (0x200000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 441711766194596082395824375185729628956870974218904739530401550323154943 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 441711766194596082395824375185729628956870974218904739530401550323154943%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 441711766194596082395824375185729628956870974218904739530401550323154943 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000000000000000000000000000000000000000000000L'" (* 441711766194596082395824375185729628956870974218904739530401550323154944 (0x400000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 441711766194596082395824375185729628956870974218904739530401550323154944%Z).
Notation "'0x400000000000000000000000000000000000000000000000000000000000L'" (* 441711766194596082395824375185729628956870974218904739530401550323154944 (0x400000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000000000000000000000000000000000000000000000001L'" (* 441711766194596082395824375185729628956870974218904739530401550323154945 (0x400000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 441711766194596082395824375185729628956870974218904739530401550323154945%Z).
Notation "'0x400000000000000000000000000000000000000000000000000000000001L'" (* 441711766194596082395824375185729628956870974218904739530401550323154945 (0x400000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 883423532389192164791648750371459257913741948437809479060803100646309887 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 883423532389192164791648750371459257913741948437809479060803100646309887%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 883423532389192164791648750371459257913741948437809479060803100646309887 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000000000000000000000000000000000000000000000L'" (* 883423532389192164791648750371459257913741948437809479060803100646309888 (0x800000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 883423532389192164791648750371459257913741948437809479060803100646309888%Z).
Notation "'0x800000000000000000000000000000000000000000000000000000000000L'" (* 883423532389192164791648750371459257913741948437809479060803100646309888 (0x800000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000000000000000000000000000000000000000000000001L'" (* 883423532389192164791648750371459257913741948437809479060803100646309889 (0x800000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 883423532389192164791648750371459257913741948437809479060803100646309889%Z).
Notation "'0x800000000000000000000000000000000000000000000000000000000001L'" (* 883423532389192164791648750371459257913741948437809479060803100646309889 (0x800000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 1766847064778384329583297500742918515827483896875618958121606201292619775 (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 1766847064778384329583297500742918515827483896875618958121606201292619775%Z).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 1766847064778384329583297500742918515827483896875618958121606201292619775 (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000000000000000000000000000000000000000000000L'" (* 1766847064778384329583297500742918515827483896875618958121606201292619776 (0x1000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 1766847064778384329583297500742918515827483896875618958121606201292619776%Z).
Notation "'0x1000000000000000000000000000000000000000000000000000000000000L'" (* 1766847064778384329583297500742918515827483896875618958121606201292619776 (0x1000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000000000000000000000000000000000000000000000001L'" (* 1766847064778384329583297500742918515827483896875618958121606201292619777 (0x1000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 1766847064778384329583297500742918515827483896875618958121606201292619777%Z).
Notation "'0x1000000000000000000000000000000000000000000000000000000000001L'" (* 1766847064778384329583297500742918515827483896875618958121606201292619777 (0x1000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 3533694129556768659166595001485837031654967793751237916243212402585239551 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 3533694129556768659166595001485837031654967793751237916243212402585239551%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 3533694129556768659166595001485837031654967793751237916243212402585239551 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000000000000000000000000000000000000000000000L'" (* 3533694129556768659166595001485837031654967793751237916243212402585239552 (0x2000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 3533694129556768659166595001485837031654967793751237916243212402585239552%Z).
Notation "'0x2000000000000000000000000000000000000000000000000000000000000L'" (* 3533694129556768659166595001485837031654967793751237916243212402585239552 (0x2000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000000000000000000000000000000000000000000000001L'" (* 3533694129556768659166595001485837031654967793751237916243212402585239553 (0x2000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 3533694129556768659166595001485837031654967793751237916243212402585239553%Z).
Notation "'0x2000000000000000000000000000000000000000000000000000000000001L'" (* 3533694129556768659166595001485837031654967793751237916243212402585239553 (0x2000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 7067388259113537318333190002971674063309935587502475832486424805170479103 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 7067388259113537318333190002971674063309935587502475832486424805170479103%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 7067388259113537318333190002971674063309935587502475832486424805170479103 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000000000000000000000000000000000000000000000L'" (* 7067388259113537318333190002971674063309935587502475832486424805170479104 (0x4000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 7067388259113537318333190002971674063309935587502475832486424805170479104%Z).
Notation "'0x4000000000000000000000000000000000000000000000000000000000000L'" (* 7067388259113537318333190002971674063309935587502475832486424805170479104 (0x4000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000000000000000000000000000000000000000000000001L'" (* 7067388259113537318333190002971674063309935587502475832486424805170479105 (0x4000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 7067388259113537318333190002971674063309935587502475832486424805170479105%Z).
Notation "'0x4000000000000000000000000000000000000000000000000000000000001L'" (* 7067388259113537318333190002971674063309935587502475832486424805170479105 (0x4000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 14134776518227074636666380005943348126619871175004951664972849610340958207 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 14134776518227074636666380005943348126619871175004951664972849610340958207%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 14134776518227074636666380005943348126619871175004951664972849610340958207 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000000000000000000000000000000000000000000000L'" (* 14134776518227074636666380005943348126619871175004951664972849610340958208 (0x8000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 14134776518227074636666380005943348126619871175004951664972849610340958208%Z).
Notation "'0x8000000000000000000000000000000000000000000000000000000000000L'" (* 14134776518227074636666380005943348126619871175004951664972849610340958208 (0x8000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000000000000000000000000000000000000000000000001L'" (* 14134776518227074636666380005943348126619871175004951664972849610340958209 (0x8000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 14134776518227074636666380005943348126619871175004951664972849610340958209%Z).
Notation "'0x8000000000000000000000000000000000000000000000000000000000001L'" (* 14134776518227074636666380005943348126619871175004951664972849610340958209 (0x8000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 28269553036454149273332760011886696253239742350009903329945699220681916415 (0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 28269553036454149273332760011886696253239742350009903329945699220681916415%Z).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 28269553036454149273332760011886696253239742350009903329945699220681916415 (0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x10000000000000000000000000000000000000000000000000000000000000L'" (* 28269553036454149273332760011886696253239742350009903329945699220681916416 (0x10000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 28269553036454149273332760011886696253239742350009903329945699220681916416%Z).
Notation "'0x10000000000000000000000000000000000000000000000000000000000000L'" (* 28269553036454149273332760011886696253239742350009903329945699220681916416 (0x10000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x10000000000000000000000000000000000000000000000000000000000001L'" (* 28269553036454149273332760011886696253239742350009903329945699220681916417 (0x10000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 28269553036454149273332760011886696253239742350009903329945699220681916417%Z).
Notation "'0x10000000000000000000000000000000000000000000000000000000000001L'" (* 28269553036454149273332760011886696253239742350009903329945699220681916417 (0x10000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 56539106072908298546665520023773392506479484700019806659891398441363832831 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 56539106072908298546665520023773392506479484700019806659891398441363832831%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 56539106072908298546665520023773392506479484700019806659891398441363832831 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x20000000000000000000000000000000000000000000000000000000000000L'" (* 56539106072908298546665520023773392506479484700019806659891398441363832832 (0x20000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 56539106072908298546665520023773392506479484700019806659891398441363832832%Z).
Notation "'0x20000000000000000000000000000000000000000000000000000000000000L'" (* 56539106072908298546665520023773392506479484700019806659891398441363832832 (0x20000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x20000000000000000000000000000000000000000000000000000000000001L'" (* 56539106072908298546665520023773392506479484700019806659891398441363832833 (0x20000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 56539106072908298546665520023773392506479484700019806659891398441363832833%Z).
Notation "'0x20000000000000000000000000000000000000000000000000000000000001L'" (* 56539106072908298546665520023773392506479484700019806659891398441363832833 (0x20000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 113078212145816597093331040047546785012958969400039613319782796882727665663 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 113078212145816597093331040047546785012958969400039613319782796882727665663%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 113078212145816597093331040047546785012958969400039613319782796882727665663 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x40000000000000000000000000000000000000000000000000000000000000L'" (* 113078212145816597093331040047546785012958969400039613319782796882727665664 (0x40000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 113078212145816597093331040047546785012958969400039613319782796882727665664%Z).
Notation "'0x40000000000000000000000000000000000000000000000000000000000000L'" (* 113078212145816597093331040047546785012958969400039613319782796882727665664 (0x40000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x40000000000000000000000000000000000000000000000000000000000001L'" (* 113078212145816597093331040047546785012958969400039613319782796882727665665 (0x40000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 113078212145816597093331040047546785012958969400039613319782796882727665665%Z).
Notation "'0x40000000000000000000000000000000000000000000000000000000000001L'" (* 113078212145816597093331040047546785012958969400039613319782796882727665665 (0x40000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 226156424291633194186662080095093570025917938800079226639565593765455331327 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 226156424291633194186662080095093570025917938800079226639565593765455331327%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 226156424291633194186662080095093570025917938800079226639565593765455331327 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x80000000000000000000000000000000000000000000000000000000000000L'" (* 226156424291633194186662080095093570025917938800079226639565593765455331328 (0x80000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 226156424291633194186662080095093570025917938800079226639565593765455331328%Z).
Notation "'0x80000000000000000000000000000000000000000000000000000000000000L'" (* 226156424291633194186662080095093570025917938800079226639565593765455331328 (0x80000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x80000000000000000000000000000000000000000000000000000000000001L'" (* 226156424291633194186662080095093570025917938800079226639565593765455331329 (0x80000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 226156424291633194186662080095093570025917938800079226639565593765455331329%Z).
Notation "'0x80000000000000000000000000000000000000000000000000000000000001L'" (* 226156424291633194186662080095093570025917938800079226639565593765455331329 (0x80000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 452312848583266388373324160190187140051835877600158453279131187530910662655 (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 452312848583266388373324160190187140051835877600158453279131187530910662655%Z).
Notation "'0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 452312848583266388373324160190187140051835877600158453279131187530910662655 (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x100000000000000000000000000000000000000000000000000000000000000L'" (* 452312848583266388373324160190187140051835877600158453279131187530910662656 (0x100000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 452312848583266388373324160190187140051835877600158453279131187530910662656%Z).
Notation "'0x100000000000000000000000000000000000000000000000000000000000000L'" (* 452312848583266388373324160190187140051835877600158453279131187530910662656 (0x100000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x100000000000000000000000000000000000000000000000000000000000001L'" (* 452312848583266388373324160190187140051835877600158453279131187530910662657 (0x100000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 452312848583266388373324160190187140051835877600158453279131187530910662657%Z).
Notation "'0x100000000000000000000000000000000000000000000000000000000000001L'" (* 452312848583266388373324160190187140051835877600158453279131187530910662657 (0x100000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 904625697166532776746648320380374280103671755200316906558262375061821325311 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 904625697166532776746648320380374280103671755200316906558262375061821325311%Z).
Notation "'0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 904625697166532776746648320380374280103671755200316906558262375061821325311 (0x1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x200000000000000000000000000000000000000000000000000000000000000L'" (* 904625697166532776746648320380374280103671755200316906558262375061821325312 (0x200000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 904625697166532776746648320380374280103671755200316906558262375061821325312%Z).
Notation "'0x200000000000000000000000000000000000000000000000000000000000000L'" (* 904625697166532776746648320380374280103671755200316906558262375061821325312 (0x200000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x200000000000000000000000000000000000000000000000000000000000001L'" (* 904625697166532776746648320380374280103671755200316906558262375061821325313 (0x200000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 904625697166532776746648320380374280103671755200316906558262375061821325313%Z).
Notation "'0x200000000000000000000000000000000000000000000000000000000000001L'" (* 904625697166532776746648320380374280103671755200316906558262375061821325313 (0x200000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 1809251394333065553493296640760748560207343510400633813116524750123642650623 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 1809251394333065553493296640760748560207343510400633813116524750123642650623%Z).
Notation "'0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 1809251394333065553493296640760748560207343510400633813116524750123642650623 (0x3ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x400000000000000000000000000000000000000000000000000000000000000L'" (* 1809251394333065553493296640760748560207343510400633813116524750123642650624 (0x400000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 1809251394333065553493296640760748560207343510400633813116524750123642650624%Z).
Notation "'0x400000000000000000000000000000000000000000000000000000000000000L'" (* 1809251394333065553493296640760748560207343510400633813116524750123642650624 (0x400000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x400000000000000000000000000000000000000000000000000000000000001L'" (* 1809251394333065553493296640760748560207343510400633813116524750123642650625 (0x400000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 1809251394333065553493296640760748560207343510400633813116524750123642650625%Z).
Notation "'0x400000000000000000000000000000000000000000000000000000000000001L'" (* 1809251394333065553493296640760748560207343510400633813116524750123642650625 (0x400000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 3618502788666131106986593281521497120414687020801267626233049500247285301247 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 3618502788666131106986593281521497120414687020801267626233049500247285301247%Z).
Notation "'0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 3618502788666131106986593281521497120414687020801267626233049500247285301247 (0x7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x800000000000000000000000000000000000000000000000000000000000000L'" (* 3618502788666131106986593281521497120414687020801267626233049500247285301248 (0x800000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 3618502788666131106986593281521497120414687020801267626233049500247285301248%Z).
Notation "'0x800000000000000000000000000000000000000000000000000000000000000L'" (* 3618502788666131106986593281521497120414687020801267626233049500247285301248 (0x800000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x800000000000000000000000000000000000000000000000000000000000001L'" (* 3618502788666131106986593281521497120414687020801267626233049500247285301249 (0x800000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 3618502788666131106986593281521497120414687020801267626233049500247285301249%Z).
Notation "'0x800000000000000000000000000000000000000000000000000000000000001L'" (* 3618502788666131106986593281521497120414687020801267626233049500247285301249 (0x800000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 7237005577332262213973186563042994240829374041602535252466099000494570602495 (0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 7237005577332262213973186563042994240829374041602535252466099000494570602495%Z).
Notation "'0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 7237005577332262213973186563042994240829374041602535252466099000494570602495 (0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x1000000000000000000000000000000000000000000000000000000000000000L'" (* 7237005577332262213973186563042994240829374041602535252466099000494570602496 (0x1000000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 7237005577332262213973186563042994240829374041602535252466099000494570602496%Z).
Notation "'0x1000000000000000000000000000000000000000000000000000000000000000L'" (* 7237005577332262213973186563042994240829374041602535252466099000494570602496 (0x1000000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x1000000000000000000000000000000000000000000000000000000000000001L'" (* 7237005577332262213973186563042994240829374041602535252466099000494570602497 (0x1000000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 7237005577332262213973186563042994240829374041602535252466099000494570602497%Z).
Notation "'0x1000000000000000000000000000000000000000000000000000000000000001L'" (* 7237005577332262213973186563042994240829374041602535252466099000494570602497 (0x1000000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 14474011154664524427946373126085988481658748083205070504932198000989141204991 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 14474011154664524427946373126085988481658748083205070504932198000989141204991%Z).
Notation "'0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 14474011154664524427946373126085988481658748083205070504932198000989141204991 (0x1fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x2000000000000000000000000000000000000000000000000000000000000000L'" (* 14474011154664524427946373126085988481658748083205070504932198000989141204992 (0x2000000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 14474011154664524427946373126085988481658748083205070504932198000989141204992%Z).
Notation "'0x2000000000000000000000000000000000000000000000000000000000000000L'" (* 14474011154664524427946373126085988481658748083205070504932198000989141204992 (0x2000000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x2000000000000000000000000000000000000000000000000000000000000001L'" (* 14474011154664524427946373126085988481658748083205070504932198000989141204993 (0x2000000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 14474011154664524427946373126085988481658748083205070504932198000989141204993%Z).
Notation "'0x2000000000000000000000000000000000000000000000000000000000000001L'" (* 14474011154664524427946373126085988481658748083205070504932198000989141204993 (0x2000000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 28948022309329048855892746252171976963317496166410141009864396001978282409983 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 28948022309329048855892746252171976963317496166410141009864396001978282409983%Z).
Notation "'0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 28948022309329048855892746252171976963317496166410141009864396001978282409983 (0x3fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x4000000000000000000000000000000000000000000000000000000000000000L'" (* 28948022309329048855892746252171976963317496166410141009864396001978282409984 (0x4000000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 28948022309329048855892746252171976963317496166410141009864396001978282409984%Z).
Notation "'0x4000000000000000000000000000000000000000000000000000000000000000L'" (* 28948022309329048855892746252171976963317496166410141009864396001978282409984 (0x4000000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x4000000000000000000000000000000000000000000000000000000000000001L'" (* 28948022309329048855892746252171976963317496166410141009864396001978282409985 (0x4000000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 28948022309329048855892746252171976963317496166410141009864396001978282409985%Z).
Notation "'0x4000000000000000000000000000000000000000000000000000000000000001L'" (* 28948022309329048855892746252171976963317496166410141009864396001978282409985 (0x4000000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~0~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 57896044618658097711785492504343953926634992332820282019728792003956564819967 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const 57896044618658097711785492504343953926634992332820282019728792003956564819967%Z).
Notation "'0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL'" (* 57896044618658097711785492504343953926634992332820282019728792003956564819967 (0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffL) *)
  := (Const WO~0~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1~1).
Notation "'0x8000000000000000000000000000000000000000000000000000000000000000L'" (* 57896044618658097711785492504343953926634992332820282019728792003956564819968 (0x8000000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const 57896044618658097711785492504343953926634992332820282019728792003956564819968%Z).
Notation "'0x8000000000000000000000000000000000000000000000000000000000000000L'" (* 57896044618658097711785492504343953926634992332820282019728792003956564819968 (0x8000000000000000000000000000000000000000000000000000000000000000L) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0).
Notation "'0x8000000000000000000000000000000000000000000000000000000000000001L'" (* 57896044618658097711785492504343953926634992332820282019728792003956564819969 (0x8000000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const 57896044618658097711785492504343953926634992332820282019728792003956564819969%Z).
Notation "'0x8000000000000000000000000000000000000000000000000000000000000001L'" (* 57896044618658097711785492504343953926634992332820282019728792003956564819969 (0x8000000000000000000000000000000000000000000000000000000000000001L) *)
  := (Const WO~1~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~0~1).
