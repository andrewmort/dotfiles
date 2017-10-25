" Vim syntax file
" Language: Adice
" Maintainer: Andrew Mort
" Latest Revision: 8/5/2015

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

syntax case ignore

" ***************** Commands *****************************
syn keyword adiceCommand alert alter beep break catch clear close 
syn keyword adiceCommand command continue define delete demand
syn keyword adiceCommand dimension display do else elseif em endcatch
syn keyword adiceCommand enddefine enddo endif endscope endwhile
syn keyword adiceCommand evaulate eval execute exit fop freq go
syn keyword adiceCommand help hhistogram histogram hplot hsmith if
syn keyword adiceCommand include inc keep label library lib load local
syn keyword adiceCommand macro mor nemo news next nic noise nsave nst
syn keyword adiceCommand open optimize parameterize parm paste path 
syn keyword adiceCommand pcap plm plot print printf probe profile pss pz
syn keyword adiceCommand quit radar randomize read reset return rot save 
syn keyword adiceCommand scandir scope sensitivity set show sim simulate 
syn keyword adiceCommand smith sprintf sscanf sweep trav traverse type
syn keyword adiceCommand unmacro unset use while window then


" ***************** Constants *****************************
syn keyword adiceConstant boltz charge ctok eps0 epsox epssil high infinity
syn keyword adiceConstant low pi platform release root2 twopi unknown


" ***************** Variables *****************************
" Limits, tolerances, convergence
syn keyword adiceVariable abstol abstolc abstolr chgtol fluxlinkagetol
syn keyword adiceVariable gmin hinit hmax hmin isw_algo itl1 itl2 itl3 itl4
syn keyword adiceVariable itlinit itlpss_fixed itlpss_newton itlss
syn keyword adiceVariable itlss2 itlss3 itlss4 limiting_alg lteratio
syn keyword adiceVariable lvldc lvldcsw lvlpss lvltim maxord method
syn keyword adiceVariable nicnstr nicnstri pss_init_periods
syn keyword adiceVariable pss_source_period_tol pssratio pzabstol pzmaxf
syn keyword adiceVariable pzmaxiter pzmaxrts pzreltol ramptime reltol
syn keyword adiceVariable reltolc reltoli reltolq reltolr reltolv
syn keyword adiceVariable savetime settletime timetol vntol vthdelta

" Printing and plotting
syn keyword adiceVariable default_bs_radix digital_grid_height
syn keyword adiceVariable draw_curve_labels label_placement
syn keyword adiceVariable label_tail_end mark_confidental 
syn keyword adiceVariable max_label_length notation number_of_fields
syn keyword adiceVariable numdigits phasemax phasewrap
syn keyword adiceVariable pss_save_periods raise_destination
syn keyword adiceVariable smith_data_type smith_freq_annot
syn keyword adiceVariable unknown_line_width complex_number_format

" Digital/Analog Conversion
syn keyword adiceVariable dynamic_logic_mode high_threshold
syn keyword adiceVariable high_voltage low_threshold low_voltage
syn keyword adiceVariable unknown_voltage

" Warnings, Erros, Debug
syn keyword adiceVariable alert_start alert_tate echo max_alert 
syn keyword adiceVariable maxcap maxinductance minresistance
syn keyword adiceVariable rot_power_names stop_on_alert swap_limit

" Other
syn keyword adiceVariable datserv_tol_factor freq monte numvers
syn keyword adiceVariable plt_numdigits quitquery runmode 
syn keyword adiceVariable save_node_aliases shared_radar 
syn keyword adiceVariable start_radar_at_go_time std_behav_model_dir
syn keyword adiceVariable std_cad_paths_dir std_script_dir
syn keyword adiceVariable tdegc time




