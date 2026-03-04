// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Valu.h for the primary calling header

#include "Valu__pch.h"
#include "Valu__Syms.h"
#include "Valu___024root.h"

VL_INLINE_OPT VlCoroutine Valu___024root___eval_initial__TOP__Vtiming__0(Valu___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Valu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu___024root___eval_initial__TOP__Vtiming__0\n"); );
    // Body
    vlSymsp->_vm_contextp__->dumpfile(std::string{"alu.vcd"});
    VL_PRINTF_MT("-Info: sim/alu_tb.v:19: $dumpvar ignored, as Verilated without --trace\n");
    co_await vlSelf->__VdlySched.delay(0x2710ULL, nullptr, 
                                       "sim/alu_tb.v", 
                                       21);
    co_await vlSelf->__VdlySched.delay(0x2710ULL, nullptr, 
                                       "sim/alu_tb.v", 
                                       22);
    co_await vlSelf->__VdlySched.delay(0x2710ULL, nullptr, 
                                       "sim/alu_tb.v", 
                                       23);
    co_await vlSelf->__VdlySched.delay(0x2710ULL, nullptr, 
                                       "sim/alu_tb.v", 
                                       24);
    co_await vlSelf->__VdlySched.delay(0x2710ULL, nullptr, 
                                       "sim/alu_tb.v", 
                                       25);
    VL_FINISH_MT("sim/alu_tb.v", 27, "");
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Valu___024root___dump_triggers__act(Valu___024root* vlSelf);
#endif  // VL_DEBUG

void Valu___024root___eval_triggers__act(Valu___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Valu__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Valu___024root___eval_triggers__act\n"); );
    // Body
    vlSelf->__VactTriggered.set(0U, vlSelf->__VdlySched.awaitingCurrentTime());
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Valu___024root___dump_triggers__act(vlSelf);
    }
#endif
}
