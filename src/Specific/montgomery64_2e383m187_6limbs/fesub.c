static void fesub(uint64_t out[6], const uint64_t in1[6], const uint64_t in2[6]) {
  { const uint64_t x12 = in1[5];
  { const uint64_t x13 = in1[4];
  { const uint64_t x11 = in1[3];
  { const uint64_t x9 = in1[2];
  { const uint64_t x7 = in1[1];
  { const uint64_t x5 = in1[0];
  { const uint64_t x22 = in2[5];
  { const uint64_t x23 = in2[4];
  { const uint64_t x21 = in2[3];
  { const uint64_t x19 = in2[2];
  { const uint64_t x17 = in2[1];
  { const uint64_t x15 = in2[0];
  { uint64_t x25; uint8_t x26 = _subborrow_u64(0x0, x5, x15, &x25);
  { uint64_t x28; uint8_t x29 = _subborrow_u64(x26, x7, x17, &x28);
  { uint64_t x31; uint8_t x32 = _subborrow_u64(x29, x9, x19, &x31);
  { uint64_t x34; uint8_t x35 = _subborrow_u64(x32, x11, x21, &x34);
  { uint64_t x37; uint8_t x38 = _subborrow_u64(x35, x13, x23, &x37);
  { uint64_t x40; uint8_t x41 = _subborrow_u64(x38, x12, x22, &x40);
  { uint64_t x42 = cmovznz64(x41, 0x0, 0xffffffffffffffffL);
  { uint64_t x43 = (x42 & 0xffffffffffffff45L);
  { uint64_t x45; uint8_t x46 = _addcarryx_u64(0x0, x25, x43, &x45);
  { uint64_t x47 = (x42 & 0xffffffffffffffffL);
  { uint64_t x49; uint8_t x50 = _addcarryx_u64(x46, x28, x47, &x49);
  { uint64_t x51 = (x42 & 0xffffffffffffffffL);
  { uint64_t x53; uint8_t x54 = _addcarryx_u64(x50, x31, x51, &x53);
  { uint64_t x55 = (x42 & 0xffffffffffffffffL);
  { uint64_t x57; uint8_t x58 = _addcarryx_u64(x54, x34, x55, &x57);
  { uint64_t x59 = (x42 & 0xffffffffffffffffL);
  { uint64_t x61; uint8_t x62 = _addcarryx_u64(x58, x37, x59, &x61);
  { uint64_t x63 = (x42 & 0x7fffffffffffffffL);
  { uint64_t x65; uint8_t _ = _addcarryx_u64(x62, x40, x63, &x65);
  out[0] = x45;
  out[1] = x49;
  out[2] = x53;
  out[3] = x57;
  out[4] = x61;
  out[5] = x65;
  }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
}
