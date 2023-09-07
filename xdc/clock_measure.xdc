# set SCOPED_TO_REF for this xdc to single_clock_measurement

set_false_path -to [get_cells -filter {NAME=~*async_fd_inst && IS_SEQUENTIAL}]
