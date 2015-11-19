/*
 * MATLAB Compiler: 4.7 (R2007b)
 * Date: Sun May 11 14:34:52 2008
 * Arguments: "-B" "macro_default" "-o" "gj_collect_a64" "-W" "main" "-T"
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
const unsigned char __MCC_gj_collect_a64_session_key[] = {
    'A', 'B', 'E', '5', '8', 'B', '5', '7', '1', '9', 'D', '9', 'E', 'E', '1',
    '6', 'F', 'E', '2', '9', '8', 'C', '5', 'C', 'F', '3', 'B', 'E', '6', 'B',
    '5', '7', '2', 'A', '5', '4', '6', '4', '7', '8', '4', '9', '8', 'C', 'E',
    '1', '9', 'D', 'B', 'B', '1', '2', '2', 'F', 'A', 'A', '5', 'E', 'E', '0',
    '6', 'F', '6', 'D', '4', '5', '2', 'F', '7', '5', '4', '5', '3', '6', '4',
    '6', 'C', '0', '7', '3', 'A', '0', '9', 'D', '4', '1', '6', '3', '4', '9',
    '1', '8', 'C', '8', '3', '6', '0', '8', '7', 'E', '6', '3', '5', '9', 'B',
    '0', '6', 'E', 'F', '6', 'C', 'D', '2', 'B', '1', '3', 'A', '6', 'A', '9',
    'F', '3', '8', '5', '7', 'B', '5', 'C', '1', '6', '4', '5', '2', 'D', 'F',
    '5', '0', '3', '1', 'C', '2', '8', 'C', 'D', '6', '5', 'B', '3', 'B', 'D',
    '9', '2', '7', '6', 'E', '3', 'F', 'D', '7', 'C', 'D', '3', 'B', '0', '3',
    '8', '4', 'A', '8', '6', '4', '3', '2', '2', 'F', '1', 'A', '0', 'C', '2',
    '8', '6', '8', 'D', '5', '6', '9', 'F', '0', 'B', '0', '9', '6', 'B', 'D',
    '5', '5', '5', 'D', '1', '4', '0', '1', '8', '4', '4', '6', '8', '6', 'F',
    'A', '7', 'C', '2', '7', '8', '2', 'C', 'E', 'E', '0', 'D', '7', 'C', '9',
    'B', 'D', '1', '4', '9', '9', '8', 'A', 'A', '7', 'A', '2', '2', 'A', '6',
    'D', '5', '0', '6', '0', '2', 'E', 'D', 'D', '5', 'E', 'C', 'C', 'A', '5',
    'D', '\0'};

const unsigned char __MCC_gj_collect_a64_public_key[] = {
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

static const char * MCC_gj_collect_a64_matlabpath_data[] = 
  { "gj_collect_a64/", "toolbox/compiler/deploy/", "New/",
    "GenericFunctions/", "ValuePolicyFunction/", "Simulation/", "Regression/",
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
    "toolbox/shared/controllib/", "toolbox/shared/mapgeodesy/",
    "toolbox/control/control/", "toolbox/control/ctrlguis/",
    "toolbox/shared/optimlib/", "toolbox/map/map/", "toolbox/map/mapdemos/",
    "toolbox/map/mapdisp/", "toolbox/map/mapformats/", "toolbox/map/mapproj/",
    "toolbox/map/maputils/", "toolbox/optim/optim/" };

static const char * MCC_gj_collect_a64_classpath_data[] = 
  { "apps/steele/matlab-7.5/java/jar/toolbox/control.jar" };

static const char * MCC_gj_collect_a64_libpath_data[] = 
  { "" };

static const char * MCC_gj_collect_a64_app_opts_data[] = 
  { "" };

static const char * MCC_gj_collect_a64_run_opts_data[] = 
  { "" };

static const char * MCC_gj_collect_a64_warning_state_data[] = 
  { "off:MATLAB:dispatcher:nameConflict" };


mclComponentData __MCC_gj_collect_a64_component_data = { 

  /* Public key data */
  __MCC_gj_collect_a64_public_key,

  /* Component name */
  "gj_collect_a64",

  /* Component Root */
  "",

  /* Application key data */
  __MCC_gj_collect_a64_session_key,

  /* Component's MATLAB Path */
  MCC_gj_collect_a64_matlabpath_data,

  /* Number of directories in the MATLAB Path */
  51,

  /* Component's Java class path */
  MCC_gj_collect_a64_classpath_data,
  /* Number of directories in the Java class path */
  1,

  /* Component's load library path (for extra shared libraries) */
  MCC_gj_collect_a64_libpath_data,
  /* Number of directories in the load library path */
  0,

  /* MCR instance-specific runtime options */
  MCC_gj_collect_a64_app_opts_data,
  /* Number of MCR instance-specific runtime options */
  0,

  /* MCR global runtime options */
  MCC_gj_collect_a64_run_opts_data,
  /* Number of MCR global runtime options */
  0,
  
  /* Component preferences directory */
  "gj_collect_a64_02F5DB10D048E86A936C4345DE2A6CB4",

  /* MCR warning status data */
  MCC_gj_collect_a64_warning_state_data,
  /* Number of MCR warning status modifiers */
  1,

  /* Path to component - evaluated at runtime */
  NULL

};

#ifdef __cplusplus
}
#endif