"syn keyword adiceVariable abstol abstolc abstolr adice4_diagnostics
"syn keyword adiceVariable alert_start alert_state alert_trans
"syn keyword adiceVariable alog_file_name analog_unknown_res 
"syn keyword adiceVariable auto_rot_at_go balloon_help boltz
"syn keyword adiceVariable capacitor_current_algo charge
"syn keyword adiceVariable check_ckt_time_stamp
"syn keyword adiceVariable check_model_time_stamps chgtol
"syn keyword adiceVariable color_assignment complex_number_format
"syn keyword adiceVariable continue_on_use_error continue_on_use_interrupt
"syn keyword adiceVariable crop_on_y_relimit cs_ac_variants ctok
"syn keyword adiceVariable curve_selector_version datserv_tol_factor
"syn keyword adiceVariable dcpoly_damping dcpoly_limiting_alg defad
"syn keyword adiceVariable defas default_bus_radix default_delay_f
"syn keyword adiceVariable default_delay_r default_delay_t default_dsw_on_res
"syn keyword adiceVariable default_logic_high_res default_logic_low_res
"syn keyword adiceVariable default_plot_type defl defnrd defnrs
"syn keyword adiceVariable defw diagonal_pivoting digital_grid_height
"syn keyword adiceVariable dsw_inf_thresh draw_curve_labels draw_grid_border
"syn keyword adiceVariable draw_grid_labels draw_grid_lines draw_title_lines
"syn keyword adiceVariable dynamic_logic_capacitance dynamic_logic_mode
"syn keyword adiceVariable echo enable_cloning eps0 epsox
"syn keyword adiceVariable epssil error_on_unset_var fft_first_point
"syn keyword adiceVariable fluxlinkagetol freq function_call_limit
"syn keyword adiceVariable gmin gmintype grid_spacing high
"syn keyword adiceVariable high_threshold high_voltage hinit
"syn keyword adiceVariable hmax hmax_factor hmin hmin_diagnostic_factor
"syn keyword adiceVariable hold_nics inches_per_grid_line indep_numdigits
"syn keyword adiceVariable infinity init_debug_level init_logic_value
"syn keyword adiceVariable intercept_window_right intercept_window_width
"syn keyword adiceVariable interval isw_algo itl1 itl2 itl3 itl4
"syn keyword adiceVariable itldcsw itlpss_fixed itlpss_newton
"syn keyword adiceVariable keep_node_charge label_placement
"syn keyword adiceVariable label_tail_end limiting_alg
"syn keyword adiceVariable limiting_rev_bias logic_off_res low
"syn keyword adiceVariable low_threshold low_voltage lteratio
"syn keyword adiceVariable lte_formula lte_step_scale lvldc
"syn keyword adiceVariable lvldcsw lvlpss lvltim matrix_package_version
"syn keyword adiceVariable max_alert max_contention_messages
"syn keyword adiceVariable max_label_length max_newton_delta_v
"syn keyword adiceVariable max_sim_errors maxcap maxinductance maxord
"syn keyword adiceVariable method min_switch_contention minresistance
"syn keyword adiceVariable mindb monitor_level monte nic_expire_algo
"syn keyword adiceVariable nicnst0 nicnstr nicnstri nics_expire_time
"syn keyword adiceVariable noise_sort_order notation num_neg_scans
"syn keyword adiceVariable number_of_fields numdigits numvers
"syn keyword adiceVariable outlim_damping outlim_limiting_alg paracap
"syn keyword adiceVariable phasemax phasewrap pi platform
"syn keyword adiceVariable plot_spool_command plot_update_interval
"syn keyword adiceVariable plt_numdigits profile_count_init
"syn keyword adiceVariable profile_print_limit profile_timer_interval
"syn keyword adiceVariable pss_completed_iters pss_init_periods
"syn keyword adiceVariable pss_save_periods pss_source_period_tol
"syn keyword adiceVariable pssratio ptype quitquery rad radar_timeout
"syn keyword adiceVariable raise_destination ramptime release
"syn keyword adiceVariable reltol reltolc reltoli reltolq
"syn keyword adiceVariable reltolr reltolv restore_sweep_variable
"syn keyword adiceVariable rng_version root2 rot_power_names runmode
"syn keyword adiceVariable savetime save_node_aliases scatflg
"syn keyword adiceVariable sdf_min_typ_max sen_norm settletime
"syn keyword adiceVariable shared_radar show_cursor_channel
"syn keyword adiceVariable sim_tran_init_algo smallest_sparse_matrix
"syn keyword adiceVariable smith_chart_type smith_data_type
"syn keyword adiceVariable smith_freq_annot special_analog_grids
"syn keyword adiceVariable start_radar_at_go_time status_notation
"syn keyword adiceVariable status_numdigits std_behav_model_dir
"syn keyword adiceVariable std_script_dir stolfactor stop_on_alert
"syn keyword adiceVariable swap_limit sweep_off_storage
"syn keyword adiceVariable symbol_spacing tdegc tdevcmax time
"syn keyword adiceVariable timetol trace_file_opens traverse_limit
"syn keyword adiceVariable tref twopi umoutcurrent_abstol
"syn keyword adiceVariable umoutvoltage_abstol unknown
"syn keyword adiceVariable unknown_line_width unknown_voltage
"syn keyword adiceVariable use_adice4_diode_temp vl_pull0
"syn keyword adiceVariable vl_pull1 vl_strong0 vl_strong1 
"syn keyword adiceVariable vl_supply0 vl_supply1 vl_weak0 vl_weak1
"syn keyword adiceVariable vntol vthdelta xkfet xpndc xpntr
"


" ***************** Operators *****************************
syn keyword adiceOperator from to
syn match   adiceOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"
syn match   adiceOperator "\w\+\s*(" contains=adiceFunction

