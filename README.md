# K210-2
fully working tree for BQ 5519g
this gave an error
# Cmdline
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
changed to what was in the native recovery and started
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_CMDLINE += buildvariant=user 
