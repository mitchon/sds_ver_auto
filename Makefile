.PHONY: all clean install uninstall

all: output

output: myexec.o sds_ver.o elipt_cur.o hash_lib.o
	gcc -shared -o libsds_ver.so myexec.o sds_ver.o elipt_cur.o hash_lib.o -ldl -lgmp

myexec.o: myexec.c sds_ver.h
	gcc -shared -fPIC -c myexec.c -ldl -lgmp

sds_ver.o: sds_ver.c elipt_cur.h hash_lib.h
	gcc -c -fPIC sds_ver.c -lgmp

elipt_cur.o: elipt_cur.c
	gcc -c -fPIC elipt_cur.c -lgmp

hash_lib.o: hash_lib.c
	gcc -c -fPIC hash_lib.c -lgmp

clean: 
	rm *.o libsds_ver.so

install:
	install ./libsds_ver.so /usr/local/lib
	install ./sds_ver /usr/local/bin
	install -d /usr/local/etc/sds_ver
	install ./ds_params /usr/local/etc/sds_ver
	install ./public_accounts /usr/local/etc/sds_ver

uninstall:
	rm -rf /usr/local/etc/sds_ver
	rm -rf /usr/local/bin/sds_ver
	rm -rf /usr/local/lib/libsds_ver.so