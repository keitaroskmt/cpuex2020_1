#include <vector>
#include <string>
#include <map>
#include "fpu.h"
#include "sim.h"
#include "ftable.h"

struct BF
{
    unsigned int m : 23;
    unsigned int e : 8;
    unsigned int s : 1;
};

typedef union
{
    struct BF b;
    unsigned int u;
    float f;
} ieee;

float fadd(fi in1, fi in2)
{
    ieee x1, x2;
    x1.u = in1.i;
    x2.u = in2.i;
    if (x1.b.e == 0)
        in1.i = 0;
    if (x2.b.e == 0)
        in2.i = 0;
    return in1.f + in2.f;
}

float fsub(fi in1, fi in2)
{
    ieee x1, x2;
    x1.u = in1.i;
    x2.u = in2.i;
    if (x1.b.e == 0)
        in1.i = 0;
    if (x2.b.e == 0)
        in2.i = 0;
    return in1.f - in2.f;
}

float fmul(fi in1, fi in2)
{
    ieee x1, x2, y;
    unsigned int e1a, e2a, ea, m, e_9, shift_e, shifted_m;
    unsigned long long int m1am2a, m1a, m2a;
    bool zero = false, subnormal = false, inf = false;
    x1.u = in1.i;
    x2.u = in2.i;
    if (x1.b.e == 0)
    {
        m1a = x1.b.m;
        e1a = 1;
    }
    else
    {
        m1a = x1.b.m + (1 << 23);
        e1a = x1.b.e;
    }
    if (x2.b.e == 0)
    {
        m2a = x2.b.m;
        e2a = 1;
    }
    else
    {
        m2a = x2.b.m + (1 << 23);
        e2a = x2.b.e;
    }
    y.b.s = x1.b.s ^ x2.b.s;
    ea = e1a + e2a;
    m1am2a = m1a * m2a;
    if (m1am2a / (1ULL << 47) == 1)
    {
        m = (m1am2a % (1ULL << 47)) >> 24;
        e_9 = ea + 1;
    }
    else if (m1am2a / (1ULL << 46) == 1)
    {
        m = (m1am2a % (1ULL << 46)) >> 23;
        e_9 = ea;
    }
    else if (m1am2a / (1ULL << 45) == 1)
    {
        m = (m1am2a % (1ULL << 45)) >> 22;
        e_9 = ea - 1;
    }
    else if (m1am2a / (1ULL << 44) == 1)
    {
        m = (m1am2a % (1ULL << 44)) >> 21;
        e_9 = ea - 2;
    }
    else
    {
        e_9 = 0;
        m = 0;
    }
    if (e_9 < 128)
        subnormal = true;
    else if (e_9 > 381)
        inf = true;

    if (subnormal)
        shift_e = 128 - e_9;
    else
        shift_e = 0;

    if (x1.b.e == 0 || (x2.b.e == 0 && (x2.b.m >> 21) == 0))
        zero = true;

    shifted_m = ((m + (1 << 23)) >> shift_e) % (1 << 23);

    if (zero)
    {
        y.b.e = 0;
        y.b.m = 0;
    }
    else if (subnormal)
    {
        y.b.e = 0;
        y.b.m = shifted_m;
    }
    else if (inf)
    {
        y.b.e = 0xff;
        y.b.m = 0;
    }
    else
    {
        y.b.e = e_9 - 127;
        y.b.m = m;
    }
    return y.f;
}

float finv(fi in)
{
    ieee x, y;
    x.u = in.i;
    unsigned long long int val;
    int key, c, d, cor_n, cor, e1, minus_e, shift_e, ans_e, m1, m2, shifted_m, ans_m;
    bool subnormal;
    key = x.b.m >> 13;
    val = finv_table[key];
    c = val >> 13;
    d = val % (1 << 13);
    cor_n = (x.b.m % (1 << 13)) * d;
    if (key < 424)
        cor = cor_n >> 12;
    else
        cor = cor_n >> 13;
    e1 = 253 - x.b.e;
    minus_e = x.b.e + 1;
    if ((x.b.e == 253 && x.b.m > 0) || x.b.e > 253)
        subnormal = true;
    else
        subnormal = false;
    shift_e = (subnormal) ? minus_e - 254 : 0;
    ans_e = (x.b.e == 0) ? x.b.e : e1;
    m1 = c - cor;
    m2 = (x.b.m == 0) ? (1 << 23) : (1 << 22) + (m1 >> 1);
    shifted_m = m2 >> shift_e;
    if (x.b.e == 0)
        ans_m = 0;
    else if (subnormal)
        ans_m = shifted_m % (1 << 23);
    else
        ans_m = m1;
    if (subnormal)
        y.u = (x.b.s << 31) + ans_m;
    else
        y.u = (x.b.s << 31) + (ans_e << 23) + ans_m;
    return y.f;
}