" ***************** Numbers *****************************
" Match numbers
" \<                          match start of word, and 
" [+-]\=                      match 0 or 1 of + or -, and
" [0-9_]\+                    match 1 or more of 0-9, and
" \(\.[0-9_]*\|\)             match . and 0 or more of 0-9, or
" \(e[0-9_]*\|\)              match e and 0 or more of 0-9, or
" \([tgkpnumf]\{1}[a-z]*\|\)  match match 1 eng. not. letter 
"                                followed by 0 or more leters, or
" \>                          match end of word
syn match   adiceNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\([a-zA-Z]*\|\)\>"




" ***************** Functions *****************************
" Math
syn keyword adiceFunction contained abs acos acosh arg asin asinh atan atanh
syn keyword adiceFunction contained ceil complex cos cosh exp floor imag int
syn keyword adiceFunction contained log log10 magniture max min mod phase ptat
syn keyword adiceFunction contained real round sin sinh sqrt step tan tanh
syn keyword adiceFunction contained aint derivative

" Reults Access
syn keyword adiceFunction contained current_scan dev devac devdb devdc devi 
syn keyword adiceFunction contained devm devp devr i iac idb idc ii im ip ir 
syn keyword adiceFunction contained l last_scan n sendc v vac vdb vdc vi vm 
syn keyword adiceFunction contained vp vr vv command_scan fromdatserv sen
syn keyword adiceFunction contained todatserv w

" Data and Waveform Analysis
syn keyword adiceFunction contained atod binstring bus dave db definite_integral
syn keyword adiceFunction contained deval derivative dmax dmin dtoa find first
syn keyword adiceFunction contained firstind getrange getslice group_delay
syn keyword adiceFunction contained hexstring integral last lastind logic
syn keyword adiceFunction contained octstring shift signedbus radixstring
syn keyword adiceFunction contained real rss unsignedbus waveform

" Curve Fitting
syn keyword adiceFunction contained endfit expfit exppolyfit invpolyfit
syn keyword adiceFunction contained linfit logfit logpolyfit nonlin polyfit
syn keyword adiceFunction contained powfit ratpolyfit splinefit 

" Statstical
syn keyword adiceFunction contained erf erfc gauss rand random_mismatch 
syn keyword adiceFunction contained srand uniform gauss_ar rand_ar rgauss
syn keyword adiceFunction contained rgauss_ar uniform_ar

" FFT
syn keyword adiceFunction contained fft fftdb ffti fftm fftp fftr invfft
syn keyword adiceFunction contained invfftdb invffti invfftm invfftp invfftr

" Other
syn keyword adiceFunction contained adi_array adi_data adi_file adi_info
syn keyword adiceFunction contained adi_list adi_map adi_random adi_string 
syn keyword adiceFunction contained adi_system adi_waveform
syn keyword adiceFunction contained circuit_file_name free_channel_number
syn keyword adiceFunction contained index is_array is_bus is_buswave is_complex
syn keyword adiceFunction contained is_complexwave is_fixedsize is_function
syn keyword adiceFunction contained is_logic is_logicwave is_real is_realwave
syn keyword adiceFunction contained is_set is_signed is_string is_unsigned 
syn keyword adiceFunction contained is_varsize is_wave isvalid lower size 
syn keyword adiceFunction contained string sub_array upper
syn keyword adiceFunction contained adi_clock adi_gui cpu_time datserv_process_id
syn keyword adiceFunction contained elapsed_time force_global_variable peak_dynamic_memory
syn keyword adiceFunction contained process_id program_is_x program_name program_version
syn keyword adiceFunction contained running_scan running_hier swap_available swap_used
syn keyword adiceFunction contained system_cpu_time user_cpu_time



" ***************** Todo *****************************
syn keyword adiceTodo contained TODO FIXME XXX NOTE


" ***************** Comments *****************************

" Comment starting with * and continuing through lines with &
"  ^        match start of line
"  \s*      match 0 or more whitespace
"  \*       match *
"  \(\)*    match group 0 or more times
"     .*    match any character
"     &     match &
"     \s*   match 0 or more whitespace
"     \n    match newline
"  .*       match any character
"  $        match end of line
syn match adiceComment "^\s*\*\(.*&\s*\n\)*.*$" contains=adiceTodo,@Spell
"syn match adiceComment "^\s*\*.*$" contains=adiceTodo,@Spell

" Comment from /* to */
syn region adiceComment start="/\*" end="\*/" contains=adiceTodo,@Spell


" ***************** Strings *****************************
syn region adiceString start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell


" ***************** Highlighting *****************************

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_adice_syn_inits")
   if version < 508
      let did_adice_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   HiLink adiceComment        Comment
   HiLink adiceString         String
   HiLink adiceOperator       Special
   HiLink adiceNumber         Number
   HiLink adiceFunction       Function
   HiLink adiceVariable       Identifier
   HiLink adiceConstant       Constant
   HiLink adiceCommand        Keyword
   HiLink adiceTodo           Todo

   delcommand HiLink
endif

syntax case match

let b:current_syntax = "adice"
