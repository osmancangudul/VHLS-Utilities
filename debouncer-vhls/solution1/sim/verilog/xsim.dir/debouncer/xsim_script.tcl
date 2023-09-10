set_param project.enableReportConfiguration 0
load_feature core
current_fileset
xsim {debouncer} -view {{debouncer_dataflow_ana.wcfg}} -tclbatch {debouncer.tcl} -protoinst {debouncer.protoinst}