float fsqrt(fi in)
{
    ieee x, y;
    unsigned long long int val;
    int key, c, d, a1, a2, cor, cor_n, e0, ans_e, m1, ans_m;
    x.u = in.i;
    key = (x.u % (1 << 24)) >> 14;
    val = fsqrt_table[key];
    c = val >> 13;
    d = val % (1 << 13) + (1 << 13);
    a1 = x.b.m % (1 << 14);
    a2 = a1 << 1;
    cor_n = (key < 512) ? a2 * d : a1 * d;
    cor = cor_n >> 15;
    e0 = x.b.e + 127;
    ans_e = e0 >> 1;
    m1 = c + cor;
    ans_m = (x.b.e == 0) ? 0 : m1;
    if (x.b.e == 0)
        y.u = (x.b.s << 31) + ans_m;
    else
        y.u = (x.b.s << 31) + (ans_e << 23) + ans_m;
    return y.f;
}

float fdiv(fi in1, fi in2)
{
    fi mid;
    mid.f = finv(in2);
    return fmul(in1, mid);
}

float itof(int x)
{
    int s, k, e, m, m1;
    unsigned int ux;
    ieee y;
    s = (x < 0) ? 1 : 0;
    ux = (s) ? ~(x - 1) : abs(x);
    for (int i = 30; i >= 0; i--)
    {
        if (ux / (1 << i))
        {
            k = i;
            break;
        }
        if (i == 0)
            k = 31;
    }
    m1 = (k <= 23) ? (ux << 1) << (23 - k) : (ux << 1) >> (k - 23);
    m = (k <= 23) ? (m1 >> 1) % (1 << 23) : ((m1 + 1) >> 1) % (1 << 23);
    e = 127 + k;
    if (k == 31)
        y.u = 0;
    else
    {
        y.b.s = s;
        y.b.e = e;
        y.b.m = m;
    }

    return y.f;
}

int ftoi(fi in)
{
    unsigned long long int y1 = 0, y2 = 0, y3 = 0;
    int y;
    ieee x;
    x.u = in.i;
    if (x.b.e >= 150)
        y1 = ((((1U << 23U) + x.b.m) << 1U) << (x.b.e - 150U)) % (1LLU << 33U);
    else if (x.b.e < 126)
        y1 = 0;
    else
        y1 = ((((1U << 23U) + x.b.m) << 1U) >> (150U - x.b.e)) % (1LLU << 33U);
    y2 = y1 + 1;
    if (x.b.e >= 150 && x.b.s)
        y3 = ((y1 >> 1U) % (1U << 31U));
    else if (x.b.e >= 150)
        y3 = ((y1 >> 1U) % (1U << 31U));
    else if (x.b.s)
        y3 = ((y2 >> 1U) % (1U << 31U));
    else
        y3 = ((y2 >> 1U) % (1U << 31U));
    y = x.b.s ? -y3 : y3;
    return y;
}

float floor(fi in)
{
    unsigned int m1, m2, m3, e1;
    ieee x, y;
    x.u = in.i;
    m3 = (x.b.m >> (150 - x.b.e)) << (150 - x.b.e);
    m2 = (x.b.s && x.b.e < 150 && x.b.m != m3) ? x.b.m + (1 << (150 - x.b.e)) : x.b.m;
    m1 = (x.b.e >= 150) ? m2 : (m2 >> (150 - x.b.e)) << (150 - x.b.e);
    e1 = x.b.e + 1;
    y.u = (x.b.e >= 127 && x.b.s && (m2 / (1 << 23))) ? (x.b.s << 31) + (e1 << 23) : (x.b.e >= 127) ? (x.b.s << 31) + (x.b.e << 23) + m1 : (x.b.s && x.b.e > 0) ? (1 << 31) + (127 << 23) : 0;
    return y.f;
}