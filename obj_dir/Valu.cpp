// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Valu__pch.h"

//============================================================
// Constructors

Valu::Valu(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Valu__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Valu::Valu(const char* _vcname__)
    : Valu(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Valu::~Valu() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Valu___024root___eval_debug_assertions(Valu___024root* vlSelf);
#endif  // VL_DEBUG
void Valu___024root___eval_static(Valu___024root* vlSelf);
void Valu___024root___eval_initial(Valu___024root* vlSelf);
void Valu___024root___eval_settle(Valu___024root* vlSelf);
void Valu___024root___eval(Valu___024root* vlSelf);

void Valu::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Valu::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Valu___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Valu___024root___eval_static(&(vlSymsp->TOP));
        Valu___024root___eval_initial(&(vlSymsp->TOP));
        Valu___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Valu___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Valu::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t Valu::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Valu::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Valu___024root___eval_final(Valu___024root* vlSelf);

VL_ATTR_COLD void Valu::final() {
    Valu___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Valu::hierName() const { return vlSymsp->name(); }
const char* Valu::modelName() const { return "Valu"; }
unsigned Valu::threads() const { return 1; }
void Valu::prepareClone() const { contextp()->prepareClone(); }
void Valu::atClone() const {
    contextp()->threadPoolpOnClone();
}

//============================================================
// Trace configuration

VL_ATTR_COLD void Valu::trace(VerilatedVcdC* tfp, int levels, int options) {
    vl_fatal(__FILE__, __LINE__, __FILE__,"'Valu::trace()' called on model that was Verilated without --trace option");
}
