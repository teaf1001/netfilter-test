all: netfilter

netfilter: nfqnl_test.o
	gcc -o nfqnl_test nfqnl_test.c -lnetfilter_queue    

clean:
	rm -f netfileter *.o