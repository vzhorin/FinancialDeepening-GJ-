/*
 * MATLAB Compiler: 4.7 (R2007b)
 * Date: Tue May  6 14:25:45 2008
 * Arguments: "-B" "macro_default" "-o" "gj_collect" "-W" "main" "-T"
 * "link:exe" "-d" "bin" "-v" "New/gj_collect.m" "-a"
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

#include "mclmcr.h"

#ifdef __cplusplus
extern "C" {
#endif
const unsigned char __MCC_gj_collect_session_key[] = {
    'B', '0', '9', 'E', '8', '0', 'E', 'B', 'D', '9', '0', 'E', 'D', 'F', '9',
    'C', 'B', 'C', '1', '5', 'B', '4', '3', '0', 'E', 'E', '8', '2', '9', '1',
    '4', '1', '8', '2', '0', '9', '1', '7', 'B', 'E', '3', 'F', 'F', '1', '5',
    'A', '3', 'F', '3', 'C', '4', '6', 'A', '4', '7', '5', 'D', '1', '6', '4',
    'C', '3', 'B', '7', 'F', '2', '8', 'E', 'B', '1', '6', '7', '9', '2', '2',
    'D', '7', 'C', 'A', '6', '7', '9', '8', '4', '5', '2', 'F', 'A', 'A', 'A',
    '5', '5', 'E', '0', '8', 'E', '2', 'F', 'D', '5', '4', '3', '8', '6', '4',
    '2', '2', '6', '8', '7', 'D', '3', '5', '5', 'F', '5', '5', 'F', 'E', '2',
    'E', '9', 'C', '1', 'E', '4', '9', '2', 'B', 'D', '3', '4', 'B', 'C', '1',
    'E', '0', '0', '3', '0', 'E', '0', 'F', 'A', '6', 'C', '7', '9', '7', 'F',
    '2', '7', '3', '8', '8', '3', '2', 'C', '9', '8', '5', '0', '7', 'C', 'C',
    '0', 'C', 'C', '9', '5', '3', 'C', '7', '8', '6', '8', 'F', 'E', '9', 'B',
    '6', 'A', 'D', 'D', 'E', '8', '2', 'F', '4', '0', '0', 'D', 'C', '2', 'F',
    '1', 'B', 'F', '9', '5', '9', 'F', 'D', '2', '9', 'D', '0', '3', 'E', 'C',
    '7', '4', 'C', 'E', '6', '5', '7', '2', 'C', 'A', 'F', '5', 'C', 'F', '1',
    '6', '4', 'E', '7', '2', '4', 'B', '6', 'B', '1', 'A', '2', 'E', '1', 'A',
    'A', '2', 'F', '8', '6', '6', '8', '8', '3', 'D', 'D', '0', '3', '1', '0',
    '5', '\0'};

const unsigned char __MCC_gj_collect_public_key[] = {
    '3', '0', '8', '1', '9', 'D', '3', '0', '0', 'D', '0', '6', '0', '9', '2',
    'A', '8', '6', '4', '8', '8', '6', 'F', '7', '0', 'D', '0', '1', '0', '1',
    '0', '1', '0', '5', '0', '0', '0', '3', '8', '1', '8', 'B', '0', '0', '3',
    '0', '8', '1', '8', '7', '0', '2', '8', '1', '8', '1', '0', '0', 'C', '4',
    '9', 'C', 'A', 'C', '3', '4', 'E', 'D', '1', '3', 'A', '5', '2', '0', '6',
    '5', '8', 'F', '6', 'F', '8', 'E', '0', '1', '3', '8', 'C', '4', '3', '1',
    '5', 'B', '4', '3', '1', '5', '2', '7', '7', 'E', 'D', '3', 'F', '7', 'D',
    'A', 'E', '5', '3', '0', '9', '9', 'D', 'B', '0', '8', 'E', 'E', '5', '8',
    '9', 'F', '8', '0', '4', 'D', '4', 'B', '9', '8', '1', '3', '2', '6', 'A',
    '5', '2', 'C', 'C', 'E', '4', '3', '8', '2', 'E', '9', 'F', '2', 'B', '4',
    'D', '0', '8', '5', 'E', 'B', '9', '5', '0', 'C', '7', 'A', 'B', '1', '2',
    'E', 'D', 'E', '2', 'D', '4', '1', '2', '9', '7', '8', '2', '0', 'E', '6',
    '3', '7', '7', 'A', '5', 'F', 'E', 'B', '5', '6', '8', '9', 'D', '4', 'E',
    '6', '0', '3', '2', 'F', '6', '0', 'C', '4', '3', '0', '7', '4', 'A', '0',
    '4', 'C', '2', '6', 'A', 'B', '7', '2', 'F', '5', '4', 'B', '5', '1', 'B',
    'B', '4', '6', '0', '5', '7', '8', '7', '8', '5', 'B', '1', '9', '9', '0',
    '1', '4', '3', '1', '4', 'A', '6', '5', 'F', '0', '9', '0', 'B', '6', '1',
    'F', 'C', '2', '0', '1', '6', '9', '4', '5', '3', 'B', '5', '8', 'F', 'C',
    '8', 'B', 'A', '4', '3', 'E', '6', '7', '7', '6', 'E', 'B', '7', 'E', 'C',
    'D', '3', '1', '7', '8', 'B', '5', '6', 'A', 'B', '0', 'F', 'A', '0', '6',
    'D', 'D', '6', '4', '9', '6', '7', 'C', 'B', '1', '4', '9', 'E', '5', '0',
    '2', '0', '1', '1', '1', '\0'};

static const char * MCC_gj_collect_matlabpath_data[] = 
  { "gj_collect/", "toolbox/compiler/deploy/", "New/", "GenericFunctions/",
    "ValuePolicyFunction/", "Simulation/", "Regression/",
    "autonfs/home/tiberius/local/ECON/lp_solve_5.5/extra/MATLAB/lpsolve/",
    "$TOOLBOXMATLABDIR/general/", "$TOOLBOXMATLABDIR/ops/",
    "$TOOLBOXMATLABDIR/lang/", "$TOOLBOXMATLABDIR/elmat/",
    "$TOOLBOXMATLABDIR/elfun/", "$TOOLBOXMATLABDIR/specfun/",
    "$TOOLBOXMATLABDIR/matfun/", "$TOOLBOXMATLABDIR/datafun/",
    "$TOOLBOXMATLABDIR/polyfun/", "$TOOLBOXMATLABDIR/funfun/",
    "$TOOLBOXMATLABDIR/sparfun/", "$TOOLBOXMATLABDIR/scribe/",
    "$TOOLBOXMATLABDIR/graph2d/", "$TOOLBOXMATLABDIR/graph3d/",
    "$TOOLBOXMATLABDIR/specgraph/", "$TOOLBOXMATLABDIR/graphics/",
    "$TOOLBOXMATLABDIR/uitools/", "$TOOLBOXMATLABDIR/strfun/",
    "$TOOLBOXMATLABDIR/imagesci/", "$TOOLBOXMATLABDIR/iofun/",
    "$TOOLBOXMATLABDIR/audiovideo/", "$TOOLBOXMATLABDIR/timefun/",
    "$TOOLBOXMATLABDIR/datatypes/", "$TOOLBOXMATLABDIR/verctrl/",
    "$TOOLBOXMATLABDIR/codetools/", "$TOOLBOXMATLABDIR/helptools/",
    "$TOOLBOXMATLABDIR/demos/", "$TOOLBOXMATLABDIR/timeseries/",
    "$TOOLBOXMATLABDIR/hds/", "$TOOLBOXMATLABDIR/guide/",
    "$TOOLBOXMATLABDIR/plottools/", "toolbox/local/",
    "toolbox/shared/controllib/", "toolbox/control/control/",
    "toolbox/control/ctrlguis/", "toolbox/map/map/", "toolbox/map/mapdemos/",
    "toolbox/map/mapdisp/", "toolbox/map/mapformats/", "toolbox/map/mapproj/",
    "toolbox/shared/mapgeodesy/", "toolbox/map/maputils/",
    "toolbox/optim/optim/", "toolbox/shared/optimlib/" };

static const char * MCC_gj_collect_classpath_data[] = 
  { "java/jar/toolbox/control.jar" };

static const char * MCC_gj_collect_libpath_data[] = 
  { "bin/glnx86/" };

static const char * MCC_gj_collect_app_opts_data[] = 
  { "" };

static const char * MCC_gj_collect_run_opts_data[] = 
  { "" };

static const char * MCC_gj_collect_warning_state_data[] = 
  { "off:MATLAB:dispatcher:nameConflict" };


mclComponentData __MCC_gj_collect_component_data = { 

  /* Public key data */
  __MCC_gj_collect_public_key,

  /* Component name */
  "gj_collect",

  /* Component Root */
  "",

  /* Application key data */
  __MCC_gj_collect_session_key,

  /* Component's MATLAB Path */
  MCC_gj_collect_matlabpath_data,

  /* Number of directories in the MATLAB Path */
  52,

  /* Component's Java class path */
  MCC_gj_collect_classpath_data,
  /* Number of directories in the Java class path */
  1,

  /* Component's load library path (for extra shared libraries) */
  MCC_gj_collect_libpath_data,
  /* Number of directories in the load library path */
  1,

  /* MCR instance-specific runtime options */
  MCC_gj_collect_app_opts_data,
  /* Number of MCR instance-specific runtime options */
  0,

  /* MCR global runtime options */
  MCC_gj_collect_run_opts_data,
  /* Number of MCR global runtime options */
  0,
  
  /* Component preferences directory */
  "gj_collect_AF7B5447D0EB8035E8EB12F7653B5AFF",

  /* MCR warning status data */
  MCC_gj_collect_warning_state_data,
  /* Number of MCR warning status modifiers */
  1,

  /* Path to component - evaluated at runtime */
  NULL

};

#ifdef __cplusplus
}
#endif


