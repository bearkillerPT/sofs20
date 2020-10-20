mkdir -p tmp
bin/createDisk tmp/original_disk 1000 2>/dev/null
bin/createDisk tmp/disk 1000 2>/dev/null
bin/mksofs -b tmp/original_disk >/dev/null
bin/mksofs -b -r 604-604 tmp/disk >/dev/null
for i in $(seq 1 4); do
  bin/showblock -i $i tmp/original_disk >>tmp/original_inode
  bin/showblock -i $i tmp/disk >>tmp/inode
done
diff tmp/original_inode tmp/inode -d >>diff_log
rm -rf tmp

mkdir -p tmp
bin/createDisk tmp/original_disk 2000 2>/dev/null
bin/createDisk tmp/disk 2000 2>/dev/null
bin/mksofs -b tmp/original_disk >/dev/null
bin/mksofs -b -r 604-604 tmp/disk >/dev/null
for i in $(seq 1 8); do
  bin/showblock -i $i tmp/original_disk >>tmp/original_inode
  bin/showblock -i $i tmp/disk >>tmp/inode
done
diff tmp/original_inode tmp/inode -d >>diff_log
rm -rf tmp
