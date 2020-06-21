#!/bin/sh

# And run the VM! A brief explaination of the options here:
# -enable-kvm: Use KVM for this VM (much faster for our case).
# -nographic: disable SDL graphics.
# -serial mon:stdio: use "monitored stdio" as our serial output.
# -nic: Use a TAP interface with our custom up/down scripts.
# -drive: The VM image we're booting.
# exec bash
# exec qemu-system-x86_64 -nographic -serial mon:stdio \
#    "$@" \
#    -drive format=raw

# Start the ssh server
/etc/init.d/ssh restart
/etc/init.d/binfmt-support restart

# Execute the CMD
exec "$@"
