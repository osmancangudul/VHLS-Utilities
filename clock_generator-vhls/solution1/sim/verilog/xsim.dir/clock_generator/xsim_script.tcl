set_param project.enableReportConfiguration 0
load_feature core
current_fileset
xsim {clock_generator} -view {{clock_generator_dataflow_ana.wcfg}} -tclbatch {clock_generator.tcl} -protoinst {clock_generator.protoinst}
