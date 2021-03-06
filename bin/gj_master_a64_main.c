/*
 * MATLAB Compiler: 4.8 (R2008a)
 * Date: Fri Jul 11 13:58:54 2008
 * Arguments: "-B" "macro_default" "-o" "gj_master_a64" "-W" "main" "-T"
 * "link:exe" "-d" "bin" "-v" "New/gj_master.m" "-a" "New/gj_collect.m" "-a"
 * "New/gj_main.m" "-a" "New/gj_plot3dwealth.m" "-a" "New/gj_simul.m" "-a"
 * "New/gj_transition.m" "-a" "New/gj_xi.m" "-a" "New/gj_xi_disp.m" "-a"
 * "GenericFunctions/anasample2.m" "-a" "GenericFunctions/asorder.m" "-a"
 * "GenericFunctions/ChebCoefAl.m" "-a" "GenericFunctions/ChebCoef.m" "-a"
 * "GenericFunctions/feconst.m" "-a" "GenericFunctions/ginipure.m" "-a"
 * "GenericFunctions/gro2level.m" "-a" "GenericFunctions/lzgini.m" "-a"
 * "GenericFunctions/mvave2.m" "-a" "GenericFunctions/ols.m" "-a"
 * "GenericFunctions/quadlg.m" "-a" "GenericFunctions/theil.m" "-a"
 * "GenericFunctions/timedum.m" "-a" "ValuePolicyFunction/Gfai1.m" "-a"
 * "ValuePolicyFunction/Gfai2.m" "-a" "ValuePolicyFunction/Gfai3.m" "-a"
 * "ValuePolicyFunction/Gfaicrs1.m" "-a" "ValuePolicyFunction/Gfaicrs2.m" "-a"
 * "ValuePolicyFunction/Gfaicrs3.m" "-a" "ValuePolicyFunction/Gfaicrs.m" "-a"
 * "ValuePolicyFunction/Gfai.m" "-a" "ValuePolicyFunction/GJCRS.m" "-a"
 * "ValuePolicyFunction/GJcrsv.m" "-a" "ValuePolicyFunction/GJcrsw0.m" "-a"
 * "ValuePolicyFunction/gjInifuncrs.m" "-a" "ValuePolicyFunction/gjInifun.m"
 * "-a" "ValuePolicyFunction/gjk.m" "-a" "ValuePolicyFunction/GJmain1yr.m" "-a"
 * "ValuePolicyFunction/gjp.m" "-a" "ValuePolicyFunction/gjV.m" "-a"
 * "ValuePolicyFunction/gjWchebap.m" "-a" "ValuePolicyFunction/gjWo.m" "-a"
 * "ValuePolicyFunction/GJZZcrs.m" "-a" "ValuePolicyFunction/GJZZ.m" "-a"
 * "ValuePolicyFunction/LLL.m" "-a" "ValuePolicyFunction/LL.m" "-a"
 * "ValuePolicyFunction/wpcrs.m" "-a" "ValuePolicyFunction/wp.m" "-a"
 * "Simulation/ere1.m" "-a" "Simulation/ere2.m" "-a" "Simulation/ere3.m" "-a"
 * "Simulation/GJgraphRobust.m" "-a" "Simulation/gjtransLog.m" "-a"
 * "Simulation/TDrealp2.m" "-a" "Simulation/Zsffun.m" "-a"
 * "Regression/GJEngine2.m" "-a" "Regression/GJMonSimMatrix2.m" "-a"
 * "Regression/GJregFB.m" "-a" "Regression/GJregKL.m" 
 */

#include <stdio.h>
#include "mclmcrrt.h"
#ifdef __cplusplus
extern "C" {
#endif

extern mclComponentData __MCC_gj_master_a64_component_data;

#ifdef __cplusplus
}
#endif

static HMCRINSTANCE _mcr_inst = NULL;


#ifdef __cplusplus
extern "C" {
#endif

static int mclDefaultPrintHandler(const char *s)
{
  return mclWrite(1 /* stdout */, s, sizeof(char)*strlen(s));
}

#ifdef __cplusplus
} /* End extern "C" block */
#endif

#ifdef __cplusplus
extern "C" {
#endif

static int mclDefaultErrorHandler(const char *s)
{
  int written = 0;
  size_t len = 0;
  len = strlen(s);
  written = mclWrite(2 /* stderr */, s, sizeof(char)*len);
  if (len > 0 && s[ len-1 ] != '\n')
    written += mclWrite(2 /* stderr */, "\n", sizeof(char));
  return written;
}

#ifdef __cplusplus
} /* End extern "C" block */
#endif

/* This symbol is defined in shared libraries. Define it here
 * (to nothing) in case this isn't a shared library. 
 */
#ifndef LIB_gj_master_a64_C_API 
#define LIB_gj_master_a64_C_API /* No special import/export declaration */
#endif

LIB_gj_master_a64_C_API 
bool MW_CALL_CONV gj_master_a64InitializeWithHandlers(
    mclOutputHandlerFcn error_handler,
    mclOutputHandlerFcn print_handler
)
{
  if (_mcr_inst != NULL)
    return true;
  if (!mclmcrInitialize())
    return false;
  if (!mclInitializeComponentInstanceWithEmbeddedCTF(&_mcr_inst,
                                                     &__MCC_gj_master_a64_component_data,
                                                     true, NoObjectType,
                                                     ExeTarget, error_handler,
                                                     print_handler, 2037093, (void *)(gj_master_a64InitializeWithHandlers)))
    return false;
  return true;
}

LIB_gj_master_a64_C_API 
bool MW_CALL_CONV gj_master_a64Initialize(void)
{
  return gj_master_a64InitializeWithHandlers(mclDefaultErrorHandler,
                                             mclDefaultPrintHandler);
}

LIB_gj_master_a64_C_API 
void MW_CALL_CONV gj_master_a64Terminate(void)
{
  if (_mcr_inst != NULL)
    mclTerminateInstance(&_mcr_inst);
}

int run_main(int argc, const char **argv)
{
  int _retval;
  /* Generate and populate the path_to_component. */
  char path_to_component[(PATH_MAX*2)+1];
  separatePathName(argv[0], path_to_component, (PATH_MAX*2)+1);
  __MCC_gj_master_a64_component_data.path_to_component = path_to_component; 
  if (!gj_master_a64Initialize()) {
    return -1;
  }
  _retval = mclMain(_mcr_inst, argc, argv, "gj_master", 1);
  if (_retval == 0 /* no error */) mclWaitForFiguresToDie(NULL);
  gj_master_a64Terminate();
  mclTerminateApplication();
  return _retval;
}

int main(int argc, const char **argv)
{
  if (!mclInitializeApplication(
    __MCC_gj_master_a64_component_data.runtime_options,
    __MCC_gj_master_a64_component_data.runtime_option_count))
    return 0;
  
  return mclRunMain(run_main, argc, argv);
}
