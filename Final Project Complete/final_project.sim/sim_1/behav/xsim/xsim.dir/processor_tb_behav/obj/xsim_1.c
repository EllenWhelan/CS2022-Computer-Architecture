/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_29(char*, char *);
extern void execute_316(char*, char *);
extern void execute_311(char*, char *);
extern void execute_314(char*, char *);
extern void execute_315(char*, char *);
extern void execute_284(char*, char *);
extern void execute_285(char*, char *);
extern void execute_34(char*, char *);
extern void execute_52(char*, char *);
extern void execute_53(char*, char *);
extern void execute_54(char*, char *);
extern void execute_55(char*, char *);
extern void execute_56(char*, char *);
extern void execute_57(char*, char *);
extern void execute_58(char*, char *);
extern void execute_59(char*, char *);
extern void execute_60(char*, char *);
extern void execute_62(char*, char *);
extern void execute_66(char*, char *);
extern void execute_273(char*, char *);
extern void execute_274(char*, char *);
extern void execute_86(char*, char *);
extern void execute_89(char*, char *);
extern void execute_90(char*, char *);
extern void execute_91(char*, char *);
extern void execute_92(char*, char *);
extern void execute_93(char*, char *);
extern void execute_94(char*, char *);
extern void execute_95(char*, char *);
extern void execute_96(char*, char *);
extern void execute_97(char*, char *);
extern void execute_98(char*, char *);
extern void execute_99(char*, char *);
extern void execute_100(char*, char *);
extern void execute_101(char*, char *);
extern void execute_102(char*, char *);
extern void execute_103(char*, char *);
extern void execute_104(char*, char *);
extern void execute_234(char*, char *);
extern void execute_235(char*, char *);
extern void execute_113(char*, char *);
extern void execute_108(char*, char *);
extern void execute_109(char*, char *);
extern void execute_237(char*, char *);
extern void execute_240(char*, char *);
extern void execute_282(char*, char *);
extern void execute_283(char*, char *);
extern void execute_289(char*, char *);
extern void execute_294(char*, char *);
extern void execute_295(char*, char *);
extern void execute_296(char*, char *);
extern void execute_299(char*, char *);
extern void execute_307(char*, char *);
extern void execute_308(char*, char *);
extern void execute_288(char*, char *);
extern void execute_291(char*, char *);
extern void execute_292(char*, char *);
extern void execute_293(char*, char *);
extern void execute_298(char*, char *);
extern void execute_301(char*, char *);
extern void execute_303(char*, char *);
extern void execute_306(char*, char *);
extern void execute_310(char*, char *);
extern void execute_313(char*, char *);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_1(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_5(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_6(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_19(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_20(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_21(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[72] = {(funcp)execute_29, (funcp)execute_316, (funcp)execute_311, (funcp)execute_314, (funcp)execute_315, (funcp)execute_284, (funcp)execute_285, (funcp)execute_34, (funcp)execute_52, (funcp)execute_53, (funcp)execute_54, (funcp)execute_55, (funcp)execute_56, (funcp)execute_57, (funcp)execute_58, (funcp)execute_59, (funcp)execute_60, (funcp)execute_62, (funcp)execute_66, (funcp)execute_273, (funcp)execute_274, (funcp)execute_86, (funcp)execute_89, (funcp)execute_90, (funcp)execute_91, (funcp)execute_92, (funcp)execute_93, (funcp)execute_94, (funcp)execute_95, (funcp)execute_96, (funcp)execute_97, (funcp)execute_98, (funcp)execute_99, (funcp)execute_100, (funcp)execute_101, (funcp)execute_102, (funcp)execute_103, (funcp)execute_104, (funcp)execute_234, (funcp)execute_235, (funcp)execute_113, (funcp)execute_108, (funcp)execute_109, (funcp)execute_237, (funcp)execute_240, (funcp)execute_282, (funcp)execute_283, (funcp)execute_289, (funcp)execute_294, (funcp)execute_295, (funcp)execute_296, (funcp)execute_299, (funcp)execute_307, (funcp)execute_308, (funcp)execute_288, (funcp)execute_291, (funcp)execute_292, (funcp)execute_293, (funcp)execute_298, (funcp)execute_301, (funcp)execute_303, (funcp)execute_306, (funcp)execute_310, (funcp)execute_313, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_1, (funcp)transaction_4, (funcp)transaction_5, (funcp)transaction_6, (funcp)transaction_19, (funcp)transaction_20, (funcp)transaction_21};
const int NumRelocateId= 72;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/processor_tb_behav/xsim.reloc",  (void **)funcTab, 72);
	iki_vhdl_file_variable_register(dp + 36368);
	iki_vhdl_file_variable_register(dp + 36424);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/processor_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/processor_tb_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/processor_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/processor_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/processor_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
