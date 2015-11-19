/*
 * MATLAB Compiler: 4.7 (R2007b)
 * Date: Tue May  6 15:39:24 2008
 * Arguments: "-B" "macro_default" "-o" "gj_xi" "-W" "main" "-T" "link:exe"
 * "-d" "bin" "-v" "New/gj_xi.m" "-a" "GenericFunctions/anasample2.m" "-a"
 * "GenericFunctions/asorder.m" "-a" "GenericFunctions/ChebCoefAl.m" "-a"
 * "GenericFunctions/ChebCoef.m" "-a" "GenericFunctions/feconst.m" "-a"
 * "GenericFunctions/ginipure.m" "-a" "GenericFunctions/gro2level.m" "-a"
 * "GenericFunctions/lzgini.m" "-a" "GenericFunctions/mvave2.m" "-a"
 * "GenericFunctions/ols.m" "-a" "GenericFunctions/quadlg.m" "-a"
 * "GenericFunctions/theil.m" "-a" "GenericFunctions/timedum.m" "-a"
 * "ValuePolicyFunction/Gfai1.m" "-a" "ValuePolicyFunction/Gfai2.m" "-a"
 * "ValuePolicyFunction/Gfai3.m" "-a" "ValuePolicyFunction/Gfaicrs1.m" "-a"
 * "ValuePolicyFunction/Gfaicrs2.m" "-a" "ValuePolicyFunction/Gfaicrs3.m" "-a"
 * "ValuePolicyFunction/Gfaicrs.m" "-a" "ValuePolicyFunction/Gfai.m" "-a"
 * "ValuePolicyFunction/GJCRS.m" "-a" "ValuePolicyFunction/GJcrsv.m" "-a"
 * "ValuePolicyFunction/GJcrsw0.m" "-a" "ValuePolicyFunction/gjInifuncrs.m"
 * "-a" "ValuePolicyFunction/gjInifun.m" "-a" "ValuePolicyFunction/gjk.m" "-a"
 * "ValuePolicyFunction/GJmain1yr.m" "-a" "ValuePolicyFunction/gjp.m" "-a"
 * "ValuePolicyFunction/gjV.m" "-a" "ValuePolicyFunction/gjWchebap.m" "-a"
 * "ValuePolicyFunction/gjWo.m" "-a" "ValuePolicyFunction/GJZZcrs.m" "-a"
 * "ValuePolicyFunction/GJZZ.m" "-a" "ValuePolicyFunction/LLL.m" "-a"
 * "ValuePolicyFunction/LL.m" "-a" "ValuePolicyFunction/wpcrs.m" "-a"
 * "ValuePolicyFunction/wp.m" "-a" "Simulation/ere1.m" "-a" "Simulation/ere2.m"
 * "-a" "Simulation/ere3.m" "-a" "Simulation/GJgraphRobust.m" "-a"
 * "Simulation/gjtransLog.m" "-a" "Simulation/TDrealp2.m" "-a"
 * "Simulation/Zsffun.m" "-a" "Regression/GJEngine2.m" "-a"
 * "Regression/GJMonSimMatrix2.m" "-a" "Regression/GJregFB.m" "-a"
 * "Regression/GJregKL.m" 
 */

#include <stdio.h>
#include "mclmcr.h"
#ifdef __cplusplus
extern "C" {
#endif

extern mclComponentData __MCC_gj_xi_component_data;

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
#ifndef LIB_gj_xi_C_API 
#define LIB_gj_xi_C_API /* No special import/export declaration */
#endif

LIB_gj_xi_C_API 
bool MW_CALL_CONV gj_xiInitializeWithHandlers(
    mclOutputHandlerFcn error_handler,
    mclOutputHandlerFcn print_handler
)
{
  if (_mcr_inst != NULL)
    return true;
  if (!mclmcrInitialize())
    return false;
  if (!mclInitializeComponentInstance(&_mcr_inst, &__MCC_gj_xi_component_data,
                                      true, NoObjectType, ExeTarget,
                                      error_handler, print_handler))
    return false;
  return true;
}

LIB_gj_xi_C_API 
bool MW_CALL_CONV gj_xiInitialize(void)
{
  return gj_xiInitializeWithHandlers(mclDefaultErrorHandler,
                                     mclDefaultPrintHandler);
}

LIB_gj_xi_C_API 
void MW_CALL_CONV gj_xiTerminate(void)
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
  __MCC_gj_xi_component_data.path_to_component = path_to_component; 
  if (!gj_xiInitialize()) {
    return -1;
  }
  _retval = mclMain(_mcr_inst, argc, argv, "gj_xi", 1);
  if (_retval == 0 /* no error */) mclWaitForFiguresToDie(NULL);
  gj_xiTerminate();
  mclTerminateApplication();
  return _retval;
}

int main(int argc, const char **argv)
{
  if (!mclInitializeApplication(
    __MCC_gj_xi_component_data.runtime_options,
    __MCC_gj_xi_component_data.runtime_option_count))
    return 0;
  
  return mclRunMain(run_main, argc, argv);
}
