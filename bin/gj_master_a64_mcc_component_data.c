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

#include "mclmcrrt.h"

#ifdef __cplusplus
extern "C" {
#endif
const unsigned char __MCC_gj_master_a64_session_key[] = {
    '8', 'E', 'C', 'E', 'D', '2', 'A', '5', 'F', '1', 'E', '2', '3', 'B', 'B',
    '6', '2', '3', 'A', '0', '6', 'B', 'C', 'A', '0', '2', '5', '8', '9', '4',
    'A', 'D', '9', 'F', '6', '6', 'C', '1', 'C', '4', '7', '8', '5', 'A', 'B',
    'F', '6', 'A', 'C', '9', '0', '5', 'F', '1', '6', '8', 'B', '6', 'E', '2',
    'C', '9', '2', 'A', '0', '8', 'C', '4', '0', '5', '5', 'D', '0', '4', 'B',
    '6', '6', '0', 'F', '1', '0', 'B', 'A', '4', 'D', '6', '6', '9', '3', '8',
    '9', 'F', '4', '8', 'E', '0', '5', '9', '8', 'B', '1', '8', 'A', '2', 'C',
    '7', '2', 'C', 'A', '5', '0', '8', '0', 'E', '2', 'E', '0', 'D', 'D', '7',
    '0', 'B', 'F', 'C', 'A', '7', '1', '0', 'A', 'C', 'C', 'C', '4', '0', 'E',
    'B', 'A', 'C', 'D', '0', '9', '0', '7', '0', 'F', '6', '4', '1', 'F', 'C',
    '3', 'E', '5', '5', 'B', '4', 'F', 'B', '4', '7', '9', 'D', '8', '9', '8',
    'F', 'F', '9', 'E', '9', '8', '6', 'C', 'D', '8', '7', 'F', 'C', 'E', '0',
    '8', '7', '9', '8', 'F', '1', '9', 'B', 'D', 'D', '7', 'B', '8', '1', '1',
    'F', 'E', '8', 'A', '5', 'B', '9', '7', 'A', '3', '1', '2', 'F', '0', 'E',
    'E', 'D', 'A', 'B', 'A', '5', '2', 'E', '9', '1', '5', '5', 'C', '0', '4',
    'B', '9', 'F', '3', '4', '2', '8', '9', 'D', '4', '2', '1', '3', '2', '0',
    '4', '1', '6', '2', 'C', '4', '9', '9', 'B', '6', '2', '7', 'E', '5', 'E',
    'E', '\0'};

const unsigned char __MCC_gj_master_a64_public_key[] = {
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

static const char * MCC_gj_master_a64_matlabpath_data[] = 
  { "gj_master_a6/", "toolbox/compiler/deploy/", "New/",
    "GenericFunctions/", "ValuePolicyFunction/", "Simulation/",
    "Regression/", "$TOOLBOXMATLABDIR/general/", "$TOOLBOXMATLABDIR/ops/",
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
    "toolbox/shared/controllib/", "toolbox/shared/dastudio/",
    "$TOOLBOXMATLABDIR/datamanager/", "toolbox/compiler/",
    "toolbox/control/control/", "toolbox/control/ctrlguis/",
    "toolbox/map/map/", "toolbox/map/mapdemos/", "toolbox/map/mapdisp/",
    "toolbox/map/mapformats/", "toolbox/map/mapproj/",
    "toolbox/shared/mapgeodesy/", "toolbox/map/maputils/",
    "toolbox/optim/optim/", "toolbox/shared/optimlib/", "toolbox/stats/" };

static const char * MCC_gj_master_a64_classpath_data[] = 
  { "java/jar/toolbox/control.jar" };

static const char * MCC_gj_master_a64_libpath_data[] = 
  { "bin/glnxa64/" };

static const char * MCC_gj_master_a64_app_opts_data[] = 
  { "" };

static const char * MCC_gj_master_a64_run_opts_data[] = 
  { "" };

static const char * MCC_gj_master_a64_warning_state_data[] = 
  { "off:MATLAB:dispatcher:nameConflict" };


mclComponentData __MCC_gj_master_a64_component_data = { 

  /* Public key data */
  __MCC_gj_master_a64_public_key,

  /* Component name */
  "gj_master_a64",

  /* Component Root */
  "",

  /* Application key data */
  __MCC_gj_master_a64_session_key,

  /* Component's MATLAB Path */
  MCC_gj_master_a64_matlabpath_data,

  /* Number of directories in the MATLAB Path */
  55,

  /* Component's Java class path */
  MCC_gj_master_a64_classpath_data,
  /* Number of directories in the Java class path */
  1,

  /* Component's load library path (for extra shared libraries) */
  MCC_gj_master_a64_libpath_data,
  /* Number of directories in the load library path */
  1,

  /* MCR instance-specific runtime options */
  MCC_gj_master_a64_app_opts_data,
  /* Number of MCR instance-specific runtime options */
  0,

  /* MCR global runtime options */
  MCC_gj_master_a64_run_opts_data,
  /* Number of MCR global runtime options */
  0,
  
  /* Component preferences directory */
  "gj_master_a6_D1D60271AA2FE0E72966E7F32D2F090C",

  /* MCR warning status data */
  MCC_gj_master_a64_warning_state_data,
  /* Number of MCR warning status modifiers */
  1,

  /* Path to component - evaluated at runtime */
  NULL

};

#ifdef __cplusplus
}
#endif


